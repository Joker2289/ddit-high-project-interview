package kr.or.ddit.blog.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IBlogDao;
import kr.or.ddit.blog.model.BlogVo;

@Service("blogService")
public class BlogServiceImpl implements IBlogService{

	@Resource(name="blogDao")
	private IBlogDao blogDao;
	
	@Override
	public int insert_blog(BlogVo vo) {
		return blogDao.insert_blog(vo);
	}

	@Override
	public int update_blog(BlogVo vo) {
		return blogDao.update_blog(vo);
	}

	@Override
	public BlogVo select_blogInfo(String user_id) {
		return blogDao.select_blogInfo(user_id);
	}

}
