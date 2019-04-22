package kr.or.ddit.blog.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.blog.model.BlogVo;

@Repository("blogDao")
public class BlogDaoImpl implements IBlogDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_blog(BlogVo vo) {
		return sqlSession.insert("blog.insert_blog", vo);
	}

	@Override
	public int update_blog(BlogVo vo) {
		return sqlSession.update("blog.update_blog", vo);
	}

	@Override
	public BlogVo select_blogInfo(String user_id) {
		return sqlSession.selectOne("blog.select_blogInfo", user_id);
	}

}
