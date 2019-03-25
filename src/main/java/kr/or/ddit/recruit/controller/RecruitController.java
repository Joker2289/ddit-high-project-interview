package kr.or.ddit.recruit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;


@Controller
public class RecruitController {
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@Resource(name="search_logService")
	private ISearch_logService search_logService;

	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	@RequestMapping("/recruit")
	public String recruit(Model model){
		
//		model.addAttribute("companyList", companyList);
		
		return "recruit/recruit";
	}	
	
	@RequestMapping("/temp_search")
	public String temp_search(HttpServletRequest req, String search_word, String search_local, Model model){
		// 검색어 DB에 저장하기
		Search_logVo sVo = new Search_logVo();
//		logger.debug("param? : {}", search_word);
		sVo.setSearch_word(search_word);
		sVo.setSearch_local(search_local);
		sVo.setSearch_code(String.valueOf(search_logService.getAllCnt()+1));
		
		search_logService.insertSearch_log(sVo);
		
		return "redirect:"+req.getContextPath()+"/recruit";
	}	
	
	
	

}












