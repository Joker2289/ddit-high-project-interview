package kr.or.ddit.follow.service;

import java.util.List;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IFollowService {

	int insert_follow(FollowVo followVo);

	int delete_follow(FollowVo followVo);

	List<FollowVo> select_followList(String mem_id);

	List<FollowVo> select_followKindList(PaginationVo paginationVo);
	
	int getFollowingCnt(String mem_id);
	
	int getFollowerCnt(String mem_id);
	
	List<FollowVo> select_followerList(String mem_id);
	
	List<FollowVo> select_followingList(String mem_id);
	
	/**
	 * Method : select_oneFollow
	 * 작성자 : jin
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 사용자와 상대방과의 팔로우 검색
	 */
	FollowVo select_oneFollow(FollowVo followVo);
	
	/**
	 * Method : select_hashtagFollowCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param ref_keyword
	 * @return
	 * Method 설명 : 해시태그 팔로워 수 조회
	 */
	int select_hashtagFollowCount(String ref_keyword);

}
