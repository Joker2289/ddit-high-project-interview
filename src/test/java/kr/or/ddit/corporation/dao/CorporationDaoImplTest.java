package kr.or.ddit.corporation.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.test.LogicTestConfig;

public class CorporationDaoImplTest extends LogicTestConfig{
	
	@Resource(name="corporationDao")
	private ICorporationDao corpDao;
	
	@Test
	public void testSelect_corpInfo() {
		/***Given***/
		
		/***When***/
		CorporationVo corpVO = corpDao.select_corpInfo("joker_corp");
		/***Then***/
		assertEquals("joker's codeFactory", corpVO.getCorp_name());
	}
	
	/**
	 * 
	 * Method : testSelect_allCorps
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 회사 목록 조회 테스트.
	 */
	@Test
	public void testSelect_allCorps() {
		/***Given***/

		/***When***/
		List<CorporationVo> corpList = corpDao.select_allCorps();

		/***Then***/
		assertNotNull(corpList);
	}
	
	/**
	 * 
	 * Method : testGetCorpCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 회사 수 조회.
	 */
	@Test
	public void testGetCorpCnt() {
		/***Given***/

		/***When***/
		int corpCnt = corpDao.getCorpCnt();

		/***Then***/
		assertNotNull(corpCnt);
	}
	
	
	
	
}








