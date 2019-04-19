package kr.or.ddit.corporation.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.hashtag.service.IHashtagService;
import kr.or.ddit.hashtag_list.model.Hashtag_listVo;
import kr.or.ddit.hashtag_list.service.IHashtag_listService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.post.controller.PostController;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post_comment.service.ICommentService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_post.model.Save_postVo;
import kr.or.ddit.save_post.service.ISave_postService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class CorporationController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name = "postService")
	private IPostService postService;
	
	@Resource(name = "memberService")
	private IMemberService memberService;

	@Resource(name = "usersService")
	private IUsersService usersService;

	@Resource(name = "corporationService")
	private ICorporationService corporationService;
	
	@Resource(name="personalService")
	private IPersonal_connectionService personal_connectionService; 
	
	@Resource(name="followService")
	private IFollowService followService; 

	@Resource(name="save_postService")
	private ISave_postService savepostService;
	
	@Resource(name="commentService")
	private ICommentService commentService;
	
	@Resource(name="hashtagService")
	private IHashtagService hashtagService;
	
	@Resource(name="hashtag_listService")
	private IHashtag_listService taglistService;
	
	@Resource(name="search_logService")
	private ISearch_logService sLogService;

	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;
	
	@Resource(name="career_infoService")
	private ICareer_infoService careerService;
	

	/**
	 * 회사 홈(회사타임라인)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(path = { "/corporation" })
	public String postList(HttpServletRequest request,Model model, PaginationVo paginationVo, String post_contents, HttpSession session) {
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		
		List<PostVo> postList = postService.select_memberPost(memberInfo.getMem_id());
		String mem_id = memberInfo.getMem_id();
		logger.debug("mem_id : {}", mem_id);
		
		model.addAttribute("corporationInfo", corporationInfo);
		model.addAttribute("postList", postList);
		
		return "corporationTiles";
	}
	
	/**
	 * 이미지 업로드
	 */
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 업로드 흐름 : 업로드 버튼 클릭=> 임시디렉토리에 업로드 => 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() throws Exception {
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception {

		logger.info("파일이름: " + file.getOriginalFilename());
		logger.info("파일크기: " + file.getSize());
		logger.info("컨텐트 타입: " + file.getContentType());

		String savedName = file.getOriginalFilename();
		
		File target = new File(uploadPath, savedName);
		
		//임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		//FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(file.getBytes(), target);
		
		mav.setViewName("uploadResult");
		mav.addObject("savedName", savedName);
				

		return mav; //uploadResult.jsp로 포워딩
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	
	/**
	 * 타임라인 글쓰기
	 * @param request
	 * @param post_contents2
	 * @param session
	 * @return
	 */
	@RequestMapping(path={"/postInsert"})
	public String postInsert(HttpServletRequest request,String post_contents2, HttpSession session){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		PostVo insertPost = new PostVo();
		String mem_id = memberInfo.getMem_id();
		String writer_name = "";	
		
		writer_name = corporationInfo.getCorp_name();
		insertPost.setMem_id(mem_id);
		insertPost.setPost_contents(post_contents2);
		insertPost.setWriter_name(writer_name);
		logger.debug("123456789987654321 : {}", insertPost);

		int insertCnt;
		
		insertCnt = postService.insert_post(insertPost);
		
		return "redirect:" + request.getContextPath() + "/corporation";
	}

	/**
	 * 타임라인 동영상 url입력
	 * @param request
	 * @param post_contents2
	 * @param session
	 * @return
	 */
	@RequestMapping(path={"/videoInsert"})
	public String videoInsert(HttpServletRequest request,String video_path, HttpSession session){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		PostVo insertPost = new PostVo();
		String mem_id = memberInfo.getMem_id();
		String writer_name = "";	
		String URLA = "<p><iframe width=\"560\" height=\"315\" src=\"";
		String URLZ = "\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><p>";
		
		writer_name = corporationInfo.getCorp_name();
		insertPost.setMem_id(mem_id);
		insertPost.setPost_contents(URLA+video_path+URLZ);
		insertPost.setWriter_name(writer_name);
		logger.debug("123456789987654321 : {}", insertPost);
		logger.debug("12345678998765432asdasd1 : {}", video_path);

		int insertCnt;
		
		insertCnt = postService.insert_post(insertPost);
		
		return "redirect:" + request.getContextPath() + "/corporation";
	}

	
	/**
	 * 회사 소개
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @return
	 */
	@RequestMapping(path = { "/corporationIntroduction" })
	public String corporationIntro(Model model, PaginationVo paginationVo, HttpServletRequest request, CorporationVo corporationVo) {
		
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		model.addAttribute("corporationInfo", corporationInfo);

		

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
		
		CorporationVo corporationInfo = new CorporationVo();
		
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		model.addAttribute("corporationInfo", corporationInfo);
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		List<RecruitVo> getRecruitInfo = recrService.getRecrListCorp_id(corporationInfo.getCorp_id());
		
		model.addAttribute("getRecruitInfo", getRecruitInfo);
		
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
	public String corporationEmployee(String corp_id,HttpSession session, Model model, PaginationVo paginationVo, HttpServletRequest request) {
MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		CorporationVo corporationInfo = new CorporationVo();
		Career_infoVo careerinfo = new Career_infoVo();
		corporationInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
		model.addAttribute("corporationInfo", corporationInfo);
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		List<RecruitVo> getRecruitInfo = recrService.getRecrListCorp_id(corporationInfo.getCorp_id());
		
		model.addAttribute("getRecruitInfo", getRecruitInfo);
		
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
		
		System.out.println(corporationInfo.getCorp_name());
		
		int ecount = careerService.employee_count(corporationInfo.getCorp_name());
		model.addAttribute("ecount", ecount);

		//출신 학교 그래프
		List<Education_infoVo> eec = careerService.employee_education_count(corporationInfo.getCorp_name());		
		List<Integer> eec2 = careerService.employee_education_count2(corporationInfo.getCorp_name());		
		List<Integer> a = new ArrayList<>();
		a.add(100*eec2.get(0)/ecount);
		a.add(100*eec2.get(1)/ecount);
		a.add(100*eec2.get(2)/ecount);
		model.addAttribute("eec", eec);
		model.addAttribute("eec2", eec2);
		model.addAttribute("a",a);
		
		//전공 그래프
		List<Education_infoVo> em = corporationService.employee_major(corporationInfo.getCorp_name());
		List<Integer> emc = corporationService.employee_major_count(corporationInfo.getCorp_name());
		List<Integer> b = new ArrayList<>();
		b.add(100*emc.get(0)/ecount);
		b.add(100*emc.get(1)/ecount);
		b.add(100*emc.get(2)/ecount);
		b.add(100*emc.get(3)/ecount);
		model.addAttribute("em", em);
		model.addAttribute("emc", emc);
		model.addAttribute("b",b);
		
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

		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		model.addAttribute("getCorpInfo", corporationService.select_corpInfo(memberInfo.getMem_id()));
		String mem_id = memberInfo.getMem_id();

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
