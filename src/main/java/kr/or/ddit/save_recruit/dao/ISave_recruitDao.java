package kr.or.ddit.save_recruit.dao;

import java.util.List;

import kr.or.ddit.save_recruit.model.Save_recruitVo;

public interface ISave_recruitDao {

	/**
	 * 
	 * Method : insertSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 채용공고저장 등록.
	 */
	int insertSrecr(Save_recruitVo sVo);

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param save_code
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고저장 삭제.
	 */
	int deleteForTest(String save_code);

	/**
	 * 
	 * Method : getSrecrCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고저장 수 조회.
	 */
	int getSrecrCnt();

	/**
	 * 
	 * Method : getUserSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 전체 채용공고저장 목록 조회.
	 */
	List<Save_recruitVo> getUserSrecrList(String user_id);

	/**
	 * 
	 * Method : getLastSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempSVo
	 * @return
	 * Method 설명 : 특정 채용공고저장 중 마지막 항목 조회.
	 */
	Save_recruitVo getLastSrecr(Save_recruitVo tempSVo);

	/**
	 * 
	 * Method : getSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 특정 채용공고저장 목록 조회.
	 */
	List<Save_recruitVo> getSrecr(String recruit_code);

	/**
	 * 
	 * Method : updateSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 채용공고저장 수정.
	 */
	int updateSrecr(Save_recruitVo sVo);

	/**
	 * 
	 * Method : getSSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 특정 유저가 스크랩한 채용공고 목록 조회.
	 */
	List<Save_recruitVo> getSSrecrList(Save_recruitVo sVo);

	/**
	 * 
	 * Method : getAppList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempSVo
	 * @return
	 * Method 설명 : 특정 유저가 지원한 채용공고 목록 조회.
	 */
	List<Save_recruitVo> getAppList(Save_recruitVo tempSVo);
	
	
	
	
}








