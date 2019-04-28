package kr.or.ddit.page.dao;

import java.util.List;

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

	@Override
	public List<Page_sourceVo> select_page_source(String page_code) {
		return sqlSession.selectList("page_source.select_page_source", page_code);
	}

	@Override
	public int delete_page_source(String page_code) {
		return sqlSession.delete("page_source.delete_page_source", page_code);
	}

}
