package kr.or.ddit.personal_connection.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.corporation.model.CorporationVo;
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
		//FollowVo followVo = new FollowVo();
		memberVo.setMem_id("lhh");
		
		int connections_count = personalService.connections_count(memberVo);
		
		model.addAttribute("connections_count" , connections_count);
		
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
	public String companyView(Model model) {
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id("lhh");
		followVo.setDivision("11");
		
		List<CorporationVo> corporationList = personalService.select_followCoporation(followVo);
		
		model.addAttribute("corporationList", corporationList);
		logger.debug("corporationList==== {}" , corporationList);
		
		return "companyTiles";
	}
	
	
	@RequestMapping(path={"/feedFollowing"})
	public String feedFollowingView(Model model) {
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id("lhh");
		followVo.setDivision("11");
		
		List<CorporationVo> corporationList = personalService.select_followCoporation(followVo);
		
		model.addAttribute("corporationList", corporationList);
		logger.debug("corporationList==== {}" , corporationList);
		
		return "feedFollowingTiles";
		
	}
	
	
	
	
	
}
