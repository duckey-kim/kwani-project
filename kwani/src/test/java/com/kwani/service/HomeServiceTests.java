package com.kwani.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.kwani.domain.HomeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HomeServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private HomeService service;

	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);
	}

//	@Test
//	public void testGetGenreCdFromYear() {
//		
//		List<HomeVO> list = service.getGenreCdFromYear("2000", "2009");
//		
//		log.info("list : " + list);
//	}
//	
//	@Test
//	public void testGetGenreCdFromGenreName() {
//		
//		List<HomeVO> list = service.getGenreCdFromGenreName("발라드");
//		
//		log.info("list : " + list);
//	}

}
