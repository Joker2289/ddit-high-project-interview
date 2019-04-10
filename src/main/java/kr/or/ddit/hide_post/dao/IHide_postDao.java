package kr.or.ddit.hide_post.dao;

import java.util.List;

import kr.or.ddit.hide_post.model.Hide_postVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IHide_postDao {
	
	/**
	 * Method : insert_hidepostInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param hideVo
	 * @return
	 * Method 설명 : 글 숨기기 등록
	 */
	int insert_hidepostInfo(Hide_postVo hideVo);
	
	/**
	 * Method : delete_hidepostInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param hide_code
	 * @return
	 * Method 설명 : 숨긴 글 해제
	 */
	int delete_hidepostInfo(String hide_code);
	
	/**
	 * Method : select_hidepostList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 숨긴 글만 조회(첫 페이지)
	 */
	List<PostVo> select_hidepostList(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextHidepost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 숨긴 글만 조회(다음페이지)
	 */
	List<PostVo> select_nextHidepost(PaginationVo paginationVo);
	
}
