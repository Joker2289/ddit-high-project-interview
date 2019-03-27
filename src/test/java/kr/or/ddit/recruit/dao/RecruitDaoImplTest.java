package kr.or.ddit.recruit.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;

public class RecruitDaoImplTest extends LogicTestConfig{

	@Resource(name="recruitDao")
	private IRecruitDao recrDao;
	
	/**
	 * 
	 * Method : testGetRecrTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 채용공고 수 조회 테스트.
	 */
	@Test
	public void testGetRecrTest() {
		/***Given***/
		
		/***When***/
		int recrCnt = recrDao.getRecrCnt();

		/***Then***/
		assertNotNull(recrCnt);
	}
	
	
	
	

}








