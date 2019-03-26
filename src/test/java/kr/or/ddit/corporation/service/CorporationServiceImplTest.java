package kr.or.ddit.corporation.service;

import static org.junit.Assert.*;

import java.util.UUID;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.test.LogicTestConfig;

public class CorporationServiceImplTest extends LogicTestConfig{
	private Logger logger = LoggerFactory.getLogger(CorporationServiceImplTest.class);

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Before
	public void setup(){
		corpService.deleteForTest("삼성전자");
	}
	
	@Test
	public void testSelect_corpInfo() {
		/***Given***/
		
		/***When***/
		CorporationVo corpVO = corpService.select_corpInfo("joker_corp");
		/***Then***/
		assertEquals("joker's codeFactory", corpVO.getCorp_name());
	}
	
	/**
	 * 
	 * Method : testGetCorp
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 회사이름으로 특정 회사 조회 테스트.
	 */
	@Test
	public void testGetCorp() {
		/***Given***/

		/***When***/
		CorporationVo cVo = corpService.getCorp("joker's codeFactory");

		/***Then***/
		assertNotNull(cVo);
	}
	
	/**
	 * 
	 * Method : testInsert_corp
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 회사 등록 테스트.
	 */
	@Test
	public void testInsert_corp() {
		/***Given***/
		CorporationVo cVo = new CorporationVo();
		cVo.setCorp_id("samsung");
		cVo.setCorp_name("삼성전자");
		cVo.setCorp_birth("94/03/03");
		cVo.setCorp_code(UUID.randomUUID().toString().substring(0, 8));
		cVo.setTelno("01011112222");
		cVo.setEmail("123@gmail.com");
		
		/***When***/
		int insertCnt = corpService.insert_corp(cVo);

		/***Then***/
		assertNotNull(insertCnt);
	}
	
	// UUID 테스트
	@Test
	public void testUUID() {
		/***Given***/

		/***When***/
		String uuid = UUID.randomUUID().toString().substring(0, 8);
		logger.debug("uuid : {}", uuid);
		
		/***Then***/
		assertNotNull(uuid);
	}
	

}







