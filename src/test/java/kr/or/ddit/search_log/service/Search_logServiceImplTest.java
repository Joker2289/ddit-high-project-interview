package kr.or.ddit.search_log.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

public class Search_logServiceImplTest {

	@Resource(name="search_logService")
	private ISearch_logService search_logService;
	
	@Test
	public void testGetAllCnt() {
		/***Given***/
		
		/***When***/
		int search_logCnt = search_logService.getAllCnt();

		/***Then***/
		assertEquals(0, search_logCnt);	
	}

}
