package kr.or.ddit.search.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String searchResult(Model model, String search_word, HttpServletRequest request){
		
		PaginationVo paginationVo = new PaginationVo(1, 3);
		paginationVo.setSearch_word(search_word);
		Map<String, Object> resultMap = searchResultService.search_allInfo(paginationVo);
		
		List<SearchResultVo> userList = (List<SearchResultVo>) resultMap.get("userList");
		List<SearchResultVo> corpList = (List<SearchResultVo>) resultMap.get("corpList");
		
		model.addAttribute("userCount", userList.size());
		model.addAttribute("userList", userList);
		model.addAttribute("corpCount", corpList.size());
		model.addAttribute("corpList", corpList);
		model.addAttribute("search_word", search_word);
		
		return "searchResultTiles";
	}
	
}
