package kr.or.ddit.patent_list.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.patent_list.model.Patent_listVo;
import kr.or.ddit.patent_list.service.IPatent_listService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Patent_listController {
	
	@Resource(name="patent_listService")
	private IPatent_listService patent_listService;
	
	@RequestMapping("/patent_listInsert")
	public String patent_listInsert(UsersVo usersVo, HttpServletRequest req, Patent_listVo patent_listVo) {
		
		patent_listService.insert_patent_list(patent_listVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/patent_listUpdate")
	public String patent_listUpdate(UsersVo usersVo, HttpServletRequest req, Patent_listVo patent_listVo) {
		
		patent_listService.update_patent_list(patent_listVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/patent_listDelete")
	public String patent_listUpdate(String patent_code) {
		patent_listService.delete_patent_list(patent_code);
		return "redirect:/profileHome";
		
	}
}
