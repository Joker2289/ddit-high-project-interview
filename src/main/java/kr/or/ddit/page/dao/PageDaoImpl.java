package kr.or.ddit.page.dao;

import java.util.List;

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

	@Override
	public List<PageVo> select_pageList(String section_code) {
		return sqlSession.selectList("page.select_pageList", section_code);
	}

	@Override
	public PageVo select_pageInfo(String page_code) {
		return sqlSession.selectOne("page.select_pageInfo", page_code);
	}

	@Override
	public int update_page(PageVo vo) {
		return sqlSession.update("page.update_page", vo);
	}

	@Override
	public int delete_page(String page_code) {
		return sqlSession.delete("page.delete_page", page_code);
	}
	
}
