package kr.or.ddit.post.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.save_post.model.Save_postVo;
import kr.or.ddit.save_post.service.ISave_postService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;

//@RequestMapping("/post")
@Controller
public class PostController {
	
	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
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
	 
	
	@RequestMapping(path={"/timeline"}, method={RequestMethod.GET})
	public String timelineView(Model model, PaginationVo paginationVo, HttpServletRequest request){
		// 작업 완류 후 loginController로 이동시켜야 함
		
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		logger.debug("asdasdasd {}", memberInfo);
		
		FollowVo followInfo = new FollowVo();
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setDivision("16");
		
		Save_postVo savepost = new Save_postVo();
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		
		if(memberInfo.getMem_division().equals("1")){ //일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());
			
			//인맥 수 출력을 위한 세팅
			int connectionCnt = personal_connectionService.connections_count(memberInfo);
			
			//팔로우 한 해쉬태그 출력을 위한 세팅
			List<FollowVo> followHashtag = followService.select_followKindList(followInfo);
			
			if(!followHashtag.isEmpty()){
				model.addAttribute("followHashtag", followHashtag);
			} else {
				model.addAttribute("followHashtag","notfollow");
			}
				
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("connectionCnt", connectionCnt);
			model.addAttribute("savepostCnt", savepostCnt);
		} else if(memberInfo.getMem_division().equals("2")){ //회사일 경우
			//회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
			
			List<FollowVo> followHashtag = followService.select_followKindList(followInfo);
	         
	         if(!followHashtag.isEmpty()){
	            model.addAttribute("followHashtag", followHashtag);
	         } else {
	            model.addAttribute("followHashtag","notfollow");
	         }
			
			
			model.addAttribute("corpInfo", corpInfo);
		} else { //관리자일 경우
			//관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		
		
		model.addAttribute("memberInfo", memberInfo);
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		
		model.addAttribute("timelinePost", timelinePost);
		
		return "timeLineTiles";
	}
	
	
	@RequestMapping(path={"/appendpost"}, method=RequestMethod.GET)
	public String appendPost(PostVo postVo, PaginationVo paginationVo, HttpServletRequest request, Model model, int page){
		
		List<PostVo> afterPost = new ArrayList<PostVo>();
		
		MemberVo member = (MemberVo) request.getSession().getAttribute("SESSION_DETAILVO");
		
		
		paginationVo.setMem_id(member.getMem_id());
		paginationVo.setPageSize(1);
		
		if(member.getMem_division().equals("1")){
			UsersVo userInfo = usersService.select_userInfo(member.getMem_id());
			model.addAttribute("userInfo", userInfo);
		} else if(member.getMem_division().equals("2")){
			CorporationVo corpInfo = corporationService.select_corpInfo(member.getMem_id());
			model.addAttribute("corpInfo", corpInfo);
		} else {
			
		}
		
		afterPost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", afterPost);
		
		return "timeline/appendPost";
	}
	
	
//	@ResponseBody
	@RequestMapping(value="/timeline", method=RequestMethod.POST)
	public List<PostVo> infiniteScroll(@RequestBody PostVo postVo, PaginationVo paginationVo, HttpServletRequest request,
											Model model, @RequestBody Map<String, Object> param){
		
		String pageNum = (String) param.get("pageNum");
		
		List<PostVo> afterPost = new ArrayList<PostVo>();
		
		MemberVo member = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		paginationVo.setMem_id(member.getMem_id());
		paginationVo.setPage(Integer.parseInt(pageNum)); 
		
		if(member.getMem_division().equals("1")){
			UsersVo userInfo = usersService.select_userInfo(member.getMem_id());
			model.addAttribute("userInfo", userInfo);
		} else if(member.getMem_division().equals("2")){
			CorporationVo corpInfo = corporationService.select_corpInfo(member.getMem_id());
			model.addAttribute("corpInfo", corpInfo);
		} else {
			
		}
		
		afterPost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", afterPost);
		
		return afterPost;
	}
	
	@RequestMapping(path={"/writepost_timeline"}, method=RequestMethod.POST)
	public String writePost_timeline(Model model, String post_contents, HttpServletRequest request){
		
		MemberVo member = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		String mem_id = member.getMem_id();
		
		logger.debug("asdasd : {}", post_contents);
		
		PostVo insertPost = new PostVo();
		String writer_name = "";
		
		if(member.getMem_division().equals("1")){
			UsersVo user = usersService.select_userInfo(mem_id);
			writer_name = user.getUser_name();
			
			insertPost.setMem_id(mem_id);
			insertPost.setPost_contents(post_contents);
			insertPost.setWriter_name(writer_name);
			
		} else if(member.getMem_division().equals("2")){
			CorporationVo corp = corporationService.select_corpInfo(mem_id);
			writer_name = corp.getCorp_name();
			
			insertPost.setMem_id(mem_id);
			insertPost.setPost_contents(post_contents);
			insertPost.setWriter_name(writer_name);
			
		} else { //관리자
			
		}
		
		int insertCnt = postService.insert_post(insertPost);
		
		
		if(insertCnt == 1){
			return "redirect:/timeline";
		} else {
			return "redirect:/timeline";
		}
		
	}
	
}
