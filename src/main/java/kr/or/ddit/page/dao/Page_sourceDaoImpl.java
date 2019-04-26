package kr.or.ddit.page.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.page.model.Page_sourceVo;

@Repository("page_sourceDao")
public class Page_sourceDaoImpl implements IPage_sourceDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_page_source(Page_sourceVo vo) {
		return sqlSession.insert("page_source.insert_page_source", vo);
	}

}
