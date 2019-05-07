package kr.or.ddit.apply_recruit.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

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
	
	/**
	 * 
	 * Method : testGetAUList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 채용공고에 지원한 유저 목록 조회 테스트.
	 */
	@Test
	public void testGetAUList() {
		/***Given***/

		/***When***/
		List<UsersVo> aUList = appDao.getAUList("31");

		/***Then***/
		assertNotNull(aUList);
	}
	
	
	
	
	

}


