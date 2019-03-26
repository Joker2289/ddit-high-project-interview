package kr.or.ddit.corporation.dao;

import static org.junit.Assert.assertEquals;

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
	
}
