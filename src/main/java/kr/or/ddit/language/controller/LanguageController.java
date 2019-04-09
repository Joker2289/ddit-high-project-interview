package kr.or.ddit.language.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.language.model.LanguageVo;
import kr.or.ddit.language.service.ILanguageService;
import kr.or.ddit.possesion_skills.controller.Possesion_skillsController;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class LanguageController {
	
private Logger logger = LoggerFactory.getLogger(Possesion_skillsController.class);
	
	@Resource(name="languageService")
	private ILanguageService languageService;
	
	@RequestMapping("/languageInsert")
	public String careerInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, LanguageVo languageVo) {
		
		languageService.insert_language(languageVo);
		
		return "redirect:/profileHome";
		
	}
}
