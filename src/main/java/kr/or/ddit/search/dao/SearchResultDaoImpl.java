package kr.or.ddit.search.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Repository("searchResultDao")
public class SearchResultDaoImpl implements ISearchResultDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<SearchResultVo> search_allInfo_user(PaginationVo paginationVo) {
		return sqlSession.selectList("search_result.search_allInfo_user", paginationVo);
	}

	@Override
	public List<SearchResultVo> search_allInfo_corp(PaginationVo paginationVo) {
		return sqlSession.selectList("search_result.search_allInfo_corp", paginationVo);
	}

}
