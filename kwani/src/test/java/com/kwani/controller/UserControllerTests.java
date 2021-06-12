package com.kwani.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class UserControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/registerAction")
				.param("email", "lala@gmail.com")
				.param("nick", "투투대마왕")
				.param("pwd", "1234")
				.param("userImg", "")
				.param("moodCd", "")
				.param("genreCd", "")
				.param("situCd", "")
				.param("stusCd", "")
				.param("lastDt", "")
				.param("inUser", "")
				.param("inDate", "")
				.param("upUser", "")
				.param("upDate", "")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/user/login")
				.param("email", "jjj@gmail.com"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/modify")
				.param("email", "zzzzzzzzzz@gmail.com")
				.param("nick", "벌써12시")
				.param("pwd", "5678")
				.param("userImg", "")
				.param("moodCd", "")
				.param("genreCd", "")
				.param("situCd", "")
				.param("stusCd", "")
				.param("lastDt", "")
				.param("inUser", "")
				.param("inDate", "")
				.param("upUser", "")
				.param("upDate", ""))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
	@Test
	public void testuserInfoModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/userInfoModifyAction")
				.param("email", "tytyty@gmail.com")
				.param("nick", "수요일")
				.param("pwd", "1111")
				.param("userImg", "수요일의 이미지"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage= mockMvc.perform(MockMvcRequestBuilders.post("/user/remove")
				.param("email", "bbb@gmail.com")
				).andReturn().getModelAndView().getViewName();
		
		
		log.info(resultPage);
		
	}
	
}
