package kr.or.ddit.follow.dao;

import java.util.List;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IFollowDao {

	/**
	 * Method : insert_follow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 팔로우 정보 삽입
	 */
	int insert_follow(FollowVo followVo);
	
	/**
	 * Method : delete_follow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param follow_code
	 * @return
	 * Method 설명 : 팔로우 정보 삭제
	 */
	int delete_follow(String follow_code);
	
	/**
	 * Method : select_followList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로우 목록 조회
	 */
	List<FollowVo> select_followList(String mem_id);
	
	List<FollowVo> select_followKindList(PaginationVo paginationVo);
	
}
