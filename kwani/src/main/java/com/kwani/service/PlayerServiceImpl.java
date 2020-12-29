package com.kwani.service;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kwani.mapper.PlayerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Transactional
public class PlayerServiceImpl implements PlayerService {

	@Setter(onMethod_ = @Autowired)
	private PlayerMapper playerMapper;

	@Override
	public List<Map<String, String>> getListFromTable(List<Map<String, String>> listMap,
			List<Map<String, String>> list) {
		// 주어진 listMap을 list에 추가
		if (listMap != null) {
			list.addAll(listMap);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void setCurrentList(List<Map<String,String>>currentList, HttpSession session) {
		List<Map<String,String>> savedList= (List<Map<String,String>>)session.getAttribute("list");
		if(savedList!=null) {
			currentList.addAll(0,savedList);
		}
		session.setAttribute("list", currentList);
	}

	@Override
	public String setScriptArr(List<Map<String,String>> currentList) {
		Iterator<Map<String, String>> it = currentList.iterator();
		String result = "[";
		while (it.hasNext()) {
			result += "\"" + it.next().get("TRACK_URL") + "\"";
			if (!it.hasNext())
				break;
			result += ",";
		}
		result += "]";

		return result;
	}

	@Override
	public List<Map<String, String>> getTrackUrlInAlbum(Integer albumId) {
		// album id로 album수록곡들의 url을 가져온다.
		List<Map<String, String>> urlList = playerMapper.getAlbumList(albumId);
		return urlList == null ? Collections.emptyList() : urlList;
	}

	@Override
	public List<Map<String, String>> getTracksUrl(Integer[] trackId) {
		// trackId와 일치하는 곡의 url을 가져온다.
		List<Map<String, String>> urlList = playerMapper.getTracksUrl(trackId);
		return urlList == null ? Collections.emptyList() : urlList;
	}
	
	
	//playlist Id 같은 거 테이블에서 가져오기
	@Override
	public List<Map<String, String>> getUserPlayList(Integer listId) {
		List<Map<String,String>> listMap = playerMapper.getUserPlayList(listId);
		
		return listMap==null?Collections.emptyList():listMap;
	}
	@Override
	public int mergeHistory(String email, Integer trackId) {
		log.info("email : "+email);
		log.info("trackId :"+trackId);
		return playerMapper.mergeHistory(trackId, email);
	}
	
	
	@Override
	public List<Map<String, String>> getListLibrary(String email) {
		List<Map<String,String>> getList = playerMapper.getListLibrary(email);
		
		
		return getList==null?Collections.emptyList():getList;
	}
	
	@Override
	public List<Map<String, String>> getListLikedTrack(String email) {
		List<Map<String,String>> getList = playerMapper.getListLikedTrack(email);
		return getList==null?Collections.emptyList():getList;
	}

}
