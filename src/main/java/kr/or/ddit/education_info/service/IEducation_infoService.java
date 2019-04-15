package kr.or.ddit.education_info.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.education_info.model.Education_infoVo;

public interface IEducation_infoService {
	
	/**
	 * 
	 * Method : insert_education_info
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 회원 학력 등록
	 */
	int insert_education_info(Education_infoVo vo);
	
	/**
	 * Method : select_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 학력 조회
	 */
	Map<String, Object> select_educationInfo(String user_id);
	
	/**
	 * Method : select_oneEducationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 학력정보 조회
	 */
	Map<String, Object> select_oneEducationInfo(String education_code);
	
	/**
	 * Method : update_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_infoVo
	 * @return
	 * Method 설명 : 사용자의 학력정보 업데이트
	 */
	int update_educationInfo(Education_infoVo education_infoVo);
}
