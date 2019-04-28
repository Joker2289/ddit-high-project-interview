package kr.or.ddit.page.service;

import java.util.List;

import kr.or.ddit.page.model.Page_sourceVo;

public interface IPage_sourceService {
	
	/**
	 * 
	 * Method : insert_page_source
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 소스 추가
	 */
	int insert_page_source(Page_sourceVo vo);
	
	/**
	 * 
	 * Method : select_page_source
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 : page의 소스 코드 조회
	 */
	List<Page_sourceVo> select_page_source(String page_code);
	
	/**
	 * 
	 * Method : delete_page_source
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 : page의 모든 소스코드 삭제
	 */
	int delete_page_source(String page_code);
}
