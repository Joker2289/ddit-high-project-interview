package kr.or.ddit.recruit.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.recruit.model.RecruitVo;
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
	
	/**
	 * 
	 * Method : testGetAllRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 채용공고 조회 테스트.
	 */
	@Test
	public void testGetAllRecr() {
		/***Given***/

		/***When***/
		List<RecruitVo> recrList = recrDao.getAllRecr();

		/***Then***/
		assertNotNull(recrList);
	}
	
	/**
	 * 
	 * Method : testGetLastViewRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저가 마지막으로 조회한 채용공고 조회.
	 */
	@Test
	public void testGetLastViewRecr() {
		/***Given***/

		/***When***/
		RecruitVo LVRVo = recrDao.getLastViewRecr("brown");

		/***Then***/
		assertNotNull(LVRVo);
	}
	
	/**
	 * 
	 * Method : testGetRecrByType
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 업무분야로 채용공고 목록 조회.
	 */
	@Test
	public void testGetRecrByType() {
		/***Given***/

		/***When***/
		List<RecruitVo> searchList = recrDao.getRecrByType("웹테스터");

		/***Then***/
		assertNotNull(searchList);
	}

	/**
	 * 
	 * Method : testUpdateRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 수정 테스트.
	 */
	@Test
	public void testUpdateRecr() {
		/***Given***/
		RecruitVo rVo = recrDao.getRecr("1");
		rVo.setApp_count(rVo.getApp_count());

		/***When***/
		int updateCnt = recrDao.updateRecr(rVo);

		/***Then***/
		assertNotNull(updateCnt);
	}
	
	
	

}








