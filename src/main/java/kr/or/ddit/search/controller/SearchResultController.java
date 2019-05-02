package kr.or.ddit.search.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.search.model.SearchResultVo;
import kr.or.ddit.search.service.ISearchResultService;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class SearchResultController {

	private Logger logger = LoggerFactory.getLogger(SearchResultController.class);
	
	@Resource(name="searchResultService")
	private ISearchResultService searchResultService;
	
	@Resource(name="followService")
	IFollowService followService;
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 
	
	@RequestMapping(path={"/searchResult"}, method=RequestMethod.GET)
	public String searchResult(Model model, String search_word, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		PaginationVo paginationVo = new PaginationVo(1, 6);
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setSearch_word(search_word);
		Map<String, Object> resultMap = searchResultService.search_allInfo(paginationVo);
		
		List<SearchResultVo> userList = (List<SearchResultVo>) resultMap.get("userList");
		List<SearchResultVo> corpList = (List<SearchResultVo>) resultMap.get("corpList");
		int userCount = (int) resultMap.get("userCount");
		int corpCount = (int) resultMap.get("corpCount");
		
		logger.debug("userCount >>>>>>>>>>>>>>>>>>>>>>>>> {}", userCount);
		
		model.addAttribute("userCount", userCount);
		model.addAttribute("userList", userList);
		model.addAttribute("corpCount", corpCount);
		model.addAttribute("corpList", corpList);
		model.addAttribute("search_word", search_word);
		
		return "searchResultTiles";
	}
	
	/**
	 * Method : corp_unfollow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param target_id
	 * @param request
	 * @return
	 * Method 설명 : 회사 언팔로우
	 */
	@RequestMapping(path={"/corp_unfollow"}, method=RequestMethod.POST)
	@ResponseBody
	public String corp_unfollow(String target_id, HttpServletRequest request){
		
		FollowVo followInfo = new FollowVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setRef_keyword(target_id);
		
		followService.delete_corpFollow(followInfo);
		
		return "complate";
	}
	
	/**
	 * Method : corp_follow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param target_id
	 * @param request
	 * @return
	 * Method 설명 : 회사 팔로우
	 */
	@RequestMapping(path={"/corp_follow"}, method=RequestMethod.POST)
	@ResponseBody
	public String corp_follow(String target_id, HttpServletRequest request){
		
		FollowVo followInfo = new FollowVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setRef_keyword(target_id);
		
		followService.insert_corpFollow(followInfo);
		
		return "complate";
	}
	
	@RequestMapping(path={"/user_connect"}, method=RequestMethod.POST)
	@ResponseBody
	public String user_connect(String target_id, HttpServletRequest request){
		
		Personal_connectionVo personalInfo = new Personal_connectionVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		personalInfo.setUser_id(memberInfo.getMem_id());
		personalInfo.setReceive_id(target_id);
		
		personalService.insert_connections(personalInfo);
		
		return "complate";
	}
	
	@RequestMapping(path={"/user_disconnect"}, method=RequestMethod.POST)
	@ResponseBody
	public String user_disconnect(String target_id, HttpServletRequest request){
		
		Personal_connectionVo personalInfo = new Personal_connectionVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		personalInfo.setUser_id(memberInfo.getMem_id());
		personalInfo.setReceive_id(target_id);
		
		personalService.delete_connections(personalInfo);
		
		return "complate";
	}
	
}
