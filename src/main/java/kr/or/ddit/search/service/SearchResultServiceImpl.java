package kr.or.ddit.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.search.dao.ISearchResultDao;
import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("searchResultService")
public class SearchResultServiceImpl implements ISearchResultService {

	@Resource(name="searchResultDao")
	private ISearchResultDao searchResultDao;
	
	@Override
	public Map<String, Object> search_allInfo(PaginationVo paginationVo) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<SearchResultVo> userList = searchResultDao.search_allInfo_user(paginationVo);
		List<SearchResultVo> corpList = searchResultDao.search_allInfo_corp(paginationVo);
		
		resultMap.put("userList", userList);
		resultMap.put("corpList", corpList);
		
		return resultMap;
	}

}
