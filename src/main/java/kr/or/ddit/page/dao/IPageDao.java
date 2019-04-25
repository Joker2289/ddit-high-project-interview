package kr.or.ddit.page.dao;

import kr.or.ddit.page.model.PageVo;

public interface IPageDao {
	
	/**
	 * 
	 * Method : insert_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 페이지 추가
	 */
	int insert_page(PageVo vo);
}
