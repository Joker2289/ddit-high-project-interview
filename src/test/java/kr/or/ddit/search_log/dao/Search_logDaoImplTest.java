package kr.or.ddit.search_log.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.search_log.model.Search_logVo;
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
	
	/**
	 * 
	 * Method : testInsertSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 검색내역 등록 테스트.
	 */
//	@Test
	public void testInsertSearch_log(){
		/***Given***/
		Search_logVo sVo = new Search_logVo();
		sVo.setSearch_code("2");
		sVo.setSearch_word("google");
		sVo.setSearch_local("대전");
		sVo.setUser_id("brown");
		
		/***When***/
		int insertCnt = search_logDao.insertSearch_log(sVo);

		/***Then***/
		assertEquals(1, insertCnt);
	}

}
