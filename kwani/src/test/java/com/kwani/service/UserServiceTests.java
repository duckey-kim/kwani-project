package com.kwani.service;

import static org.junit.Assert.assertNotNull;

import javax.sound.midi.MidiDevice.Info;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.kwani.domain.HomeVO;
import com.kwani.domain.UserVO;
import com.kwani.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private UserService service;
	
	@Setter(onMethod_ = { @Autowired })
	private HomeService HomeService;
		

	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testInsert() {

		UserVO user = new UserVO();
		user.setEmail("tytyty@gmail.com");
		user.setNick("투");
		user.setPwd("123123");
		user.setUserImg("");

		service.register(user);

		log.info("새로가입했어요" + user.getEmail());

	}
	
	@Test
	public void testGet() {

		log.info(service.get("b@naver.com"));

	}

	@Test
	public void testModifyUserInfo() {

		UserVO user = service.get("zzzzzzzzzz@gmail.com");

		if (user == null) {
			return;
		}
		user.setNick("잼민잼민잼민");
		user.setPwd("123123");
		user.setUserImg("잼민잼민잼민의 이미지");
		log.info("업데이트 성공!" + service.modifyUserInfo(user));
	}

	@Test
	public void testGetUserImg() {

		UserVO userImg = service.getUserImg("c@gmail.com");

		log.info("회원이미지 : " + userImg);
	}
}
