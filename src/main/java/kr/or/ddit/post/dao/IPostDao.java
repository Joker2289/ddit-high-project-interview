package kr.or.ddit.post.dao;

import java.util.List;

import kr.or.ddit.post.model.PostVo;

public interface IPostDao {

	
	int insert_post(PostVo postVo);
	
	int update_post(PostVo postVo);
	
	int delete_post(String post_code);
	
	List<PostVo> select_memberPost(String mem_id);

}
