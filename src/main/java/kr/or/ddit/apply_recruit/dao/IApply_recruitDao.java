package kr.or.ddit.apply_recruit.dao;

import java.util.List;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.users.model.UsersVo;

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

	/**
	 * 
	 * Method : deleteApp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param aVo
	 * @return
	 * Method 설명 : 채용공고지원 삭제.
	 */
	int deleteApp(Apply_recruitVo aVo);

	/**
	 * 
	 * Method : getAppList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 유저의 채용공고지원 목록 조회.
	 */
	List<Apply_recruitVo> getAppList(String mem_id);

	/**
	 * 
	 * Method : getAUList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 특정 채용공고에 지원한 유저 목록 조회.
	 */
	List<UsersVo> getAUList(String recruit_code);

}
