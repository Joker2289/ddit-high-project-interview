package kr.or.ddit.career_info.dao;

import java.util.List;

import kr.or.ddit.career_info.model.Career_infoVo;

public interface ICareer_infoDao {
	
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
	 * @param vo
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	List<Career_infoVo> select_careerInfo(String user_id);
	
	/**
	 * Method : select_oneCareerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 경력정보 조회
	 */
	Career_infoVo select_oneCareerInfo(String career_code);
	
	/**
	 * Method : update_career_info
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_infoVo
	 * @return
	 * Method 설명 : 사용자의 경력정보 업데이트
	 */
	int update_career_info (Career_infoVo career_infoVo);
	
	/**
	 * Method : delete_career_info
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_code
	 * @return
	 * Method 설명 : 사용자의 경력정보 삭제
	 */
	int delete_career_info (String career_code);
}
