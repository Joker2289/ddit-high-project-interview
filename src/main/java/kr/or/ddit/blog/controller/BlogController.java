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

import kr.or.ddit.blog.model.BlogVo;
import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.portfolio.model.PortfolioVo;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.section.model.SectionVo;
import kr.or.ddit.section.service.ISectionService;
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
	
	@Resource(name="blogService")
	private IBlogService blogService;
	
	@Resource(name="followService")
	private IFollowService followService;
	
	@Resource(name="portfolioService")
	private IPortfolioService portfolioService;
	
	@Resource(name="sectionService")
	private ISectionService sectionService;
	
	
	
	/**
	 * 
	 * Method : blogView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @return
	 * Method 설명 : Blog 페이지 이동
	 */
	@RequestMapping(path={"blogMainView"}, method = RequestMethod.GET)
	public String blogMainView(Model model, @RequestParam("userId")String userId) {
		
		BlogVo bVo = blogService.select_blogInfo(userId);
		
		if(bVo == null) {
			BlogVo blogInfo = new BlogVo();
			blogInfo.setUser_id(userId);
			blogInfo.setBlog_name(userId + " 님의 블로그");
			blogInfo.setCover_color("#99B4CF");
			blogInfo.setQna_act("y");
			blogInfo.setImg_act("n");
			blogInfo.setName_act("y");
			
			blogService.insert_blog(blogInfo);
			
			bVo = blogInfo;
		}
		
		model.addAttribute("bVo", bVo);
		
		
		UsersVo uVo = usersService.select_userInfo(userId);
		
		//활동 정보
		int followerCnt = followService.getFollowerCnt(userId);
		int followingCnt = followService.getFollowingCnt(userId);
		model.addAttribute("uVo", uVo);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		//포트폴리오 리스트
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(userId);
		model.addAttribute("portfolioList", portfolioList);
		
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
	public String activityFollower(Model model, @RequestParam("userId")String userId) {
		
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
	public String activityFollowing(Model model, @RequestParam("userId")String userId) {
		
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
	public String blogSettingForm(Model model, @RequestParam("userId")String userId) {
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(userId);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", userId);
		
		return "blog/blog_setting_form";
	}
	
	/**
	 * 
	 * Method : addPortfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param user_id
	 * @return
	 * Method 설명 : 포트폴리오 추가
	 */
	@RequestMapping("/addPortfolio")
	public String addPortfolio(Model model, @RequestParam("user_id")String user_id) {
		
		PortfolioVo pVo = new PortfolioVo();
		pVo.setUser_id(user_id);
		pVo.setPortfolio_name("포트폴리오");
		
		portfolioService.insert_portfolio(pVo);
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", user_id);
		
		return "blog/blog_setting_form";
	}
	
	/**
	 * 
	 * Method : updatePortfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param portfolio_nm
	 * @param portfolio_code
	 * @return
	 * Method 설명 : 포트폴리오 수정
	 */
	@RequestMapping("/updatePortfolio")
	public String updatePortfolio(Model model, 
			@RequestParam("portfolio_nm")String portfolio_nm, 
			@RequestParam("portfolio_code")String portfolio_code,
			@RequestParam("user_id")String user_id) {
		
		PortfolioVo pVo = new PortfolioVo();
		pVo.setPortfolio_code(portfolio_code);
		pVo.setPortfolio_name(portfolio_nm);
		
		portfolioService.update_portfolio(pVo);
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", user_id);
		
		return "blog/blog_setting_form";
	}
	
	/**
	 * 
	 * Method : deletePortfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param portfolio_code
	 * @return
	 * Method 설명 : 포트폴리오 삭제
	 */
	@RequestMapping("/deletePortfolio")
	@ResponseBody
	public String deletePortfolio(Model model, @RequestParam("portfolio_code")String portfolio_code) {
		
		portfolioService.delete_portfolio(portfolio_code);
		
		return "dd";
	}
	
	/**
	 * 
	 * Method : sectionSettingForm
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param portfolio_code
	 * @param user_id
	 * @return
	 * Method 설명 : 섹션 설정 페이지 조회
	 */
	@RequestMapping("/sectionSettingForm")
	public String sectionSettingForm(Model model, @RequestParam("portfolio_code")String portfolio_code,
			@RequestParam("user_id")String user_id) {
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("portfolio_code", portfolio_code);
		
		return "blog/section_setting_form";
	}
	
	/**
	 * 
	 * Method : addSection
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param portfolio_code
	 * @param user_id
	 * @return
	 * Method 설명 : 섹션 추가
	 */
	@RequestMapping("/addSection")
	public String addSection(Model model, @RequestParam("portfolio_code")String portfolio_code) {
		
		SectionVo sVo = new SectionVo();
		sVo.setPortfolio_code(portfolio_code);
		sVo.setSection_name("섹션");
		
		sectionService.insert_section(sVo);
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("portfolio_code", portfolio_code);
		model.addAttribute("section_code", sVo.getSection_code());
		
		return "blog/section_setting_form";
	}
	
	/**
	 * 
	 * Method : updateSection
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param section_nm
	 * @param section_code
	 * @param portfolio_code
	 * @return
	 * Method 설명 : 섹션 수정
	 */
	@RequestMapping("/updateSection")
	public String updateSection(Model model, @RequestParam("section_nm")String section_nm, 
			@RequestParam("section_code")String section_code,
			@RequestParam("portfolio_code")String portfolio_code) {
		
		SectionVo sVo = new SectionVo();
		sVo.setSection_code(section_code);
		sVo.setSection_name(section_nm);
		
		sectionService.update_section(sVo);
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("portfolio_code", portfolio_code);
		model.addAttribute("section_code", sVo.getSection_code());
		
		return "blog/section_setting_form";
	}
	
	/**
	 * 
	 * Method : deleteSection
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param portfolio_code
	 * @return
	 * Method 설명 : 섹션 삭제
	 */
	@RequestMapping("/deleteSection")
	@ResponseBody
	public String deleteSection(Model model, @RequestParam("section_code")String section_code) {
		
		sectionService.delete_section(section_code);
		
		return "dd";
	}
	
	/**
	 * 
	 * Method : showPortfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param portfolio_code
	 * @return
	 * Method 설명 : 포트폴리오 리스트 출력
	 */
	@RequestMapping("/showPortfolio")
	public String showPortfolio(Model model, @RequestParam("user_id")String user_id) {
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		
		model.addAttribute("portfolioList", portfolioList);
		
		return "blog/portfolio_area";
	}
	
	/**
	 * 
	 * Method : showSection
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param section_code
	 * @return
	 * Method 설명 : 팝오버 div에 섹션리스트 출력
	 */
	@RequestMapping("/showSection")
	public String showSection(Model model, @RequestParam("portfolio_code")String portfolio_code) {
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		
		model.addAttribute("sectionList", sectionList);
		
		return "blog/section_area";
	}
	
	
	
	
}
