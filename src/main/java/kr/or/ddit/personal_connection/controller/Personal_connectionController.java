package kr.or.ddit.personal_connection.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Personal_connectionController {
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 

	
	@RequestMapping(path={"/personalConnection"})
	public String personalConnectionView() {
		return "personalTiles";
	}
	
	
	@RequestMapping(path={"/connections"})
	public String connectionsView(Model model ,HttpServletRequest req) {
		
		//MemberVo memberVo = (MemberVo) req.getSession().getAttribute("memberVO");
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("lhh");
		
		List<UsersVo> personalList = 
				personalService.select_connections(memberVo);
		
		model.addAttribute(personalList);
		
		
		return "connectionsTiles";
	}
	
	
	@RequestMapping(path={"/company"})
	public String companyView() {
		return "companyTiles";
	}
	
	
	
	
	
}
