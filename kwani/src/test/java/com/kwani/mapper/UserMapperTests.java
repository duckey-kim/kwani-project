package com.kwani.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.kwani.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Test
	public void testInsert() {
		
		UserVO user = new UserVO();
		user.setEmail("aa@gmail.com");
		user.setNick("개구리는 개굴개굴");
		user.setPwd("1234");
		user.setUserImg("");
		
		mapper.insert(user);
		
		log.info(user);
	}
	
	@Test
	public void testSocialRegister() {
		
		UserVO user = new UserVO();
		user.setEmail("kkl@gmail.com");
		user.setNick("개구리는 개굴개굴");
		user.setPwd("1234");
		user.setUserImg("");
		
		mapper.socialRegister(user);
		
		log.info(user);
		
	}
	
	
	@Test
	public void testget() {
		
		UserVO user = mapper.get("c@gmail.com");
		
		log.info(user);
	}
	
	
	@Test
	public void testUserInfoCheck() {
		
		UserVO user = mapper.checkUserInfo("aaa@gmail.com");
		
		log.info(user);
	}
	
	
	@Test
	public void TestModifyUserInfo() {
		
		UserVO user = new UserVO();
		user.setEmail("asdasdasd@gmail.com");
		user.setNick("잼민이2");
		user.setPwd("1234");
		user.setUserImg("잼민이2의 이미지");
		
		int count = mapper.modifyUserInfo(user);
		
		log.info("회원의 정보를 수정합니다." + count);

	}
	
	
	
	@Test
	public void testUpdate() {
		
		UserVO user = new UserVO();
		user.setEmail("hhh@gmail.com");
		user.setNick("잼민이가조용하다");
		user.setPwd("123123123");
		user.setUserImg("");
		
		int count = mapper.update(user);
		
		log.info("수정합니다" + count);
		
	}
	
	@Test
	public void testCheckUserIdPwd() {
		
		int user = mapper.checkUserIdPwd("c@gmail.com", "1234");
		
		log.info("회원이 입력한 정보와 서버에 저장된 정보를 비교합니다" + user );
	}
	
	@Test
	public void testIsUserIdValid() {
		
		int user = mapper.isUserIdVaild("c@gmail.com");
		
		log.info("회원이 입력한 ID(email)가 서버에 있는지 확인한다." + user);
	}
	
	
	@Test
	public void testIsSocialIdValid() {
		
		int user = mapper.isSocialIdValid("bgbgbgbg@gmail.com");
		
		log.info("회원이 입력한 ID(email)가 서버에 있는지 확인한다." + user);
	}
	
	
	
	
	@Test
	public void testCheckWithdrawUser() {
		
		int user = mapper.checkWithdrawUser("c@gmail.com");
		
		log.info("탈퇴한 회원인지 확인한다." + user);
		
	}
	
	@Test
	public void testCheckUserImg() {
		
		int checkUserImg = mapper.checkUserImg("c@gmail.com");
		
		log.info("회원의 이미지파일 : " + checkUserImg);
	}
	
	@Test
	public void testGetUserImg() {
		
		UserVO userImg = mapper.getUserImg("c@gmail.com");
		
		log.info("회원이미지 : " + userImg);
		
	}
}
	
	
