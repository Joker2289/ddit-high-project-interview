package kr.or.ddit.post_comment.dao;

import java.util.List;

import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.util.pagination.PaginationVo;

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
	List<Post_commentVo> select_commentList(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextComment
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 다음페이지의 댓글목록 조회
	 */
	List<Post_commentVo> select_nextComment(PaginationVo paginationVo);
	
	/**
	 * Method : select_commentCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param commentVo
	 * @return
	 * Method 설명 : 게시글 댓글 수
	 */
	int select_commentCount(Post_commentVo commentVo);
	
	/**
	 * Method : select_moreCommentCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param commentVo
	 * @return
	 * Method 설명 : 댓글 더보기에 필요한 댓글 수 조회
	 */
	int select_moreCommentCount(PaginationVo paginationVo);
	
}
