package kr.or.ddit.personal_connection.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String personalConnectionView(Model model , HttpSession session) {
		
		//MemberVo member =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		//member.setMem_id();
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("lhh");
		
		FollowVo followVo = new FollowVo();
		followVo.setDivision("11");
		followVo.setMem_id("lhh");
		
		int connections_count = personalService.connections_count(memberVo);
		int coporations_count = personalService.coporations_count(followVo);
		
		model.addAttribute("connections_count" , connections_count);
		model.addAttribute("coporations_count", coporations_count);
		
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
	
	@RequestMapping(path={"/feedFollowing"})
	public String feedFollowingView(Model model, HttpSession session) {
		MemberVo memberVo =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(memberVo.getMem_id());
		followVo.setDivision("11");
		
		List<CorporationVo> corporationList = personalService.select_followCoporation(followVo);
		
		model.addAttribute("corporationList", corporationList);
		logger.debug("corporationList {}" , corporationList);
		
		return "feedFollowingTiles";
		
	}
	
	
	@RequestMapping(path={"/connectionApply"})
	public String connectionApplyView() {
		return "connectionApplyTiles";
		
	}
	
	
	@RequestMapping(path={"/filterSearch"})
	public String filterSearchView() {
		return null;
		
	}
	

	@RequestMapping(path={"/feed"})
	public String feedView(String str,Model model, HttpSession session) {
		MemberVo memberVo =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(memberVo.getMem_id());
		followVo.setDivision("11");
		
		
		if (str.equals("connections")) {
			
			List<UsersVo> followConnections =
					personalService.select_followConnections(memberVo);
			
			model.addAttribute("followConnections", followConnections);
			
			return "/personalConnection/feedFilter/feedConnections";
		}else if(str.equals("connectionEtc")) {
			
			return "/personalConnection/feedFilter/feedConnectionEtc";
		}else if(str.equals("company")) {
			
			followVo.setDivision("11");
			List<CorporationVo> corporationList = personalService.select_followCoporation(followVo);
			model.addAttribute("corporationList", corporationList);
			return "/personalConnection/feedFilter/feedCompany";
		}else{
			
			List<FollowVo> hashTagList =
					personalService.select_followHashTag(memberVo);
			model.addAttribute("hashTagList", hashTagList);
			
			return "/personalConnection/feedFilter/feedHashTag";
			
		}
		
	}
	
	
	
	
	
	
}
