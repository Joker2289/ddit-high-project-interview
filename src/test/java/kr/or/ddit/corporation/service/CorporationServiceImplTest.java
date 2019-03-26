package kr.or.ddit.corporation.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.test.LogicTestConfig;

public class CorporationServiceImplTest extends LogicTestConfig{

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Test
	public void testSelect_corpInfo() {
		/***Given***/
		
		/***When***/
		CorporationVo corpVO = corpService.select_corpInfo("joker_corp");
		/***Then***/
		assertEquals("joker's codeFactory", corpVO.getCorp_name());
	}

}
