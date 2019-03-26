package kr.or.ddit.post.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post.dao.IPostDao;
import kr.or.ddit.post.model.PostVo;

@Service("postService")
public class PostServiceImpl implements IPostService {
	
	@Resource(name="postDao")
	private IPostDao postDao;
	
	
	@Override
	public int insert_post(PostVo postVo) {
		return postDao.insert_post(postVo);
	}

	@Override
	public int update_post(PostVo postVo) {
		return postDao.update_post(postVo);
	}

	@Override
	public int delete_post(String post_code) {
		return postDao.delete_post(post_code);
	}

	@Override
	public List<PostVo> select_memberPost(String mem_id) {
		return postDao.select_memberPost(mem_id);
	}

}
