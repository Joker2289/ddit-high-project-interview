package kr.or.ddit.search_log.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.test.LogicTestConfig;

public class Search_logServiceImplTest extends LogicTestConfig{

	@Resource(name="search_logService")
	private ISearch_logService sLogService;
	
	@Test
	public void testGetAllCnt() {
		/***Given***/
		
		/***When***/
		int search_logCnt = sLogService.getAllCnt();

		/***Then***/
		assertNotNull(search_logCnt);
	}

	@Test
	public void testGetSearch_log() {
		/***Given***/

		/***When***/
		Search_logVo sVo = sLogService.getSearch_log("1");

		/***Then***/
		assertNotNull(sVo);
	}
	
	@Test
	public void testUpdateSearch_log() {
		/***Given***/
		Search_logVo sVo = sLogService.getSearch_log("1");
		sVo.setSearch_save("1");
		
		/***When***/
		int updateCnt = sLogService.updateSearch_log(sVo);

		/***Then***/
		assertNotNull(updateCnt);
	}
	
	/**
	 * 
	 * Method : testGetLSLog
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 회원이 검색하려는 값 테스트.
	 */
	@Test
	public void testGetLSLog() {
		/***Given***/

		/***When***/
		Search_logVo lSLog = sLogService.getLSLog("brown");

		/***Then***/
		assertNotNull(lSLog);
	}
	
	
	
	
	
}







