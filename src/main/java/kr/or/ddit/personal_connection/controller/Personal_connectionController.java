package kr.or.ddit.personal_connection.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class Personal_connectionController {
	
	private Logger logger = LoggerFactory.getLogger(Personal_connectionController.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 
	
	
	@RequestMapping(path={"/personalConnection"})
	public String personalConnectionView(Model model , HttpSession session, HttpServletRequest req) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
	      
		logger.debug(path + File.separator);
		
		MemberVo memberVo =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(memberVo.getMem_id());
		
		String user_id = memberVo.getMem_id();
		logger.debug("user_id++ {} " , user_id);
		
		int connections_count = personalService.connections_count(memberVo);
		int coporations_count = personalService.coporations_count(followVo);
		List<UsersVo> schoolFriends = 
				personalService.schoolFriendsSearch(user_id);
		
		model.addAttribute("connections_count" , connections_count);
		model.addAttribute("coporations_count", coporations_count);
		model.addAttribute("schoolFriends", schoolFriends);
		logger.debug("schoolFriends++ {}" , schoolFriends);
		
		return "personalTiles";
	}
	
	
	@RequestMapping(path={"/recommendUsers"})
	public String recommendUsersView(HttpSession session , Model model, PaginationVo paginationVo) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		paginationVo.setUser_id(memberVo.getMem_id());
		paginationVo.setPageSize(4);
		
		List<UsersVo> userList = personalService.recommendUsers(paginationVo);
		
		model.addAttribute("userList", userList);
		
		return "/personalConnection/recommend/recommendUsers";
	}
	
	
	@RequestMapping(path={"/recommendCorpor"})
	public String recommendCorporView() {
		
		return "/personalConnection/recommend/recommendCorpor";
	}
	
	
	@RequestMapping(path={"/connections"})
	public String connectionsView(HttpSession session , Model model , HttpServletRequest req) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		memberVo.setMem_id(memberVo.getMem_id());
		
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
		int allFollowCount = personalService.allFollowCnt(followVo);
		
		model.addAttribute("corporationList", corporationList);
		model.addAttribute("allFollowCount", allFollowCount);
		logger.debug("corporationList {}" , corporationList);
		
		return "feedFollowingTiles";
	}
	
	
	@RequestMapping(path={"/connectionReceiveApply"})
	public String connectionApplyView(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		String receive_id = memberVo.getMem_id();
		
		List<UsersVo> connectionReceiveList = personalService.select_connectionReceiveList(receive_id);
		logger.debug("connectionReceiveList++ {}" , connectionReceiveList);
		
		model.addAttribute("connectionReceiveList", connectionReceiveList);
		
		return "connectionReceiveApplyTiles";
	}
	
	
	@RequestMapping(path={"/receiveApply"})
		public String receiveApply(Personal_connectionVo personalVo) {
		
		personalService.update_connectionReceiveApply(personalVo);
		
		return "redirect:/connectionReceiveApply";
		}
	
	
	@RequestMapping(path={"/receiveCancel"})
		public String receiveCancel(Personal_connectionVo personalVo) {
		
		personalService.delete_connectionCancel(personalVo);
		
			return "redirect:/connectionReceiveApply";
	}
	
	
	@RequestMapping(path={"/sendCancel"})
		public String sendCancel(Personal_connectionVo personalVo) {
		
		personalService.delete_connectionCancel(personalVo);
		
			return "redirect:/connectionSendApply";
	}
	
	
	@RequestMapping(path={"/connectionSendApply"})
	public String connectionSendApplyView(HttpSession session , Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		String user_id = memberVo.getMem_id();
		
		List<UsersVo> connectionSendList = personalService.select_connectionSendList(user_id);
		logger.debug("connectionSendList+++ {}" , connectionSendList);
		
		model.addAttribute("connectionSendList", connectionSendList);
		
		
		return "connectionSendApplyTiles";
	}
	
	
	@RequestMapping(path={"/filterSearch"})
	public String filterSearchView(HttpSession session , Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		String user_id = memberVo.getMem_id();
		
		List<UsersVo> localList 		  = personalService.filterSearchLocal(user_id);
		List<Career_infoVo> presentCorpor = personalService.filterSearchPresentCorpor(user_id);
		List<Career_infoVo> pastCorpor 	  = personalService.filterSearchPastCorpor(user_id);
		List<Career_infoVo> jobPosition   = personalService.filtersearchjobPosition(user_id);
		List<Education_infoVo> school 	  = personalService.filterSearchSchool(user_id);
		
		model.addAttribute("localList", localList);
		model.addAttribute("presentCorpor", presentCorpor);
		model.addAttribute("pastCorpor", pastCorpor);
		model.addAttribute("jobPosition", jobPosition);
		model.addAttribute("school", school);

		
		return "filterSearchTiles";
	}
	

	@RequestMapping(path={"/feed"})
	public String feedView(String str,Model model, HttpSession session) {
		MemberVo memberVo =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(memberVo.getMem_id());
		
		
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
	
	
	@RequestMapping(path={"/feedFollow"})
	public String feedFollowView(HttpSession session , Model model) {
		
		MemberVo memberVo =(MemberVo) session.getAttribute("SESSION_MEMBERVO");
		String mem_id = memberVo.getMem_id();
		
		
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(memberVo.getMem_id());
		followVo.setDivision("11");
		int allFollowCount = personalService.allFollowCnt(followVo);
		
		
		List<HashMap<String,String>> resultMapList = new ArrayList<HashMap<String,String>>();
		
		List<CorporationVo> corpList = personalService.feedFollowCorporation(mem_id);
		for(CorporationVo list : corpList) {
			HashMap<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("title", list.getCorp_name());
			resultMap.put("content", list.getIndustry_type());
			resultMap.put("corp_id", list.getCorp_id());
			resultMap.put("imgPath", list.getLogo_path());
			resultMap.put("type", "c");
			resultMapList.add(resultMap);
		}
		
		List<UsersVo> UserList = personalService.feedFollowUser(mem_id);
		for(UsersVo list : UserList) {
			HashMap<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("title", list.getUser_name());
			resultMap.put("content", list.getIntroduce());
			resultMap.put("user_id", list.getUser_id());
			resultMap.put("imgPath", list.getProfile_path());
			resultMap.put("type", "u");
			resultMapList.add(resultMap);
		}
		
		List<HashtagVo> hashTagList = personalService.feedFollowHashTag(mem_id);
		for(HashtagVo list : hashTagList) {
			HashMap<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("title", list.getHashtag_name());
			resultMapList.add(resultMap);
		}
		
		model.addAttribute("resultMapList",resultMapList);
		model.addAttribute("allFollowCount", allFollowCount);

		return "feedFollowTiles";
	}
	
	
	@RequestMapping(path={"/peopleSearch"})
	public String peopleSearch(String user_id,
							   String[] localArr,
							   String[] presentCorporArr,
							   String[] pastCorporArr,
							   String[] jobPositionArr,
							   String[] schoolArr){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<String> localList 		= new ArrayList<>();
		ArrayList<String> presentCorporList = new ArrayList<>();
		ArrayList<String> pastCorporList 	= new ArrayList<>();
		ArrayList<String> jobPositionList 	= new ArrayList<>();
		ArrayList<String> schoolList 		= new ArrayList<>();
		
		localList.toArray(localArr);
		presentCorporList.toArray(presentCorporArr);
		pastCorporList.toArray(pastCorporArr);
		jobPositionList.toArray(jobPositionArr);
		schoolList.toArray(schoolArr);
		
		map.put("localList", localList);
		map.put("presentCorporList", presentCorporList);
		map.put("pastCorporList", pastCorporList);
		map.put("jobPositionList", jobPositionList);
		map.put("schoolList", schoolList);
		map.put("user_id", user_id);
		
		return "";
	}
	
	
	@RequestMapping(path={"/connectionSend"})
	public String connectionSend(Personal_connectionVo personalVo) {
		
		personalService.insert_connections(personalVo);
		
		return "redirect:/personalConnection";
	}
	
	
	@RequestMapping(path={"/recommendUser"})
	public String recommendUser(Personal_connectionVo personalVo) {
		
		personalService.insert_connections(personalVo);
		
		return "redirect:/personalConnection";
	}
	
	
	@RequestMapping(path={"/connectionOff"})
	public String connectionOff(Personal_connectionVo personalVo) {
		
		personalService.delete_connections(personalVo);
		
		return "redirect:/connections";
	}
	
	
	
	
}
