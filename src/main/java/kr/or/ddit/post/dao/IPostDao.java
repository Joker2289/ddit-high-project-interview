package kr.or.ddit.post.dao;

import java.util.List;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IPostDao {

	/**
	 * Method : insert_post
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param postVo
	 * @return
	 * Method 설명 : 게시글 작성
	 */
	int insert_post(PostVo postVo);
	
	/**
	 * Method : update_post
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param postVo
	 * @return
	 * Method 설명 : 게시글 수정
	 */
	int update_post(PostVo postVo);
	
	/**
	 * Method : delete_post
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @return
	 * Method 설명 : 게시글 삭제
	 */
	int delete_post(String post_code);
	
	/**
	 * Method : select_memberPost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param writer_name
	 * @return
	 * Method 설명 : 특정회원 게시글 조회
	 */
	List<PostVo> select_memberPost(String writer_name);

	/**
	 * Method : select_timelinePost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 타임라인 게시글 목록 조회
	 */
	List<PostVo> select_timelinePost(PaginationVo paginationVo);
}
