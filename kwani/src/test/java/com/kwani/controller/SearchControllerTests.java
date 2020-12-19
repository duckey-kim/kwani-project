package com.kwani.controller;

import static org.junit.Assert.*;

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

@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j

public class SearchControllerTests {
	
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	//search/artist 페이지
	@Test
	public void testSearchArtist() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/search/artist")
			.param("pageNum", "1")
			.param("searchTxt", "태"))
			.andReturn().getModelAndView().getModelMap());
	}

	//search/song 페이지
	@Test
	public void testSearchSong() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/search/song")
				.param("pageNum", "1")
				.param("searchTxt", "태"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	//search/song 페이지
	@Test
	public void testSearchAlbum() throws Exception{
			
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/search/album")
				.param("pageNum", "1")
				.param("searchTxt", "태"))
				.andReturn().getModelAndView().getModelMap());
		}
	
	
	//search/lyrics 페이지
	@Test
	public void testSearchLyrics() throws Exception{
			
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/search/lyrics")
				.param("pageNum", "2")
				.param("searchTxt", "이"))
				.andReturn().getModelAndView().getModelMap());
		}
	
	
	
	
}
