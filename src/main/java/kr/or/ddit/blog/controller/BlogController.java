package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.blog.model.BlogVo;
import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.corporation.model.CorporationVo;
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
	public String blogMainView(Model model, @RequestParam("user_id")String user_id) {
		
		//블로그 설정
		BlogVo bVo = blogService.select_blogInfo(user_id);
		
		if(bVo == null) {
			BlogVo blogInfo = new BlogVo();
			blogInfo.setUser_id(user_id);
			blogInfo.setBlog_name(user_id + " 님의 블로그");
			blogInfo.setCover_color("#99B4CF");
			blogInfo.setQna_act("y");
			blogInfo.setImg_act("n");
			blogInfo.setName_act("y");
			
			blogService.insert_blog(blogInfo);
			
			bVo = blogInfo;
		}
		model.addAttribute("bVo", bVo);
		
		
		//활동 정보
		UsersVo uVo = usersService.select_userInfo(user_id);
		
		int followerCnt = followService.getFollowerCnt(user_id);
		int followingCnt = followService.getFollowingCnt(user_id);
		model.addAttribute("uVo", uVo);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		//포트폴리오 리스트
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
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
	
	String id = ""; 
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
	public String blogSettingForm(Model model, @RequestParam("user_id")String user_id) {
		
		id = user_id;
		
		BlogVo bVo = blogService.select_blogInfo(user_id);
		model.addAttribute("bVo", bVo);
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", user_id);
		
		return "blog/blog_setting_form";
	}
	
	/**
	 * 
	 * Method : updateBlog
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param userId
	 * @return
	 * Method 설명 : 블로그 설정 수정
	 */
	@RequestMapping("/updateBlog")
	public String updateBlog(Model model, @RequestParam("user_id")String user_id,
			@RequestParam("update_param")String update_param,
			@RequestParam("update_content")String update_content) {
		
		BlogVo blogInfo = new BlogVo();
		blogInfo.setUser_id(user_id);
		
		switch(update_param) {
			case "blog_name":
				blogInfo.setBlog_name(update_content);
				break;
			case "name_act":
				blogInfo.setName_act(update_content);
				break;
			case "img_act":
				blogInfo.setImg_act(update_content);
				break;
		}
		
		logger.debug("blogInfo : {}", blogInfo);
		blogService.update_blog(blogInfo);
		
		BlogVo bVo = blogService.select_blogInfo(user_id);
		model.addAttribute("bVo", bVo);
		
		return "blog/head_area";
	}
	
	/**
	 * 
	 * Method : uploadImg
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param imageStorage
	 * @param req
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * Method 설명 : 이미지 업로드
	 */
	@RequestMapping(path="/uploadImg", consumes ={"multipart/form-data"})
	public String uploadImg(@RequestParam(value = "imageStorage") MultipartFile imageStorage, 
			HttpServletRequest req, Model model) throws IllegalStateException, IOException {
		
		logger.debug("imageStorage : {}", imageStorage);
		
		String realFileName = "";
		String tmpFileName = UUID.randomUUID().toString(); 
		
		if(imageStorage.getSize() > 0) {
			realFileName =  req.getServletContext().getRealPath("/images/blog/cover_img/" + tmpFileName);
			imageStorage.transferTo(new File(realFileName));
			
			BlogVo blogInfo = new BlogVo();
			blogInfo.setUser_id(id);
			blogInfo.setCover_img(tmpFileName);
			
			blogService.update_blog(blogInfo);
		}
		
		BlogVo bVo = blogService.select_blogInfo(id);
		model.addAttribute("bVo", bVo);
		
		return "blog/head_area";
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
		pVo.setIndex_color("#8344B2");
		
		portfolioService.insert_portfolio(pVo);
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", user_id);
		
		return "blog/portfolio_form";
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
		
		return "blog/portfolio_form";
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
			@RequestParam("user_id")String user_id,
			@RequestParam("color")String color) {
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("portfolio_code", portfolio_code);
		model.addAttribute("color", color);
		
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
	 * Method : color_menu
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @return
	 * Method 설명 : 컬러메뉴 소환
	 */
	@RequestMapping("/color_menu")
	public String color_menu(Model model, @RequestParam("portfolio_code")String portfolio_code) {
		
		model.addAttribute("portfolio_code", portfolio_code);
		
		return "blog/color_menu";
	}
	
	/**
	 * 
	 * Method : portfoio_color_change
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param user_id
	 * @return
	 * Method 설명 : 포트폴리오 인덱스 색변경
	 */
	@RequestMapping("/portfoio_color_change")
	public String portfoio_color_change(Model model, @RequestParam("user_id")String user_id,
			@RequestParam("portfolio_code")String portfolio_code,
			@RequestParam("color_code")String color_code) {
		
		PortfolioVo pVo = new PortfolioVo();
		pVo.setPortfolio_code(portfolio_code);
		pVo.setIndex_color(color_code);
		
		portfolioService.update_portfolio(pVo);
		
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("user_id", user_id);
		
		return "blog/portfolio_form";
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
	public String showSection(Model model, @RequestParam("portfolio_code")String portfolio_code,
			@RequestParam("color")String color) {
		
		List<SectionVo> sectionList = sectionService.select_sectionList(portfolio_code);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("color", color);
		
		return "blog/section_area";
	}
	
	/**
	 * 
	 * Method : content_area
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param portfolio_code
	 * @param color
	 * @return
	 * Method 설명 : main - content_area 출력
	 */
	@RequestMapping("/content_area")
	public String content_area(Model model) {
		return "blog/content_area";
	}
	
	/**
	 * 
	 * Method : page_area_select
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param portfolio_code
	 * @param color
	 * @return
	 * Method 설명 : 선택한 섹션의 페이지 리스트 출력
	 */
	@RequestMapping("/page_area_select")
	public String page_area_select(Model model, @RequestParam("section_code")String section_code,
			@RequestParam("color")String color) {
		
		
		return "blog/page_area_select";
	}
	
	
	
	
}
