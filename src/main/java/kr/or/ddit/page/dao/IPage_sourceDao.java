package kr.or.ddit.page.dao;

import kr.or.ddit.page.model.Page_sourceVo;

public interface IPage_sourceDao {
	
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
}
