package kr.or.ddit.award_history.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.award_history.model.Award_historyVo;
import kr.or.ddit.award_history.service.IAward_historyService;
import kr.or.ddit.possesion_skills.controller.Possesion_skillsController;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Award_historyController {
	
	private Logger logger = LoggerFactory.getLogger(Possesion_skillsController.class);
	
	@Resource(name="award_historyService")
	private IAward_historyService award_historyService;
	
	@RequestMapping("/award_historyInsert")
	public String award_historyInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Award_historyVo award_historyVo) {
		
		award_historyService.insert_award_history(award_historyVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/award_historyUpdate")
	public String award_historyUpdate(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Award_historyVo award_historyVo) {
		
		award_historyService.update_award_history(award_historyVo);
		
		return "redirect:/profileHome";
		
	}
}
