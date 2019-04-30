package kr.or.ddit.search.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface ISearchResultService {

	/**
	 * Method : search_allInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 검색어에 해당하는 모든 정보(회원/회사)
	 */
	Map<String, Object> search_allInfo(PaginationVo paginationVo);
	
}
