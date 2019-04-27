package kr.or.ddit.page.service;

import java.util.List;

import kr.or.ddit.page.model.Page_linkVo;

public interface IPage_linkService {
	
	/**
	 * 
	 * Method : insert_page_link
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 페이지에 링크 추가
	 */
	int insert_page_link(Page_linkVo vo);
	
	/**
	 * 
	 * Method : select_page_link
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 :  페이지의 링크 조회
	 */
	List<Page_linkVo> select_page_link(String page_code);
}
