package kr.or.ddit.personal_connection.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Personal_connectionController {
	
	private Logger logger = LoggerFactory.getLogger(Personal_connectionController.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 

	
	@RequestMapping(path={"/personalConnection"})
	public String personalConnectionView(Model model) {
		
		//MemberVo memberVo = (MemberVo) req.getSession().getAttribute("memberVO");
		
		MemberVo memberVo = new MemberVo();
		FollowVo followVo = new FollowVo();
		followVo.setDivision("43");
		memberVo.setMem_id("lhh");
		
		int connections_count = personalService.connections_count(memberVo);
		int corporation_count = personalService.corporation_count(followVo);
		
		model.addAttribute("connections_count" , connections_count);
		model.addAttribute("corporation_count" , corporation_count);
		
		return "personalTiles";
	}
	
	
	@RequestMapping(path={"/connections"})
	public String connectionsView(Model model ,HttpServletRequest req) {
		
		//MemberVo memberVo = (MemberVo) req.getSession().getAttribute("memberVO");
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("lhh");
		
		List<UsersVo> personalList = 
				personalService.select_connections(memberVo);
		int connections_count = personalService.connections_count(memberVo);
		
		model.addAttribute("personalList", personalList);
		model.addAttribute("connections_count" , connections_count);
		
		return "connectionsTiles";
	}
	
	
	@RequestMapping(path={"/coporation"})
	public String companyView() {
		return "companyTiles";
	}
	
	
	
	
	
}
