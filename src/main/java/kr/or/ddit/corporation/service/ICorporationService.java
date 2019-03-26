package kr.or.ddit.corporation.service;

import kr.or.ddit.corporation.model.CorporationVo;

public interface ICorporationService {
	
	/**
	 * 
	 * Method : select_corpInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param corp_id
	 * @return
	 * Method 설명 : 특정 회사 정보 조회
	 */
	CorporationVo select_corpInfo(String corp_id);

	/**
	 * 
	 * Method : getCorp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 회사이름으로 특정 회사 조회.
	 */
	CorporationVo getCorp(String corp_name);
	
	/**
	 * 
	 * Method : insert_corp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param cVo
	 * @return
	 * Method 설명 : 회사 등록.
	 */
	int insert_corp(CorporationVo cVo);

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 테스트 코드를 위한 회사 삭제.
	 */
	int deleteForTest(String corp_name);
	
	
}






