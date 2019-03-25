package kr.or.ddit.search_log.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;

public class Search_logDaoImplTest extends LogicTestConfig{
	
	@Resource(name="search_logDao")
	private ISearch_logDao search_logDao;

	/**
	 * 
	 * Method : testGetAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 검색내역 수 조회 테스트
	 */
	@Test
	public void testGetAllCnt() {
		/***Given***/
		
		/***When***/
		int search_logCnt = search_logDao.getAllCnt();

		/***Then***/
		assertEquals(0, search_logCnt);
	}

}
