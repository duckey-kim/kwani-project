package com.kwani.mapper;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.UserVO;

public interface UserMapper {

	// 회원정보를 등록한다.
	public void insert(UserVO user);

	// 회원정보는 선택해서 가져온다.
	public UserVO get(String email);

	// 회원정보를 수정한다.
	public int update(UserVO user);

	// 회원이 자신의 정보수정을 위한 확인.
	public UserVO checkUserInfo(String email);

	// 회원 자신의 nick, pwd, img의 정보를 수정한다.
	public int modifyUserInfo(UserVO user);

	// 회원의 이미지가 있는지 확인한다.
	public Integer checkUserImg(String email);

	// 회원의 이미지를 가져온다.
	public UserVO getUserImg(String email);

	// 회원이 탈퇴했을때, 상태변경.
	public int withdrawal(UserVO user);

	// 회원이 입력한 ID(email)가 서버에 있는지 확인한다.
	public int isUserIdVaild(String email);

	// 회원이 입력한 정보와 서버에 저장된 정보가 일치하는지 확인한다.
	public int checkUserIdPwd(@Param("email") String email, @Param("pwd") String pwd);

	// 탈퇴한 회원인지 확인한다.
	public Integer checkWithdrawUser(String IdEmail);

	// 서버에 저장된 비밀번호를 이메일로 전송된 번호로 변경한다.
	public void modifyPwd(@Param("IdEmail") String IdEmail, @Param("uuid") String uuid);

}
