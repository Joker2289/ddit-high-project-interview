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

	/**
	 * Method : select_nextPost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 타임라인 뉴스피드 다음 스크롤 게시물 조회
	 */
	List<PostVo> select_nextPost(PaginationVo paginationVo);
	
	/**
	 * Method : select_postInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @return
	 * Method 설명 : 특정 게시물 조회
	 */
	PostVo select_postInfo(String post_code);
	
	/**
	 * Method : select_savePost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 저장한 글 목록 조회
	 */
	List<PostVo> select_savePost(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextSavePost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 저장한 글 목록 조회(스크롤 페이징 이벤트)
	 */
	List<PostVo> select_nextSavePost(PaginationVo paginationVo);
	
	/**
	 * Method : select_hashtagPost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 해시태그를 공유하는 글 조회
	 */
	List<PostVo> select_hashtagPost(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextHashtagPost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 해시태그를 공유하는 글 조회(스크롤 페이징 이벤트)
	 */
	List<PostVo> select_nextHashtagPost(PaginationVo paginationVo);
}
