package kr.or.ddit.page.dao;

import java.util.List;

import kr.or.ddit.page.model.Page_videoVo;

public interface IPage_videoDao {
	
	/**
	 * 
	 * Method : insert_page_video
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 비디오 추가
	 */
	int insert_page_video(Page_videoVo vo);
	
	/**
	 * 
	 * Method : select_page_video
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 : 비디오 리스트 조회
	 */
	List<Page_videoVo> select_page_video(String page_code);
	
	/**
	 * 
	 * Method : delete_page_video
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 : 페이지의 모든 비디오 삭제
	 */
	int delete_page_video(String page_code);

}
