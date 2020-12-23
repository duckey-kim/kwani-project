package com.kwani.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.MyBatisSystemException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;
import com.kwani.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@Transactional
public class MyPageServiceImpl implements MyPageService {

	private MyPageMapper myPageMapper;

	// 트랙에 곡 삽입
	@Override
	public void insertTrackList(Set<Integer> checkedTrackList, Integer plylstId, String email) {
		
		Set<Integer> tmpList = checkedTrackList;
		List<Integer> playlistTrackList = myPageMapper.getPlaylistTrackList(plylstId, email);
		
		// 중복체크 : 플레이리스트에 곡이 존재하는 경우에만
		if(playlistTrackList.size() != 0) {
			// TODO : 초깃값 변경
			tmpList = new HashSet<>();
			for(Integer trackId : checkedTrackList) {
				if(playlistTrackList.contains(trackId)) continue; // 플레이리스트에 곡이 존재하고, tmpList에 곡이 존재하면 continue
				tmpList.add(trackId);				
			}
		}
			
		// 중복없는 trackId 값 Insert
		for(Integer trackId : tmpList) {
			myPageMapper.insertTrack(plylstId, trackId);
		}
		
	}

	// 플레이리스트 있는지 여부 체크
	@Override
	public boolean checkValidPlaylist(Integer plylstId, String email) {
		if(myPageMapper.getOnePlaylist(plylstId, email) == null) {
			return false;
		}
		return true;
	}
	
	// 플레이리스트 안에 이 곡이 있는지 확인
	public boolean checkValidTrackInPlaylist(Integer plylstId, Integer trackId) {
		if(myPageMapper.getOneTrackInPlaylist(plylstId, trackId) == null) {
			return false;
		}
		return true;
	}

	// 플레이리스트 이미지 수정
	@Override
	public int modifyPlaylistImg(Integer plylstId, Integer trackId) {
		return myPageMapper.updatePlaylistImg(plylstId, trackId);
	}
	
	// 플레이리스트 이미지 기본 저장
	@Override
	public int modifyPlaylistBasicImg(Integer plylstId) {
		return myPageMapper.updatePlaylistBasicImg(plylstId);
	}
	
	@Override
	public List<Map<String, String>> getListLibrary(String email) {

		log.info("getList Library...");

		List<Map<String, String>> libraryList = myPageMapper.getListLibrary(email);
		List<Map<String, String>> LikedTrackList = myPageMapper.getLikedTrackList(email);

		// 최근 들은 곡
		// 1일 이내 들은 경우 : 시간(몇시간 전에 들었는지)
		// 1일 이후 들은 경우 : 날짜

		// 현재 시간
		LocalDateTime timeNow = LocalDateTime.now();

		DateTimeFormatter myFormat1 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		DateTimeFormatter myFormat2 = DateTimeFormatter.ofPattern("yyyy년MM월dd일");

		for (Map<String, String> map : libraryList) {

			String playlistDate = map.get("PLAY_DT");

			// 곡 들은 시각
			LocalDateTime timePoint = LocalDateTime.parse(playlistDate, myFormat1);

			// 현재시간 - 곡 들은 시각
			long timeDiff = timePoint.until(timeNow, ChronoUnit.HOURS);

			map.replace("PLAY_DT", myFormat2.format(timePoint));

			// 1일 이내인 경우
			if (timeDiff < 24) {
				map.replace("PLAY_DT", timeDiff + " 시간 전");
			}

			map.put("heart", "heart2.png");

			// 좋아요 곡 확인
			for (Map<String, String> map2 : LikedTrackList) {
				// 좋아요에 해당하는 경우
				if (map.containsValue(map2.get("TRACK_ID"))) {
					map.put("heart", "heart.png");
				}
			}
		}

		return libraryList;
	}

	@Override
	public List<Map<String, String>> getListLikedArtist(String email) {
		log.info("getList LikedArtist...");
		return myPageMapper.getListLikedArtist(email);
	}

	// 좋아요 곡 목록 가져오기
	@Override
	public List<Map<String, String>> getListLikedTrack(String email) {
		log.info("getList LikedTrack...");	
		return myPageMapper.getListLikedTrack(email);
	}

	@Override
	public List<Map<String, String>> getListLikedAlbum(String email) {
		log.info("getList LikedAlbum...");
		return myPageMapper.getListLikedAlbum(email);
	}

	@Override
	public Integer getOnePlaylist(Integer plylstId, String email){
		log.info("get One Playlist...");
		return myPageMapper.getOnePlaylist(plylstId, email);
	}
	
	public PlaylistVO getOnePlaylistVO(Integer plylstId, String email){
		log.info("get One PlaylistVO...");		
		return myPageMapper.getOnePlaylistVO(plylstId, email);
	}
	
	@Override
	public List<PlaylistVO> getListPlaylist(String email) throws MyBatisSystemException {
		log.info("get Playlist...");
		return myPageMapper.getListPlaylist(email);
	}

	@Override
	public List<Map<String, String>> getListPlaylistDetail(Integer plylstId, String email) {
		log.info("get PlaylistDetail..." + plylstId);
		return myPageMapper.getPlaylistDetail(plylstId, email);
	}

	@Override
	public UserVO getOneUser(String email) {
		log.info("get User...");
		return myPageMapper.getUser(email);
	}

	// 플레이리스트 삭제
	@Override
	public boolean removePlaylist(Integer plylstId, String email) {
		log.info("remove Playlist" + plylstId);
		
		// playlistId가 존재하는지 아닌지
		if(!checkValidPlaylistId(plylstId, email)) {
			return false;
		}
		
		myPageMapper.deletePlaylist(plylstId, email);
		myPageMapper.deletePlaylistDetail(plylstId);
		
		return true;
	}
	
	public void removePlaylistTrack(Set<Integer> trackList, Integer plylstId) {	
		for(Integer trackId : trackList) {
			myPageMapper.deletePlaylistTrack(trackId, plylstId);
		}
	}
	
	private boolean checkValidPlaylistId(Integer plylstId, String email) {
		if(myPageMapper.getOnePlaylist(plylstId, email) == 0) {
			return false;
		}
		return true;
	}
	
	// 플레이리스트 개수
	@Override
	public int countPlaylist(String email) {
		log.info("count Playlist" + email);
		return myPageMapper.countPlaylist(email);
	}

	@Override
	public int createPlaylist(PlaylistVO playlistVO) {
		log.info("set PlaylistId..." + playlistVO);
		return myPageMapper.insertSelectKeyPlaylist(playlistVO);
	}

	@Override
	public boolean modifyPlaylist(PlaylistVO playlistVO, String email) {
		if(myPageMapper.updatePlaylist(playlistVO, email) == 0)
			return false;
		
		return true;
	}

	@Override
	public int countPlaylistTrack(Integer plylstId) {
		log.info("count PlaylistTrack" + plylstId);
		return myPageMapper.countPlaylistTrack(plylstId);
	}

}
