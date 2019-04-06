package kr.or.ddit.post.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post.dao.IPostDao;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

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
	public List<PostVo> select_memberPost(String writer_name) {
		return postDao.select_memberPost(writer_name);
	}

	@Override
	public List<PostVo> select_timelinePost(PaginationVo paginationVo) {
		return postDao.select_timelinePost(paginationVo);
	}

	@Override
	public PostVo select_postInfo(String post_code) {
		return postDao.select_postInfo(post_code);
	}

	@Override
	public List<PostVo> select_nextPost(PaginationVo paginationVo) {
		return postDao.select_nextPost(paginationVo);
	}

}
