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
	
	List<FollowVo> select_followingList(String mem_id);

}
