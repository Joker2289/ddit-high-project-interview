package kr.or.ddit.post.service;

import java.util.List;

import kr.or.ddit.post.model.PostVo;

public interface IPostService {
	
	int insert_post(PostVo postVo);
	
	int update_post(PostVo postVo);
	
	int delete_post(String post_code);
	
	List<PostVo> select_memberPost(String mem_id);
}
