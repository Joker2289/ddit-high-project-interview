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
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class CorporationController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
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
	
	@Resource(name="goodService")
	private IGoodService goodService;
	
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
	public String postList(HttpServletRequest request,Model model, PaginationVo paginationVo, String post_contents,String corp_id, HttpSession session) {
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		
		PaginationVo tagCountPageVo = new PaginationVo(1, 10);
		tagCountPageVo.setMem_id(memberInfo.getMem_id());
		tagCountPageVo.setDivision("16");
		//저장글 갯수 
		int savepostCnt = savepostService.savepost_count(corp_id);
		model.addAttribute("savepostCnt", savepostCnt);

		
		paginationVo.setMem_id(corp_id);
		
		
		if(memberInfo.getMem_division().equals("1")){ //일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(corp_id);
			
			//인맥 수 출력을 위한 세팅
			int connectionCnt = personal_connectionService.connections_count(memberInfo);
			
			//팔로우 한 해쉬태그 출력을 위한 세팅
			List<FollowVo> followHashtag = followService.select_followKindList(tagCountPageVo);
			
			if(!followHashtag.isEmpty()){
				model.addAttribute("followHashtag", followHashtag);
			} else {
				model.addAttribute("followHashtag","notfollow");
			}
			
			
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("connectionCnt", connectionCnt);
			
		} else if(memberInfo.getMem_division().equals("2")){ //회사일 경우
			//회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			CorporationVo corpInfo = corporationService.select_corpInfo(corp_id);
			
			List<FollowVo> followHashtag = followService.select_followKindList(tagCountPageVo);
	         
	         if(!followHashtag.isEmpty()){
	            model.addAttribute("followHashtag", followHashtag);
	         } else {
	            model.addAttribute("followHashtag","notfollow");
	         }
			
			model.addAttribute("corpInfo", corpInfo);
			
		} else { //관리자일 경우
			//관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		model.addAttribute("corporationInfo", corporationInfo);
		model.addAttribute("memberInfo", memberInfo);
		
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("timelinePost", timelinePost);

		List<GoodVo> goodList = goodService.select_pushedGoodPost(corp_id);
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = savepostService.select_savepostData(corp_id);
		model.addAttribute("saveList", saveList);
		
		logger.debug("goodList hahaha : {}", goodList);
		logger.debug("saveList hahaha : {}", saveList);
		
		logger.debug("goodList hahaha : {}", goodList.size());
		logger.debug("saveList hahaha : {}", saveList.size());
		return "corporationTiles";
	}
	

	
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
        
          
          path = "D://A_TeachingMaterial/7.LastProject/workspace/interview/src/main/webapp/WEB-INF/views/corporation/img/";
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
	 * 회사 소개
	 * @param model
	 * @param paginationVo
	 * @param request
	 * @return
	 */
	@RequestMapping(path = { "/corporationIntroduction" })
	public String corporationIntro(Model model, PaginationVo paginationVo, HttpServletRequest request, CorporationVo corporationVo,String corp_id) {
		
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		CorporationVo corporationInfo = new CorporationVo();
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		paginationVo.setMem_id(corp_id);
		
		model.addAttribute("corporationInfo", corporationInfo);

		

		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(corp_id);

			// 인맥 수 출력을 위한 세팅

			// 팔로우 한 해쉬태그 출력을 위한 세팅

			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(corp_id);

			// 회사 회원 로그인 시 홈 화면 출력을 위한 세팅

			model.addAttribute("corpInfo", corpInfo);
		} else { // 관리자일 경우
			// 관리자 로그인 시 홈 화면 출력을 위한 세팅

		}

		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		model.addAttribute("corporationInfo", corporationInfo);
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
		if(corp_id==null){
			corp_id = memberInfo.getMem_id();
		}else{
		}
		corporationInfo = corporationService.select_corpInfo(corp_id);
		model.addAttribute("corporationInfo", corporationInfo);
		
		paginationVo.setMem_id(corp_id);
		
		List<RecruitVo> getRecruitInfo = recrService.getRecrListCorp_id(corporationInfo.getCorp_id());
		
		model.addAttribute("getRecruitInfo", getRecruitInfo);
		
		if (memberInfo.getMem_division().equals("1")) { // 일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(corp_id);
			
			// 인맥 수 출력을 위한 세팅
			
			// 팔로우 한 해쉬태그 출력을 위한 세팅
			
			model.addAttribute("userInfo", userInfo);
		} else if (memberInfo.getMem_division().equals("2")) { // 회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(corp_id);
			
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
	
	@RequestMapping("/corporation_follow")
	public String corporation_follow(FollowVo followVo){
		logger.debug("followVo : {}", followVo);
		followService.insert_follow(followVo);
		
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setMem_id(followVo.getRef_keyword());
		alarmInfo.setAlarm_check("0");
		alarmInfo.setDivision("14");
		alarmInfo.setSend_id(followVo.getMem_id());
		alarmInfo.setAlarm_separate("06");
		alarmInfo.setRef_code(followVo.getFollow_code());
		
		alarmService.insert_alarmInfo(alarmInfo);
		
		return "corporation/module/top";
	}
	
	@RequestMapping("/follow_unfollow")
	public String follow_unfollow(Model model,FollowVo followVo){
		
		int followUnfollow = followService.follow_unfollow(followVo);
		model.addAttribute("followUnfollow", followUnfollow);
		return "corporation/module/top";
	}

	

	

}
