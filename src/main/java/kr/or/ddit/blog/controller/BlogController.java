package kr.or.ddit.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@RequestMapping("/blog")
@Controller
public class BlogController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="followService")
	private IFollowService followService;
	
	/**
	 * 
	 * Method : blogView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @return
	 * Method 설명 : 나의 Blog 페이지 이동
	 */
	@RequestMapping(path={"blogMainView"}, method = RequestMethod.GET)
	public String blogMainView(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		UsersVo uVo = usersService.select_userInfo(userId);
		
		int followerCnt = followService.getFollowerCnt(userId);
		int followingCnt = followService.getFollowingCnt(userId);
		
		model.addAttribute("uVo", uVo);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		return "blogTiles";
	}
	
	/**
	 * 
	 * Method : activityFollower
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param userId
	 * @return
	 * Method 설명 : 팔로워 리스트 조회
	 */
	@RequestMapping("/activityFollower")
	public String activityFollower(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		List<FollowVo> followerList = followService.select_followerList(userId);
		
		model.addAttribute("followList", followerList);
		
		return "blog/follower_body";
	}
	
	/**
	 * 
	 * Method : activityFollowing
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param userId
	 * @return
	 * Method 설명 : 팔로잉 리스트 조회
	 */
	@RequestMapping("/activityFollowing")
	public String activityFollowing(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		List<FollowVo> followingList = followService.select_followingList(userId);
		
		model.addAttribute("followList", followingList);
		
		return "blog/following_body";
	}
	
	/**
	 * 
	 * Method : settingForm
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param userId
	 * @return
	 * Method 설명 : 블로그 설정 페이지로 이동
	 */
	@RequestMapping("/blogSettingForm")
	public String blogSettingForm(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		
		
		return "blog/blog_setting_form";
	}
	
	
}
