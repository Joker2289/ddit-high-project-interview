package kr.or.ddit.apply_recruit.dao;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;

public interface IApply_recruitDao {

	/**
	 * 
	 * Method : insertApp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param aVo
	 * @return
	 * Method 설명 : 채용공고지원 등록.
	 */
	int insertApp(Apply_recruitVo aVo);

}
