package kr.or.ddit.search.dao;

import java.util.List;

import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface ISearchResultDao {
	
	/**
	 * Method : search_allInfo_user
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 검색어에 해당하는 모든 정보(회원)
	 */
	List<SearchResultVo> search_allInfo_user(PaginationVo paginationVo);
	
	/**
	 * Method : search_allInfo_corp
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 검색어에 해당하는 모든 정보(회사)
	 */
	List<SearchResultVo> search_allInfo_corp(PaginationVo paginationVo);
	
	/**
	 * Method : corpCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 검색결과 총 갯수(회사)
	 */
	int corpCount(String search_word);
	
	/**
	 * Method : userCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 검색결과 총 갯수(회원)
	 */
	int userCount(String search_word);
	
}
