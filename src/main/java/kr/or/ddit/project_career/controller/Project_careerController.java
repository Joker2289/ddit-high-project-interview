package kr.or.ddit.project_career.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.possesion_skills.controller.Possesion_skillsController;
import kr.or.ddit.project_career.model.Project_careerVo;
import kr.or.ddit.project_career.service.IProject_careerService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Project_careerController {
	
	private Logger logger = LoggerFactory.getLogger(Possesion_skillsController.class);
	
	@Resource(name="project_careerService")
	private IProject_careerService project_careerService;
	
	@RequestMapping("/project_careerInsert")
	public String careerInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Project_careerVo project_careerVo) {
		
		project_careerService.insert_project_career(project_careerVo);
		
		return "redirect:/profileHome";
		
	}
}
