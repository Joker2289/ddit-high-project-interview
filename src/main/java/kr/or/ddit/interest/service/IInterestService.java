package kr.or.ddit.interest.service;

import kr.or.ddit.interest.model.InterestVo;

public interface IInterestService {

	/**
	 * 
	 * Method : insertInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param iVo
	 * @return
	 * Method 설명 : 관심분야 등록.
	 */
	int insertInte(InterestVo iVo);
	
	/**
	 * 
	 * Method : getInteCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 관심분야 수 조회.
	 */
	int getInteCnt();
	
	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param inte_code
	 * @return
	 * Method 설명 : 테스트를 위한 관심분야 삭제.
	 */
	int deleteForTest(String inte_code);
	
	

	
}





