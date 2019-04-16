package kr.or.ddit.save_recruit.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class Save_recruitServiceImplTest extends LogicTestConfig{

	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;
	
	/**
	 * 
	 * Method : testInsertSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고저장 등록 테스트.
	 */
	@Test
	public void testInsertSrecr() {
		/***Given***/
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id("brown");
		tempSVo.setRecruit_code("1");
		
		Save_recruitVo sVo = srecrService.getLastSrecr(tempSVo);
		String recr_app = sVo.getRecr_app();
		
		srecrService.deleteForTest("1");
		
		sVo.setRecruit_code("1");
		sVo.setSave_code("1");
		sVo.setSave_flag("f");
		sVo.setUser_id("brown");
		sVo.setRecr_app(recr_app);
		
		/***When***/
		int insertCnt = srecrService.insertSrecr(sVo);

		/***Then***/
		assertNotNull(insertCnt);
	}

	/**
	 * 
	 * Method : testGetLastSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 채용공고저장 중 마지막 항목 조회 테스트.
	 */
	@Test
	public void testGetLastSrecr() {
		/***Given***/

		/***When***/
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id("brown");
		tempSVo.setRecruit_code("10");
		
		Save_recruitVo sVo = srecrService.getLastSrecr(tempSVo);

		/***Then***/
		assertNotNull(sVo);
	}
	
	/**
	 * 
	 * Method : testGetSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 채용공고저장 목록 조회 테스트.
	 */
	@Test
	public void testGetSrecr() {
		/***Given***/

		/***When***/
		List<Save_recruitVo> srecrList = srecrService.getSrecr("10");
		
		/***Then***/
		assertNotNull(srecrList);
	}
	
	/**
	 * 
	 * Method : testUpdateSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고저장 수정 테스트.
	 */
	@Test
	public void testUpdateSrecr() {
		/***Given***/
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id("brown");
		tempSVo.setRecruit_code("1");
		
		Save_recruitVo sVo = srecrService.getLastSrecr(tempSVo);
		sVo.setRecruit_code("1");
		sVo.setSave_code("2");
		sVo.setSave_flag("f");
		sVo.setUser_id("brown");
		sVo.setRecr_app(sVo.getRecr_app());

		/***When***/
		int updateCnt = srecrService.updateSrecr(sVo);

		/***Then***/
		assertNotNull(updateCnt);
	}
	
	/**
	 * 
	 * Method : testGetSSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저가 스크랩한 채용공고 목록 조회 테스트.
	 */
	@Test
	public void testGetSSrecrList() {
		/***Given***/
		Save_recruitVo sVo = new Save_recruitVo();
		sVo.setSave_flag("t");
		sVo.setUser_id("brown");

		/***When***/
		List<Save_recruitVo> sSrecrList = srecrService.getSSrecrList(sVo);

		/***Then***/
		assertNotNull(sSrecrList);
	}
	
	
	
}





