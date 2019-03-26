package kr.or.ddit.search_log.service;

import java.util.List;

import kr.or.ddit.search_log.model.Search_logVo;

public interface ISearch_logService {

	/**
	 * 
	 * Method : getAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 검색내역 수를 조회.
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
	
	
}









