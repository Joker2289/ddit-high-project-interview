package kr.or.ddit.blog.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.blog.model.Blog_visit_logVo;

@Repository("/visit_logDao")
public class Blog_visit_logDaoImpl implements IBlog_visit_logDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insert_visit_log(Blog_visit_logVo vo) {
		return sqlSession.insert("blog_visit_log.insert_visit_log", vo);
	}

}
