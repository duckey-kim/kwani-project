package com.kwani.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface PlayerService {

	public List<Map<String,String>>  getListFromTable(List<Map<String, String>> listMap, List<Map<String,String>> currentList);

	public void setCurrentList(List<Map<String,String>> currentList, HttpSession session);

	public String setScriptArr(List<Map<String,String>>currentList);
	
	public List<Map<String,String>> getTrackUrlInAlbum(Integer albumId);
	
	public List<Map<String,String>> getTracksUrl(Integer[] trackId);

	public List<Map<String, String>> getUserPlayList(Integer listId);
	
	public int mergeHistory(String email,Integer trackId);
	
	public List<Map<String,String>> getListLikedTrack(String email);
	
	public List<Map<String,String>> getListLibrary(String object);

	
	

}
