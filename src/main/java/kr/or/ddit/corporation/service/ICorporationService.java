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
}
