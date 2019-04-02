package kr.or.ddit.interest.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.test.LogicTestConfig;

public class InterestServiceImplTest extends LogicTestConfig{

	@Resource(name="interestService")
	private IInterestService inteService;
	
	/**
	 * 
	 * Method : testGetInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 관심분야 조회 테스트.
	 */
	@Test
	public void testGetInte() {
		/***Given***/
		
		/***When***/
		InterestVo iVo = inteService.getInte("brown");

		/***Then***/
		assertNotNull(iVo);
	}

	/**
	 * 
	 * Method : testUpdateInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 관심분야 수정 테스트.
	 */
	@Test
	public void testUpdateInte() {
		/***Given***/
		InterestVo iVo = inteService.getInte("brown");
		iVo.setInte_type("WAS / Framework / 소프트웨어개발");

		/***When***/
		int updateCnt = inteService.updateInte(iVo);

		/***Then***/
		assertNotNull(iVo);
	}
	
	
	
	
	
	
	
}




