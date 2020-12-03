package com.kwani.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserVO {
	
	private String email;
	private String nick;
	private String pwd;
	private String userImg;
	private Integer stusCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date lastDt;
	public UserVO(String email, String nick, String pwd, String userImg, Integer stusCd, Date lastDt) {
		this.email = email;
		this.nick = nick;
		this.pwd = pwd;
		this.userImg = userImg;
		this.stusCd = stusCd;
		this.lastDt = lastDt;
	}
	
	public UserVO() {
		this("", "", "", "", 0, null);
	}
}


