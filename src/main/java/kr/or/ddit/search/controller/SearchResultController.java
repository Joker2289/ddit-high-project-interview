package kr.or.ddit.search.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.search.service.ISearchResultService;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class SearchResultController {

	private Logger logger = LoggerFactory.getLogger(SearchResultController.class);
	
	@Resource(name="searchResultService")
	private ISearchResultService searchResultService;
	
	@RequestMapping(path={"/searchResult"}, method=RequestMethod.GET)
	public String searchResult(Model model, String search_word){
		
		PaginationVo paginationVo = new PaginationVo(1, 3);
		Map<String, Object> resultMap = searchResultService.search_allInfo(paginationVo);
		
		List<SearchResultVo> userList = (List<SearchResultVo>) resultMap.get("userList");
		List<SearchResultVo> corpList = (List<SearchResultVo>) resultMap.get("corpList");
		
		
		
//		if(searchResult.size() == 0){
//			model.addAttribute("resultCount", "0");
//		} else {
//			model.addAttribute("resultCount", searchResult.size());
//		}
//		model.addAttribute("searchResult", searchResult);
//		model.addAttribute("search_word", search_word);
		return "searchResultTiles";
	}
	
}
