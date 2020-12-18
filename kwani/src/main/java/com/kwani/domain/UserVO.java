package com.kwani.domain;

import lombok.Data;

@Data
public class UserVO {

	private String email;
	private String kakaoEmail;
	private String nick;
	private String pwd;
	private String uuid;
	private String userImg;
}
