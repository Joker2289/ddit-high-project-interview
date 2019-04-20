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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.portfolio.model.PortfolioVo;
import kr.or.ddit.portfolio.service.IPortfolioService;
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
	
	@Resource(name="portfolioService")
	private IPortfolioService portfolioService;
	
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
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(userId);
		
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", userId);
		
		return "blog/blog_setting_form";
	}
	
	@RequestMapping("/addPortfolio")
	@ResponseBody
	public String addPortfolio(HttpServletRequest req, Model model, @RequestParam("user_id")String user_id) {
		
		PortfolioVo pVo = new PortfolioVo();
		pVo.setUser_id(user_id);
		pVo.setPortfolio_name("포트폴리오");
		
		portfolioService.insert_portfolio(pVo);
		
		String code = pVo.getPortfolio_code();
		
		return code;
	}
	
	@RequestMapping("/updatePortfolio")
	@ResponseBody
	public String updatePortfolio(HttpServletRequest req, Model model, 
			@RequestParam("portfolio_nm")String portfolio_nm, @RequestParam("portfolio_code")String portfolio_code) {
		
		PortfolioVo pVo = new PortfolioVo();
		pVo.setPortfolio_code(portfolio_code);
		pVo.setPortfolio_name(portfolio_nm);
		
		portfolioService.update_portfolio(pVo);
		
		return "dd";
	}
	
	
}
