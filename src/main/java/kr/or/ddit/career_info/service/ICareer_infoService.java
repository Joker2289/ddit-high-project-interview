package kr.or.ddit.career_info.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.career_info.model.Career_infoVo;

public interface ICareer_infoService {
	
	/**
	 * 
	 * Method : insert_career_info
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 경력 정보 등록
	 */
	int insert_career_info(Career_infoVo vo);
	
	/**
	 * Method : select_careerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	Map<String, Object> select_careerInfo(String user_id);
}
