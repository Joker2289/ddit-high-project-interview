package kr.or.ddit.blog.dao;

import kr.or.ddit.blog.model.BlogVo;

public interface IBlogDao {
	
	/**
	 * 
	 * Method : insert_blog
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 블로그 정보 추가
	 */
	int insert_blog(BlogVo vo);
	
	/**
	 * 
	 * Method : update_blog
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 블로그 정보 수정
	 */
	int update_blog(BlogVo vo);
	
	/**
	 * 
	 * Method : select_blogInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 회원 블로그 정보 조회
	 */
	BlogVo select_blogInfo(String user_id);
	
	
}
