package kr.or.ddit.post_comment.dao;

import java.util.List;

import kr.or.ddit.post_comment.model.Post_commentVo;

public interface ICommentDao {
	
	/**
	 * Method : insert_comment
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_commentVo
	 * @return
	 * Method 설명 : 댓글정보 삽입
	 */
	int insert_comment(Post_commentVo post_commentVo);
	
	/**
	 * Method : update_comment
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_commentVo
	 * @return
	 * Method 설명 : 댓글 수정
	 */
	int update_comment(Post_commentVo post_commentVo);
	
	/**
	 * Method : delete_comment
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param comment_code
	 * @return
	 * Method 설명 : 댓글 삭제
	 */
	int delete_comment(String comment_code);
	
	/**
	 * Method : select_commentList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_commentVo
	 * @return
	 * Method 설명 : 댓글목록 조회
	 */
	List<Post_commentVo> select_commentList(Post_commentVo post_commentVo);
	
	/**
	 * Method : select_commentCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param commentVo
	 * @return
	 * Method 설명 : 게시글 댓글 수
	 */
	int select_commentCount(Post_commentVo commentVo);
	
}
