package kr.or.ddit.page.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.page.model.Page_linkVo;

@Repository("page_linkDao")
public class Page_linkDaoImpl implements IPage_linkDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_page_link(Page_linkVo vo) {
		return sqlSession.insert("page_link.insert_page_link", vo);
	}

	@Override
	public List<Page_linkVo> select_page_link(String page_code) {
		return sqlSession.selectList("page_link.select_page_link", page_code);
	}

}
