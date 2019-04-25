package kr.or.ddit.page.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.page.model.PageVo;

@Repository("pageDao")
public class PageDaoImpl implements IPageDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert_page(PageVo vo) {
		return sqlSession.insert("page.insert_page", vo);
	}

}
