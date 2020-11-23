package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.jta.UserTransactionAdapter;

import com.kwani.domain.UserVO;
import com.kwani.mapper.UserMapper;

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
		user.setNick("덕환이형이다");
		user.setPwd("1234");
		user.setUserImg("");
		user.setMoodCd("");
		user.setGenreCd("");
		user.setSituCd("");
		user.setStusCd("");
		user.setLastDt("");
		user.setInUser("");
		user.setInDate("");
		user.setUpUser("");
		user.setUpDate("");
		
		mapper.insert(user);
		
		log.info(user);
	}
	
	@Test
	public void testget() {
		
		UserVO user = mapper.get("aaa@gmail.com");
		
		log.info(user);
	}
	
	
	@Test
	public void testUserInfoCheck() {
		
		UserVO user = mapper.userInfoCheck("aaa@gmail.com");
		
		log.info(user);
	}
	
	
	@Test
	public void testUserInfoModify() {
		
		UserVO user = new UserVO();
		user.setEmail("asdasdasd@gmail.com");
		user.setNick("잼민이2");
		user.setPwd("1234");
		user.setUserImg("잼민이2의 이미지");
		
		int count = mapper.userInfoModify(user);
		
		log.info("회원의 정보를 수정합니다." + count);

	}
	
	
	@Test
	public void testDelete() {
		
		log.info("삭제합니다" + mapper.delete("ggg@gmail.com"));
	}
	
	@Test
	public void testUpdate() {
		
		UserVO user = new UserVO();
		user.setEmail("hhh@gmail.com");
		user.setNick("잼민이가조용하다");
		user.setPwd("123123123");
		user.setUserImg("");
		user.setMoodCd("");
		user.setGenreCd("");
		user.setSituCd("");
		user.setStusCd("");
		user.setLastDt("");
		user.setInUser("");
		user.setInDate("");
		user.setUpUser("");
		user.setUpDate("");
		
		
		int count = mapper.update(user);
		
		log.info("수정합니다" + count);
		
	}
	
}
