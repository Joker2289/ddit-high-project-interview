package kr.or.ddit.career_info.dao;

import kr.or.ddit.career_info.model.Career_infoVo;

public interface ICarrer_infoDao {
	
	/**
	 * 
	 * Method : insert_carrer_info
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 경력 정보 등록
	 */
	int insert_carrer_info(Career_infoVo vo);
}
