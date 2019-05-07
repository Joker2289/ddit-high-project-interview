package kr.or.ddit.corporation.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.award_history.service.IAward_historyService;
import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.good.service.IGoodService;
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
import kr.or.ddit.util.chart.ChartVo;
import kr.or.ddit.util.chart.Employee_listVo;
import kr.or.ddit.util.pagination.PaginationVo;

@RequestMapping("/corp")
@Controller
public class CorporationController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@Resource(name="postService")
	private IPostService postService;
	
	@Resource(name="memberService")
	private IMemberService memberService;

	@Resource(name="usersService")
	private IUsersService usersService;

	@Resource(name="corporationService")
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
	
	@Resource(name="goodService")
	private IGoodService goodService;
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;
	
	@Resource(name="career_infoService")
	private ICareer_infoService careerService;
	

	/**
	 * 
	 * Method : corporation
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param request
	 * @param model
	 * @param paginationVo
	 * @param post_contents
	 * @param corp_id
	 * @param session
	 * @return
	 * Method 설명 : 회사 페이지 이동
	 */
	@RequestMapping(path = { "/corporation" })
	public String corporation(HttpServletRequest req, Model model, String corp_id) {
		
		
		MemberVo memberInfo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}
		
		
		if(!memberInfo.getMem_id().equals(corp_id)) {
			
			logger.debug("memberInfo >>>>>>>>>>> :{} ", memberInfo);
			logger.debug("corp_id >>>>>>>>>>> :{} ", corp_id);
			
			//팔로우 정보 조회
			FollowVo fVo = new FollowVo();
			fVo.setMem_id(memberInfo.getMem_id());
			fVo.setRef_keyword(corp_id+"");
			fVo.setDivision("11");
			logger.debug("ddddd >>>>>> : {}");
			FollowVo followInfo = followService.select_followLog(fVo);
			
			if(followInfo != null) {
				model.addAttribute("followInfo", followInfo);
			}
		}
		
		//회사 정보 조회
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		model.addAttribute("corporationInfo", corporationInfo);
		
		model.addAttribute("memberInfo", memberInfo);
		
		PaginationVo paginationVo = new PaginationVo();
		paginationVo.setMem_id(memberInfo.getMem_id());
		List<PostVo> corpPost = postService.select_corpPagePost(paginationVo);
		
		model.addAttribute("corpPost", corpPost);
		model.addAttribute("memberInfo", memberInfo);
		
		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		return "corporationTiles";
	}
	
	//left 메뉴탭 클릭 컨트롤러
	/**
	 * 
	 * Method : insert_intro_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param request
	 * @param corp_id
	 * @return
	 * Method 설명 : left 메뉴에서 소개 탭 클릭
	 */
	@RequestMapping("/insert_intro_page")
	public String insert_intro_page(Model model, HttpServletRequest request, @RequestParam("corp_id")String corp_id) {
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		model.addAttribute("corporationInfo", corporationInfo);
		
		return "corporation/corp_intro";
	}
	
	
	/**
	 * 
	 * Method : corporationRecruit
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param session
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @param corp_id
	 * @return
	 * Method 설명 : left 메뉴에서 채용 탭 클릭
	 */
	@RequestMapping("/insert_recr_page")
	public String insert_recr_page(HttpSession session, Model model, HttpServletRequest request, @RequestParam("corp_id")String corp_id) {
		
		//채용 공고 리스트 담기
		List<RecruitVo> recruitList = recrService.getRecrListCorp_id(corp_id);
		model.addAttribute("recruitList", recruitList);
		
		//회사 정보 담기
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		model.addAttribute("corporationInfo", corporationInfo);
		
		return "corporation/corp_recr";
	}
	
	/**
	 * 
	 * Method : corporationEmployee
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param session
	 * @param model
	 * @param request
	 * @param corp_id
	 * @return
	 * Method 설명 : left 메뉴에서 직원 탭 클릭
	 */
	@RequestMapping("/insert_empl_page")
	public String insert_empl_page(HttpSession session, Model model, HttpServletRequest req, @RequestParam("corp_id")String corp_id) {
		
		
		MemberVo memberVO = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		CorporationVo corpInfo = corporationService.select_corpInfo(corp_id);
		
		//회사의 전체 직원수 조회
		int employeeCnt = corporationService.corp_code_user_count(corpInfo.getCorp_code());
		model.addAttribute("employeeCnt", employeeCnt);
		
		//직책 리스트 조회
		List<ChartVo> chart_List = corporationService.job_position_list(corpInfo.getCorp_code());
		
		//전체 값
		int sum_value = 0;
		for(ChartVo vo : chart_List) {
			sum_value += vo.getChart_value();
		}
		
		//chart 관련
		model.addAttribute("chart_title", "직무");
		model.addAttribute("chart_List", chart_List);
		model.addAttribute("sum_value", sum_value);
		model.addAttribute("chart_index", 1);
		
		//employee_list 관련
		List<Employee_listVo> employ_List = corporationService.select_employAllList(corpInfo.getCorp_code());
		model.addAttribute("employ_List", employ_List);
		
		//employee_list follow 관련
		List<FollowVo> followList = followService.select_userFollowList(memberVO.getMem_id());
		model.addAttribute("followList", followList);
		
		//util
		model.addAttribute("corp_id", corp_id);
		model.addAttribute("corp_code", corpInfo.getCorp_code());
		
		return "corporation/corp_empl";
	}
	
	/**
	 * 
	 * Method : showChart
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param corp_id
	 * @param corp_code
	 * @param chart_index
	 * @return
	 * Method 설명 : 차트 조회
	 */
	@RequestMapping("/showChart")
	public String showChart(Model model, @RequestParam("corp_id")String corp_id,
			@RequestParam("corp_code")String corp_code,
			@RequestParam("chart_index")String chart_index) {
		
	
		List<ChartVo> chart_List = new ArrayList<ChartVo>();
		
		switch(chart_index) {
			case "1":
				chart_List  = corporationService.job_position_list(corp_code);
				model.addAttribute("chart_title", "직무");
				break;
			case "2":
				chart_List  = corporationService.school_name_list(corp_code);
				model.addAttribute("chart_title", "출신학교");
				break;
			case "3":
				chart_List  = corporationService.major_list(corp_code);
				model.addAttribute("chart_title", "전공");
				break;
			case "4":
				chart_List  = corporationService.ability_list(corp_code);
				model.addAttribute("chart_title", "보유기술");
				break;
		}
		
		
		
		//전체 값
		int sum_value = 0;
		for(ChartVo vo : chart_List) {
			sum_value += vo.getChart_value();
		}
		model.addAttribute("sum_value", sum_value);
		model.addAttribute("chart_List", chart_List);
		model.addAttribute("chart_index", chart_index);
		
		//고정
		model.addAttribute("corp_id", corp_id);
		model.addAttribute("corp_code", corp_code);
		
		return "corporation/module/chart";
	}
	
	/**
	 * 
	 * Method : showEmployeeList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param corp_id
	 * @param corp_code
	 * @param chart_index
	 * @return
	 * Method 설명 : 직원 리스트 조회
	 */
	@RequestMapping("/showEmployeeList")
	public String showEmployeeList(Model model, HttpServletRequest req,
			@RequestParam("corp_id")String corp_id,
			@RequestParam("corp_code")String corp_code,
			@RequestParam("chart_index")String chart_index,
			@RequestParam("parameter")String parameter) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//팔로우 리스트 담기
		List<FollowVo> followList = followService.select_userFollowList(mVo.getMem_id());
		model.addAttribute("followList", followList);
		
		
		List<Employee_listVo> employ_List = new ArrayList<Employee_listVo>();
		
		Employee_listVo elVo = new Employee_listVo(corp_code, parameter);
		
		switch(chart_index) {
			case "1":
				employ_List  = corporationService.select_employJobPositionList(elVo);
				break;
			case "2":
				employ_List  = corporationService.select_employSchoolNameList(elVo);
				break;
			case "3":
				employ_List  = corporationService.select_employMajorList(elVo);
				break;
			case "4":
				employ_List  = corporationService.select_employAbilityList(elVo);
				break;
		}
		
		model.addAttribute("employ_List", employ_List);
		
		//고정
		model.addAttribute("corp_id", corp_id);
		model.addAttribute("corp_code", corp_code);
		
		return "corporation/module/employee_list";
	}
	
	/**
	 * 
	 * Method : imageUpload
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param img_form
	 * @param req
	 * @param division
	 * @param corp_id
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * Method 설명 : 회사 로고, 배경 이미지 업로드
	 */
	@RequestMapping(path = "/imageUpload", consumes = { "multipart/form-data" })
	@ResponseBody
	public String imageUpload(@RequestParam(value = "img_form") MultipartFile img_form, HttpServletRequest req,
			String division, String corp_id)
			throws IllegalStateException, IOException {

		String realFileName = "";
		String tmpFileName = "";

		if (img_form.getSize() > 0) {
//			String fileName = img_form.getOriginalFilename();

			tmpFileName = UUID.randomUUID().toString();

			realFileName = req.getServletContext().getRealPath("/upload/" + tmpFileName);
			
			img_form.transferTo(new File(realFileName));

			CorporationVo cVo = new CorporationVo();
			if(division.equals("logo")) {
				cVo.setLogo_path(tmpFileName);
			} else if(division.equals("bg")) {
				cVo.setBg_path(tmpFileName);
			}
			cVo.setCorp_id(corp_id);
			corporationService.update_corpInfo(cVo);
			
		}
		
		return tmpFileName;
	}
	
	/**
	 * 
	 * Method : retun_toparea
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param request
	 * @param corp_id
	 * @return
	 * Method 설명 : top 페이지 리턴
	 */
	@RequestMapping("/retun_toparea")
	public String retun_toparea(Model model, @RequestParam("corp_id")String corp_id) {
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		model.addAttribute("corporationInfo", corporationInfo);
		
		return "corporation/module/top";
	}
	
	/**
	 * 
	 * Method : imageView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param path
	 * @param model
	 * @return
	 * Method 설명 : 이미지 뷰
	 */
	@RequestMapping("/ImageView")
	public String imageView(@RequestParam(name="path") String path, Model model) {
		model.addAttribute("path", path);
		return "ImageView";
	}
	
	/**
	 * 
	 * Method : corporation_follow
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 회사페이지 팔로우 
	 */
	@RequestMapping("/corporation_follow")
	public String corporation_follow(FollowVo followVo, Model model){
		
		//팔로우 등록
		followService.insert_corpFollow(followVo);
		
		//알람 넣기
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setMem_id(followVo.getRef_keyword());
		alarmInfo.setAlarm_check("0");
		alarmInfo.setDivision("14");
		alarmInfo.setSend_id(followVo.getMem_id());
		alarmInfo.setAlarm_separate("06");
		alarmInfo.setRef_code(followVo.getFollow_code());
		alarmService.insert_alarmInfo(alarmInfo);
		
		//고정값
		CorporationVo corporationInfo = corporationService.select_corpInfo(followVo.getRef_keyword());
		model.addAttribute("corporationInfo", corporationInfo);
		
		//팔로우 정보 조회
		FollowVo fVo = new FollowVo();
		fVo.setMem_id(followVo.getMem_id());
		fVo.setRef_keyword(followVo.getRef_keyword());
		fVo.setDivision("11");
		FollowVo followInfo = followService.select_followLog(fVo);
		if(followInfo != null) {
			model.addAttribute("followInfo", followInfo);
		}
		
		
		return "corporation/module/top";
	}
	
	/**
	 * 
	 * Method : corporation_unfollow
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param followVo
	 * @param model
	 * @return
	 * Method 설명 : 회사 언팔로우
	 */
	@RequestMapping("/corporation_unfollow")
	public String corporation_unfollow(FollowVo followVo, Model model){
		
		//팔로우 취소
		followService.delete_corpFollow(followVo);
		
		//고정값
		CorporationVo corporationInfo = corporationService.select_corpInfo(followVo.getRef_keyword());
		model.addAttribute("corporationInfo", corporationInfo);
		
		//팔로우 정보 조회
		FollowVo fVo = new FollowVo();
		fVo.setMem_id(followVo.getMem_id());
		fVo.setRef_keyword(followVo.getRef_keyword());
		fVo.setDivision("11");
		FollowVo followInfo = followService.select_followLog(fVo);
		if(followInfo != null) {
			model.addAttribute("followInfo", followInfo);
		}
		
		return "corporation/module/top";
	}

	
	/**
	 * 
	 * Method : employee_follow
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param req
	 * @param corp_id
	 * @param corp_code
	 * @param chart_index
	 * @param parameter
	 * @param ref_keyword
	 * @return
	 * Method 설명 : 직원 리스트 팔로우
	 */
	@RequestMapping("/employee_follow")
	public String employee_follow(Model model, HttpServletRequest req,
			@RequestParam("corp_id")String corp_id,
			@RequestParam("corp_code")String corp_code,
			@RequestParam("chart_index")String chart_index,
			@RequestParam("parameter")String parameter,
			@RequestParam("ref_keyword")String ref_keyword) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//팔로우 추가
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(mVo.getMem_id());
		followVo.setRef_keyword(ref_keyword);
		
		followService.insert_userFollow(followVo);
		
		//팔로우 리스트 담기
		List<FollowVo> followList = followService.select_userFollowList(mVo.getMem_id());
		model.addAttribute("followList", followList);
		
		
		List<Employee_listVo> employ_List = new ArrayList<Employee_listVo>();
		Employee_listVo elVo = new Employee_listVo(corp_code, parameter);
		
		switch(chart_index) {
			case "1":
				if(parameter.equals("allList")) {
					employ_List = corporationService.select_employAllList(corp_code);
					model.addAttribute("employ_List", employ_List);
				} else {
					employ_List  = corporationService.select_employJobPositionList(elVo);
				}
				break;
			case "2":
				employ_List  = corporationService.select_employSchoolNameList(elVo);
				break;
			case "3":
				employ_List  = corporationService.select_employMajorList(elVo);
				break;
			case "4":
				employ_List  = corporationService.select_employAbilityList(elVo);
				break;
		}
		
		model.addAttribute("employ_List", employ_List);
		
		//고정
		model.addAttribute("corp_id", corp_id);
		model.addAttribute("corp_code", corp_code);
		
		return "corporation/module/employee_list";
	}
	
	/**
	 * 
	 * Method : employee_unfollow
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param req
	 * @param corp_id
	 * @param corp_code
	 * @param chart_index
	 * @param parameter
	 * @param ref_keyword
	 * @return
	 * Method 설명 : 직원 리스트 언팔로우
	 */
	@RequestMapping("/employee_unfollow")
	public String employee_unfollow(Model model, HttpServletRequest req,
			@RequestParam("corp_id")String corp_id,
			@RequestParam("corp_code")String corp_code,
			@RequestParam("chart_index")String chart_index,
			@RequestParam("parameter")String parameter,
			@RequestParam("ref_keyword")String ref_keyword) {
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//팔로우 추가
		FollowVo followVo = new FollowVo();
		followVo.setMem_id(mVo.getMem_id());
		followVo.setRef_keyword(ref_keyword);
		
		followService.delete_userFollow(followVo);
		
		//팔로우 리스트 담기
		List<FollowVo> followList = followService.select_userFollowList(mVo.getMem_id());
		model.addAttribute("followList", followList);
		
		
		List<Employee_listVo> employ_List = new ArrayList<Employee_listVo>();
		Employee_listVo elVo = new Employee_listVo(corp_code, parameter);
		
		switch(chart_index) {
			case "1":
				if(parameter.equals("allList")) {
					employ_List = corporationService.select_employAllList(corp_code);
					model.addAttribute("employ_List", employ_List);
				} else {
					employ_List  = corporationService.select_employJobPositionList(elVo);
				}
				break;
			case "2":
				employ_List  = corporationService.select_employSchoolNameList(elVo);
				break;
			case "3":
				employ_List  = corporationService.select_employMajorList(elVo);
				break;
			case "4":
				employ_List  = corporationService.select_employAbilityList(elVo);
				break;
		}
		
		model.addAttribute("employ_List", employ_List);
		
		//고정
		model.addAttribute("corp_id", corp_id);
		model.addAttribute("corp_code", corp_code);
		
		return "corporation/module/employee_list";
	}
	
	
	
	
	
	//------------------------------- 수정 전 ---------------------------------//
	
	
	/**
	 * 타임라인 글쓰기
	 * @param request
	 * @param post_contents2
	 * @param session
	 * @return
	 */
	@RequestMapping(path={"/postInsert"})
	public String postInsert(HttpServletRequest request,String post_contents2,String corp_id ,HttpSession session){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		PostVo insertPost = new PostVo();
		String mem_id = corporationInfo.getCorp_id();
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
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 이미지 업로드
	 */
	@RequestMapping(value = "/logo_change_btn") // method = RequestMethod.GET 
	public Map fileUpload(HttpServletRequest req, HttpServletResponse rep,String corp_id,HttpSession session) { 
		MemberVo memberInfo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		//파일이 저장될 path 설정 
		String path = "D://A_TeachingMaterial/7.LastProject/workspace/interview/src/main/webapp/WEB-INF/views/corporation/img";
		Map returnObject = new HashMap(); 
		
		try { 
			// MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames(); 
			MultipartFile mfile = null; 
			String fieldName = "";
			List resultList = new ArrayList(); 
			
			// 디레토리가 없다면 생성 
			File dir = new File(path); 
			if (!dir.isDirectory()) { 
				dir.mkdirs();
			} 
			
			// 값이 나올때까지 
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); // 내용을 가져와서 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8"); //한글꺠짐 방지 
				
				// 파일명이 없다면 
				if ("".equals(origName)) { 
					continue; 
				} 
				

				String corpname = corporationInfo.getCorp_name();
				String a = "";
				a = corpname +"_logo"+".png";
				
				String saveFileName = a;

				
				// 설정한 path에 파일저장 
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile); 
					
				Map file = new HashMap(); 
				file.put("origName", origName); 
				file.put("sfile", serverFile); 
				resultList.add(file); 
				
			} 
			returnObject.put("files", resultList); 
			returnObject.put("params", mhsr.getParameterMap()); 
			

			
			
			} catch (UnsupportedEncodingException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
			}catch (IllegalStateException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
			} catch (IOException e) {
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
				
			} 
			return null; 
			
	} 
	
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
		
	}
			
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	//비동기식 업로드
	
	@RequestMapping("/serverInfoUpload.do")
    public ModelAndView mybatistest(HttpServletRequest request,String corp_id,HttpSession session) throws IOException{
	
        ModelAndView mav = new ModelAndView();
        
        MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
        MultipartFile file = multi.getFile("agentInstallFile");//jsp 페이지에서 input type="file"의 파라미터명
                
         String path="";
//         UUID randomeUUID = UUID.randomUUID();//중복 파일명 방지
                  
         if(file!=null){
        
          System.out.println("파라미터명" + file.getName());
          System.out.println("파일크기" + file.getSize());
          System.out.println("파일 존재" + file.isEmpty());
          System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
        
          
          path = "C://imgs/";
          InputStream inputStream = null;
          OutputStream outputStream = null;
          
          String organizedfilePath="";
          
          try {
              
 
              if (file.getSize() > 0) {
                  inputStream = file.getInputStream();
                  File realUploadDir = new File(path);
                  
                  if (!realUploadDir.exists()) {//업로드하려는 path에 폴더가 없을경우
                      realUploadDir.mkdirs();//폴더생성.
                  }
                  
 
                  
//                  organizedfilePath = path + randomeUUID + "_" + file.getOriginalFilename();
                  organizedfilePath = path + file.getOriginalFilename();
                  System.out.println(organizedfilePath);//파일이 저장된경로 + 파일 명
                  
                  outputStream = new FileOutputStream(organizedfilePath);
 
                  int readByte = 0;
                  byte[] buffer = new byte[8192];
 
                  while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
                      outputStream.write(buffer, 0, readByte); //파일 생성 ! 
                      
                  }
            
                  
              }
              
          } catch (Exception e) {
              // TODO: handle exception
              e.printStackTrace();
 
          } finally {
        	  
              outputStream.close();
              inputStream.close();
          }
          
      
                 
         }    
          mav.setViewName("redirect:" + request.getContextPath() + "/corporation");
        return mav;
                
    }
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 타임라인 동영상 url입력
	 * @param request
	 * @param post_contents2
	 * @param session
	 * @return
	 */
	@RequestMapping(path={"/videoInsert"})
	public String videoInsert(HttpServletRequest request,String video_path,String corp_id, HttpSession session){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		if(video_path == ""){
			return "redirect:/corporation";
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		PostVo insertPost = new PostVo();
		String mem_id = corp_id;
		String writer_name = "";	
		String URLA = "<p><iframe width=\"530\" height=\"315\" src=\"";
		String URLZ = "\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><p>";
		String video_path2 = video_path.replace("https://youtu.be/", "//www.youtube.com/embed/");
		writer_name = corporationInfo.getCorp_name();
		insertPost.setMem_id(mem_id);
		insertPost.setPost_contents(URLA+video_path2+URLZ);
		insertPost.setWriter_name(writer_name);
		logger.debug("123456789987654321 : {}", insertPost);
		logger.debug("12345678998765432asdasd1 : {}", video_path);

		int insertCnt;
		
		insertCnt = postService.insert_post(insertPost);
		
		return "redirect:" + request.getContextPath() + "/corporation";
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
