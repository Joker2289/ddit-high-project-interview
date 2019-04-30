package kr.or.ddit.search.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchResultController {

	private Logger logger = LoggerFactory.getLogger(SearchResultController.class);
	
	@RequestMapping(path={"/searchResult"}, method=RequestMethod.GET)
	public String searchResult(Model model, String search_word){
		
		model.addAttribute("search_word", search_word);
		return "searchResultTiles";
	}
	
}
