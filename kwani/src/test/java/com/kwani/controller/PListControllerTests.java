package com.kwani.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for Controller
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class PListControllerTests {
	
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/recommend/common"))
			.andReturn().getModelAndView().getModelMap());
		
	}
	
	@Test
	public void testListDtl() throws Exception{
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/recommend/plylst")
			.param("plylstId", "3")).andReturn()
			.getModelAndView().getModelMap());
		
	}
	

	@Test
	public void testGetSearchPlist() throws Exception{
		
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/recommend/search")
			.param("searchTxt", "태연"))
			.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testGetSearchLyrics() throws Exception{
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/recommend/search")
				.param("searchTxt", "이"))
				.andReturn().getModelAndView().getModelMap());
	}


	/*
	 * @Test public void testGetListPlylstAjax() throws Exception{
	 * 
	 * log.info( mockMvc.perform(MockMvcRequestBuilders.get) ) }
	 */

}











