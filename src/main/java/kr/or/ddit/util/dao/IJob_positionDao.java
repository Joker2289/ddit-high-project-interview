package kr.or.ddit.util.dao;

import java.util.List;

import kr.or.ddit.util.model.Job_positionVo;

public interface IJob_positionDao {
	
	/** 
	 * 
	 * Method : searchPosition
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param keyword
	 * @return
	 * Method 설명 : 직군 검색
	 */
	List<Job_positionVo> searchPosition(String keyword);
}
