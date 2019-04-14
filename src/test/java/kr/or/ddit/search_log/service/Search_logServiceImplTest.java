package kr.or.ddit.search_log.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

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
	
	/**
	 * 
	 * Method : testUpdateSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 검색내역 수정 테스트.
	 */
	@Test
	public void testUpdateSearch_log() {
		/***Given***/
		Search_logVo sVo = sLogService.getSearch_log("5");
		String search_alarm = sVo.getSearch_alarm();
		
		sVo.setSearch_alarm("1");
		
		/***When***/
		int updateCnt = sLogService.updateSearch_log(sVo);

		/***Then***/
		assertNotNull(updateCnt);
		
		sVo.setSearch_alarm(search_alarm);
		sLogService.updateSearch_log(sVo);
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

	/**
	 * 
	 * Method : testGetSList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저의 최근 검색어 리스트 조회 테스트.
	 */
	@Test
	public void testGetSList() {
		/***Given***/

		/***When***/
		List<Search_logVo> sList = sLogService.getSList("brown");

		/***Then***/
		assertNotNull(sList);
		assertEquals(5, sList.size());
	}
	
	/**
	 * 
	 * Method : testGetSLogByCond
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : id, word, local로 특정 검색내역 조회 테스트.
	 */
	@Test
	public void testGetSLogByCond() {
		/***Given***/
		Search_logVo sVo = new Search_logVo();
		sVo.setUser_id("brown");
		sVo.setSearch_word("전체");
		sVo.setSearch_local("전국");

		/***When***/
		Search_logVo compSVo = sLogService.getSLogByCond(sVo);

		/***Then***/
		assertNotNull(compSVo);
	}
	
	
	
	
	
}







