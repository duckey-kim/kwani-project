package com.kwani.mapper;

import java.util.List;

import com.kwani.domain.TrackVO;
import com.kwani.domain.UserVO;

public interface TrackMapper {

	public List<UserVO> get();
	public List<TrackVO> getList();
	public void insert(TrackVO track);
	public TrackVO read(String trackTitle);
	
}
