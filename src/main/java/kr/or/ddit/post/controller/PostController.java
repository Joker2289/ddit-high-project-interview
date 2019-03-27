package kr.or.ddit.post.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;

//@RequestMapping("/post")
@Controller
public class PostController {
	
	@Resource(name="postService")
	private IPostService postService;
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corporationService;
	 
	
	@RequestMapping(path={"/timeline"}, method={RequestMethod.GET})
	public String timelineView(Model model, PaginationVo paginationVo, HttpServletRequest request){
		// 작업 완류 후 loginController로 이동시켜야 함
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("memberVO");
		
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		
		if(memberInfo.getMem_division().equals("1")){ //일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id()); 
			
			//인맥 수 출력을 위한 세팅
			
			//팔로우 한 해쉬태그 출력을 위한 세팅
			
			model.addAttribute("userInfo", userInfo);
		} else if(memberInfo.getMem_division().equals("2")){ //회사일 경우
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
			
			//회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			
			model.addAttribute("corpInfo", corpInfo);
		} else { //관리자일 경우
			//관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		
//		paginationVo.setMem_id("goo8455");
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		
		return "timeLineTiles";
	}
	
	@RequestMapping(path={"/writePost"}, method={RequestMethod.POST})
	public String writePost(Model model, PostVo postVo){
		
		return "redirect:/timeline";
	}
	
	
}
