package kr.or.ddit.recruit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;


@Controller
public class RecruitController {
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@Resource(name="search_logService")
	private ISearch_logService search_logService;
	
	@Resource(name="usersService")
	private IUsersService usersService;

	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	@RequestMapping("/recruit")
	public String recruit(HttpSession session, Model model){
		
//		model.addAttribute("companyList", companyList);
		
		// 임시로 session에 user값 넣기.
		session.setAttribute("usersVo", usersService.select_userInfo("brown"));
		
		// 저장한 검색어 리스트 넘기기.
		Search_logVo sVo = new Search_logVo();
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		sVo.setUser_id(uVo.getUser_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = search_logService.getSaveList(sVo);
		
		logger.debug("check1");
		model.addAttribute("saveList", saveList);
		
		return "recruit/recruit";
	}	
	
	@RequestMapping("/temp_search")
	public String temp_search(HttpServletRequest req, String search_word, String search_local, 
			HttpSession session, Model model){
		// 검색어 DB에 저장하기
		Search_logVo sVo = new Search_logVo();
//		logger.debug("search_local? : {}", search_local);
		sVo.setSearch_word(search_word);
		sVo.setSearch_local(search_local);
		sVo.setSearch_code(String.valueOf(search_logService.getAllCnt()+1));
		sVo.setSearch_save("1");
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		sVo.setUser_id(uVo.getUser_id());
		
		search_logService.insertSearch_log(sVo);
		
		return "redirect:"+req.getContextPath()+"/recruit";
	}	
	
	
	

}












