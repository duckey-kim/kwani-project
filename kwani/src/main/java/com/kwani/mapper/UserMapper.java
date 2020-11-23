package com.kwani.mapper;


import com.kwani.domain.UserVO;

public interface UserMapper {

	// 회원정보를 등록한다.
	public void insert(UserVO user);
	
	// 회원정보는 선택해서 가져온다.
	public UserVO get(String email);
	
	// 회원정보를 수정한다.
	public int update(UserVO user);
	
	// 회원정보를 삭제한다.
	public int delete(String email);
	
	// 회원이 자신의 정보수정을 위한 체크.
	public UserVO userInfoCheck(String email);
	
	// 회원 자신이 정보수정을 위함.
	public int userInfoModify(UserVO user);

	

	
}
