package kr.or.ddit.follow.service;

import java.util.List;

import kr.or.ddit.follow.model.FollowVo;

public interface IFollowService {

	int insert_follow(FollowVo followVo);

	int delete_follow(String follow_code);

	List<FollowVo> select_followList(String mem_id);

	List<FollowVo> select_followKindList(FollowVo followVo);

}
