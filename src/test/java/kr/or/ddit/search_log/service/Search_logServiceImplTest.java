package kr.or.ddit.search_log.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.test.LogicTestConfig;

public class Search_logServiceImplTest extends LogicTestConfig{

	@Resource(name="search_logService")
	private ISearch_logService search_logService;
	
	@Test
	public void testGetAllCnt() {
		/***Given***/
		
		/***When***/
		int search_logCnt = search_logService.getAllCnt();

		/***Then***/
		assertNotNull(search_logCnt);
	}

	@Test
	public void testGetSearch_log() {
		/***Given***/

		/***When***/
		Search_logVo sVo = search_logService.getSearch_log("1");

		/***Then***/
		assertNotNull(sVo);
	}
	
	@Test
	public void testUpdateSearch_log() {
		/***Given***/
		Search_logVo sVo = search_logService.getSearch_log("1");
		sVo.setSearch_save("1");
		
		/***When***/
		int updateCnt = search_logService.updateSearch_log(sVo);

		/***Then***/
		assertNotNull(updateCnt);
	}
	
	
}







