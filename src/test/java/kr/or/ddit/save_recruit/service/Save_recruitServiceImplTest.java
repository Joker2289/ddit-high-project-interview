package kr.or.ddit.save_recruit.service;

import static org.junit.Assert.*;

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
		Save_recruitVo sVo = new Save_recruitVo();
		sVo.setRecruit_code("1");
		sVo.setSave_code("1");
		sVo.setSave_flag("f");
		sVo.setUser_id("brown");
		
		/***When***/
		int insertCnt = srecrService.insertSrecr(sVo);

		/***Then***/
		assertNotNull(insertCnt);
	}

}
