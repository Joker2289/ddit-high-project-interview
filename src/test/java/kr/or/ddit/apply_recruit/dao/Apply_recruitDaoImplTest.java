package kr.or.ddit.apply_recruit.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class Apply_recruitDaoImplTest extends LogicTestConfig{

	@Resource(name="apply_recruitDao")
	private IApply_recruitDao appDao;
	
	/**
	 * 
	 * Method : testInsertApp
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고지원 등록 테스트.
	 */
	@Test
	public void testInsertApp() {
		/***Given***/
		Apply_recruitVo aVo = new Apply_recruitVo();
		aVo.setRecruit_code("2");
		aVo.setUser_id("brown");

		/***When***/
		int insertCnt = appDao.insertApp(aVo);

		/***Then***/
		assertNotNull(insertCnt);
		
		appDao.deleteApp(aVo);
	}
	

	
	
	

}


