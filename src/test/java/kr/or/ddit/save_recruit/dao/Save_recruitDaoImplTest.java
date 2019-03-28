package kr.or.ddit.save_recruit.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class Save_recruitDaoImplTest extends LogicTestConfig{

	@Resource(name="save_recruitDao")
	private ISave_recruitDao srecrDao;

	/**
	 * 
	 * Method : testGetSrecrTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 채용공고저장 수 조회 테스트.
	 */
	@Test
	public void testGetSrecrTest() {
		/***Given***/
		
		/***When***/
		int srecrCnt = srecrDao.getSrecrCnt();

		/***Then***/
		assertNotNull(srecrCnt);
	}

	/**
	 * 
	 * Method : testGetUserSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저의 전체 채용공고저장 목록 조회.
	 */
	@Test
	public void testGetUserSrecrList() {
		/***Given***/

		/***When***/
		List<Save_recruitVo> USList = srecrDao.getUserSrecrList("brown");

		/***Then***/
		assertNotNull(USList);
	}
	
	
}





