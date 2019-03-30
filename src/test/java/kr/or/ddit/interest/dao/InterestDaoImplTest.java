package kr.or.ddit.interest.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.test.LogicTestConfig;

public class InterestDaoImplTest extends LogicTestConfig{

	@Resource(name="interestDao")
	private IInterestDao inteDao;
	
	/**
	 * 
	 * Method : testInsertInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 관심분야 등록 테스트.
	 */
	@Test
	public void testInsertInte() {
		/***Given***/
		InterestVo iVo = new InterestVo();
		iVo.setInte_code(String.valueOf(inteDao.getInteCnt()+1));
		iVo.setUser_id("brown");
		iVo.setInte_type("SI / SM / jsp");
		iVo.setInte_local("전국");
		iVo.setInte_emptype("모든 고용형태");
		iVo.setInte_size("1명 / 10,000명");
		
		/***When***/
		int insertCnt = inteDao.insertInte(iVo);

		/***Then***/
		assertNotNull(insertCnt);
		inteDao.deleteForTest(String.valueOf(inteDao.getInteCnt()));
	}
	
	/**
	 * 
	 * Method : testGetInteCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 관심분야 수 조회 테스트.
	 */
	@Test
	public void testGetInteCnt() {
		/***Given***/

		/***When***/
		int inteCnt = inteDao.getInteCnt();

		/***Then***/
		assertNotNull(inteCnt);
	}
	

	
}




