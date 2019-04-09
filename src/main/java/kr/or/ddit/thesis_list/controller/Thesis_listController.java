package kr.or.ddit.thesis_list.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.thesis_list.model.Thesis_listVo;
import kr.or.ddit.thesis_list.service.IThesis_listService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Thesis_listController {
	
	private Logger logger = LoggerFactory.getLogger(Thesis_listController.class);
	
	@Resource(name="thesis_listService")
	private IThesis_listService thesis_listService;
	
	@RequestMapping("/thesis_listInsert")
	public String careerInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Thesis_listVo thesis_listVo) {
		
		thesis_listService.insert_thesis_list(thesis_listVo);
		
		return "redirect:/profileHome";
		
	}
}
