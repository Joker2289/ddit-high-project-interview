package kr.or.ddit.personal_connection.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;

@Controller
public class Personal_connectionController {
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 

	
	@RequestMapping(path={"/personalConnection"})
	public String personalConnectionView() {
		return "personalTiles";
	}
	
	
	@RequestMapping(path={"/connections"})
	public String connectionsView(Model model , MemberVo membervo) {
		
		List<Personal_connectionVo> personalList = 
				personalService.select_connections(membervo);
		
		model.addAttribute(personalList);
		
		
		return "connectionsTiles";
	}
	
	
	@RequestMapping(path={"/company"})
	public String companyView() {
		return "companyTiles";
	}
	
	
	
	
	
}
