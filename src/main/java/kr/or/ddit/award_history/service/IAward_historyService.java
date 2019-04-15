package kr.or.ddit.award_history.service;

import java.util.List;

import kr.or.ddit.award_history.model.Award_historyVo;

public interface IAward_historyService {
	
	/**
	 * Method : insert_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_historyVo
	 * @return
	 * Method 설명 : 수상경력 등록
	 */
	int insert_award_history(Award_historyVo award_historyVo);

	/**
	 * Method : select_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 수상경력 조회
	 */
	List<Award_historyVo> select_award_history(String user_id);
	
	/**
	 * Method : select_oneAward_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 수상경력 조회
	 */
	Award_historyVo select_oneAward_history(String award_code);
	
	/**
	 * Method : update_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_historyVo
	 * @return
	 * Method 설명 : 사용자의 수상경력 업데이트
	 */
	int update_award_history(Award_historyVo award_historyVo);
}	
