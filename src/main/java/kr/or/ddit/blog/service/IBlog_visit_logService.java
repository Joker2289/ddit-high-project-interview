package kr.or.ddit.blog.service;


import java.util.List;

import kr.or.ddit.blog.model.Blog_visit_logVo;

public interface IBlog_visit_logService {
	
	/**
	 * 
	 * Method : insert_visit_log
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 방문 기록 입력 
	 */
	int insert_visit_log(Blog_visit_logVo vo);
	
	/**
	 * 
	 * Method : select_today_visit_log
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 블로그 당일 방문기록 출력
	 */
	List<Blog_visit_logVo> select_today_visit_log(String user_id);
}
