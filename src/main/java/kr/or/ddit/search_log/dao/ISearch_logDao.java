package kr.or.ddit.search_log.dao;

import java.util.List;

import kr.or.ddit.search_log.model.Search_logVo;

public interface ISearch_logDao {

	/**
	 * 
	 * Method : getAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 검색내역 수 조회.
	 */
	int getAllCnt();

	/**
	 * 
	 * Method : insertSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 검색내역 등록.
	 */
	int insertSearch_log(Search_logVo sVo);

	/**
	 * 
	 * Method : getSaveList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 저장한 검색어 리스트 조회.
	 */
	List<Search_logVo> getSaveList(Search_logVo sVo);
	
	/**
	 * 
	 * Method : getSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_code
	 * @return
	 * Method 설명 : 특정 검색내역 조회.
	 */
	Search_logVo getSearch_log(String search_code);
	
	/**
	 * 
	 * Method : deleteSearch_logForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_code
	 * @return
	 * Method 설명 : 테스트 코드 작성을 위한 검색내역 삭제.
	 */
	int deleteSearch_logForTest(String search_code);

	/**
	 * 
	 * Method : updateSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 검색내역 수정.
	 */
	int updateSearch_log(Search_logVo sVo);
	
	
}












