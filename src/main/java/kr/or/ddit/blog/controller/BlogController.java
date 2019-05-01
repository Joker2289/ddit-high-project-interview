package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.jpa.support.PersistenceAnnotationBeanPostProcessor;
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
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.good.service.IGoodService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.page.service.IPageService;
import kr.or.ddit.portfolio.model.PortfolioVo;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.post_comment.service.ICommentService;
import kr.or.ddit.section.model.SectionVo;
import kr.or.ddit.section.service.ISectionService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;

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
	
	@Resource(name="pageService")
	private IPageService pageService;
	
	@Resource(name="goodService")
	private IGoodService goodService;
	
	@Resource(name="commentService")
	private ICommentService commentService;
	
	
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
	public String blogMainView(HttpServletRequest req, Model model, @RequestParam("user_id")String user_id) {
		
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
		model.addAttribute("user_id", user_id);
		
		
		//활동 정보
		UsersVo uVo = usersService.select_userInfo(user_id);
		
		int followerCnt = followService.getFollowerCnt(user_id);
		int followingCnt = followService.getFollowingCnt(user_id);
		int pageCnt = pageService.select_pageCnt(user_id);
		int goodCnt = goodService.select_goodCnt(user_id);
		
		model.addAttribute("uVo", uVo);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("goodCnt", goodCnt);
		
		//포트폴리오 리스트
		List<PortfolioVo> portfolioList = portfolioService.select_portfolioList(user_id);
		model.addAttribute("portfolioList", portfolioList);
		
		//페이지 리스트
		List<PageVo> pageList = pageService.select_pageAllList(user_id);
		model.addAttribute("pageList", pageList);
		
		
		//goodList 담기
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		GoodVo gVo = new GoodVo();
		gVo.setMem_id(mVo.getMem_id());
		gVo.setDivision("22");
		List<GoodVo> goodList = goodService.select_goodList(gVo);
		model.addAttribute("goodList", goodList);
		
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
	public String page_area_select(HttpServletRequest req, Model model, @RequestParam("section_code")String section_code) {
		
		//포트폴리오, 섹션 VO 담기
		SectionVo sVo = sectionService.select_sectionInfo(section_code);
		PortfolioVo pVo = portfolioService.select_portfolioInfo(sVo.getPortfolio_code());
		model.addAttribute("pVo", pVo);
		model.addAttribute("sVo", sVo);
		
		//pageList 담기
		List<PageVo> pageList = pageService.select_pageList(section_code);
		model.addAttribute("pageList", pageList);
		
		//goodList 담기
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		GoodVo gVo = new GoodVo();
		gVo.setMem_id(mVo.getMem_id());
		gVo.setDivision("22");
		List<GoodVo> goodList = goodService.select_goodList(gVo);
		model.addAttribute("goodList", goodList);
		
		return "blog/page_area_select";
	}
	
	
	/**
	 * 
	 * Method : good_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param page_code
	 * @return
	 * Method 설명 : 전체 페이지 조회 화면에서 좋아요
	 */
	@RequestMapping("/good_page")
	public String good_page(HttpServletRequest req, Model model, 
			@RequestParam("page_code")String page_code,
			@RequestParam("user_id")String user_id) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//좋아요 등록
		GoodVo gVo = new GoodVo();
		gVo.setMem_id(mVo.getMem_id());
		gVo.setRef_code(page_code);
		gVo.setDivision("22");
		goodService.insert_goodInfo(gVo);
		
		
		//goodList 담기
		List<GoodVo> goodList = goodService.select_goodList(gVo);
		model.addAttribute("goodList", goodList);
		
		if(!user_id.equals("#")) {
			model.addAttribute("user_id", user_id);
			
			//전체 pageList 담기
			List<PageVo> pageList = pageService.select_pageAllList(user_id);
			model.addAttribute("pageList", pageList);
			
			return "blog/page_area";
		}
		
		
		
		//섹션 선택 페이지 일경우
		//pageList 담기
		PageVo pageInfo = pageService.select_pageInfo(page_code);
		List<PageVo> pageList = pageService.select_pageList(pageInfo.getSection_code());
		model.addAttribute("pageList", pageList);
		
		//포트폴리오, 섹션 VO 담기
		SectionVo sVo = sectionService.select_sectionInfo(pageInfo.getSection_code());
		PortfolioVo pVo = portfolioService.select_portfolioInfo(sVo.getPortfolio_code());
		model.addAttribute("sVo", sVo);
		model.addAttribute("pVo", pVo);
		
		return "blog/page_area_select";
	}
	
	/**
	 * 
	 * Method : cancelGood_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param good_code
	 * @param page_code
	 * @return
	 * Method 설명 : 전체 페이지 조회 화면 에서 좋아요 취소
	 */
	@RequestMapping("/cancelGood_page")
	public String cancelGood_page(HttpServletRequest req, Model model, 
			@RequestParam("good_code")String good_code,
			@RequestParam("page_code")String page_code,
			@RequestParam("user_id")String user_id) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//좋아요 취소
		goodService.delete_good(good_code);
		
		//goodList 담기
		GoodVo gVo = new GoodVo();
		gVo.setMem_id(mVo.getMem_id());
		gVo.setDivision("22");
		List<GoodVo> goodList = goodService.select_goodList(gVo);
		model.addAttribute("goodList", goodList);
		
		
		//전체 조회 페이지 일 경우
		if(!user_id.equals("#")) {
			model.addAttribute("user_id", user_id);
			
			//전체 pageList 담기
			List<PageVo> pageList = pageService.select_pageAllList(user_id);
			model.addAttribute("pageList", pageList);
			
			return "blog/page_area";
		}
		
		//섹션 선택 페이지 일경우
		//pageList 담기
		PageVo pageInfo = pageService.select_pageInfo(page_code);
		List<PageVo> pageList = pageService.select_pageList(pageInfo.getSection_code());
		model.addAttribute("pageList", pageList);
		
		//포트폴리오, 섹션 VO 담기
		SectionVo sVo = sectionService.select_sectionInfo(pageInfo.getSection_code());
		PortfolioVo pVo = portfolioService.select_portfolioInfo(sVo.getPortfolio_code());
		model.addAttribute("sVo", sVo);
		model.addAttribute("pVo", pVo);
		
		
		
		return "blog/page_area_select";
	}
	
	/**
	 * 
	 * Method : page_commentList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param good_code
	 * @param page_code
	 * @param user_id
	 * @return
	 * Method 설명 : 댓글 리스트 출력
	 */
	@RequestMapping("/page_commentList")
	public String page_commentList(HttpServletRequest req, Model model, @RequestParam("page_code")String page_code) {
		
		//댓글리스트 뿌려주기
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		PaginationVo pnVo = new PaginationVo(1, 5);
		pnVo.setDivision("22");
		pnVo.setRef_code(page_code);
		pnVo.setMem_id(mVo.getMem_id());
		
		Map<String, Object> commentMap = commentService.select_commentList(pnVo);
		int commentCnt = (int) commentMap.get("commentCnt");
		
		//페이지 코드, 댓글 리스트
		List<Post_commentVo> commentList= (List<Post_commentVo>) commentMap.get("commentList");
		model.addAttribute("page_code", page_code);
		model.addAttribute("commentList", commentList);
		
		//총 댓글 갯수, 페이지번호
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", pnVo.getPage());
		
		return "blog/comment_area";
	}
	
	/**
	 * 
	 * Method : insert_comment
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param page_code
	 * @param comment_contents
	 * @return
	 * Method 설명 : 페이지에 댓글 추가
	 */
	@RequestMapping(path="/insert_comment", method=RequestMethod.POST)
	public String insert_comment(HttpServletRequest req, Model model, 
			@RequestParam("page_code")String page_code,
			@RequestParam("comment_contents")String comment_contents,
			@RequestParam("page_num")int page_num) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//댓글 추가
		Post_commentVo cVo = new Post_commentVo();
		cVo.setMem_id(mVo.getMem_id());
		cVo.setRef_code(page_code);
		cVo.setDivision("22");
		cVo.setComment_contents(comment_contents);
		commentService.insert_comment(cVo);
		
		
		//댓글리스트 뿌려주기
		PaginationVo pnVo = new PaginationVo(1, page_num * 5);
		pnVo.setDivision("22");
		pnVo.setRef_code(page_code);
		pnVo.setMem_id(mVo.getMem_id());
		
		Map<String, Object> commentMap = commentService.select_commentList(pnVo);
		int commentCnt = (int) commentMap.get("commentCnt");
		
		//페이지 코드, 댓글 리스트
		List<Post_commentVo> commentList= (List<Post_commentVo>) commentMap.get("commentList");
		model.addAttribute("page_code", page_code);
		model.addAttribute("commentList", commentList);
		
		//총 댓글 갯수, 페이지번호
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", page_num);
		
		return "blog/comment_area";
	}
	
	/**
	 * 
	 * Method : delete_comment
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param comment_code
	 * @param page_code
	 * @return
	 * Method 설명 : 댓글 삭제
	 */
	@RequestMapping("/delete_comment")
	public String delete_comment(HttpServletRequest req, Model model, 
			@RequestParam("comment_code")String comment_code,
			@RequestParam("page_code")String page_code,
			@RequestParam("page_num")int page_num) {
		
		//댓글 삭제
		commentService.delete_comment(comment_code);
		
		//댓글리스트 뿌려주기
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		PaginationVo pnVo = new PaginationVo(1, page_num * 5);
		pnVo.setDivision("22");
		pnVo.setRef_code(page_code);
		pnVo.setMem_id(mVo.getMem_id());
		
		Map<String, Object> commentMap = commentService.select_commentList(pnVo);
		int commentCnt = (int) commentMap.get("commentCnt");
		
		//페이지 코드, 댓글 리스트
		List<Post_commentVo> commentList= (List<Post_commentVo>) commentMap.get("commentList");
		model.addAttribute("page_code", page_code);
		model.addAttribute("commentList", commentList);
		
		//총 댓글 갯수, 페이지번호
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", page_num);
		
		return "blog/comment_area";
	}
	
	/**
	 * 
	 * Method : add_comment
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @param page_num
	 * @param page_code
	 * @return
	 * Method 설명 : 댓글 더보기
	 */
	@RequestMapping("/add_comment")
	public String add_comment(HttpServletRequest req, Model model, 
			@RequestParam("page_num")int page_num,
			@RequestParam("page_code")String page_code) {
		
		page_num++;
		
		//댓글리스트 뿌려주기
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		PaginationVo pnVo = new PaginationVo(1, page_num * 5);
		pnVo.setDivision("22");
		pnVo.setRef_code(page_code);
		pnVo.setMem_id(mVo.getMem_id());
		
		Map<String, Object> commentMap = commentService.select_commentList(pnVo);
		int commentCnt = (int) commentMap.get("commentCnt");
		
		//페이지 코드, 댓글 리스트
		List<Post_commentVo> commentList= (List<Post_commentVo>) commentMap.get("commentList");
		model.addAttribute("page_code", page_code);
		model.addAttribute("commentList", commentList);
		
		//총 댓글 갯수, 페이지번호
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", page_num);
		
		return "blog/comment_area";
	}
	
	
}
