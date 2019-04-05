package kr.or.ddit.corporation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.post.controller.PostController;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class CorporationController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name="search_logService")
	private ISearch_logService sLogService;

	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "memberService")
	private IMemberService memberService;

	@Resource(name = "usersService")
	private IUsersService usersService;

	@Resource(name = "corporationService")
	private ICorporationService corporationService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;

	/**
	 * 회사 홈(회사타임라인)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(path = { "/corporation" })
	public String postList(Model model, PaginationVo paginationVo, HttpServletRequest request) {

		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		paginationVo.setMem_id(memberInfo.getMem_id());

		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());

			// 인맥 수 출력을 위한 세팅

			// 팔로우 한 해쉬태그 출력을 위한 세팅

			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());

			// 회사 회원 로그인 시 홈 화면 출력을 위한 세팅

			model.addAttribute("corpInfo", corpInfo);
		} else { // 관리자일 경우
			// 관리자 로그인 시 홈 화면 출력을 위한 세팅

		}

		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);

		return "corporationTiles";
	}

	/**
	 * 회사 소개
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @return
	 */
	@RequestMapping(path = { "/corporationIntroduction" })
	public String corporationIntro(Model model, PaginationVo paginationVo, HttpServletRequest request) {
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		paginationVo.setMem_id(memberInfo.getMem_id());

		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());

			// 인맥 수 출력을 위한 세팅

			// 팔로우 한 해쉬태그 출력을 위한 세팅

			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());

			// 회사 회원 로그인 시 홈 화면 출력을 위한 세팅

			model.addAttribute("corpInfo", corpInfo);
		} else { // 관리자일 경우
			// 관리자 로그인 시 홈 화면 출력을 위한 세팅

		}

		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		return "corporationIntroTiles";
	}
	
	/**
	 * 채용정보
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @return
	 */
	@RequestMapping(path = { "/corporationRecruitment" })
	public String corporationRecruit(String corp_id,HttpSession session, Model model, PaginationVo paginationVo, HttpServletRequest request) {
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());
			
			// 인맥 수 출력을 위한 세팅
			
			// 팔로우 한 해쉬태그 출력을 위한 세팅
			
			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
			
			// 회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			
			model.addAttribute("corpInfo", corpInfo);
		} else { // 관리자일 경우
			// 관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		
		

	
		
		return "corporationRecruitmentTiles";
	}
	
	/**
	 * 회사 직원
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @return
	 */
	@RequestMapping(path = { "/corporationEmployee" })
	public String corporationEmployee(Model model, PaginationVo paginationVo, HttpServletRequest request) {
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());
			
			// 인맥 수 출력을 위한 세팅
			
			// 팔로우 한 해쉬태그 출력을 위한 세팅
			
			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
			
			// 회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			
			model.addAttribute("corpInfo", corpInfo);
		} else { // 관리자일 경우
			// 관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		
		return "corporationEmployeeTiles";
	}

	/**
	 * 회사타임라인게시글생성
	 * 
	 * @param memberVo
	 * @param postVo
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/write", method = { RequestMethod.POST })
	public String post(Model model, String smarteditor2, HttpServletRequest request) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		String mem_id = member.getMem_id();

		System.out.println("987654321987654321");

		logger.debug("asdasdasdasdmem_id : {}", mem_id);

		PostVo insertPost = new PostVo();
		String writer_name = "";

		CorporationVo corp = corporationService.select_corpInfo(mem_id);
		writer_name = corp.getCorp_name();

		insertPost.setMem_id(mem_id);
		insertPost.setPost_contents(smarteditor2);
		insertPost.setWriter_name(writer_name);

		int insertCnt = postService.insert_post(insertPost);

		return "corporationTiles";

	}
	

}
