package kr.or.ddit.corporation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.pagination.PaginationVo;



@Controller
public class CorporationController {
	

	@Resource(name="postService")
	private IPostService postService;
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corporationService;
	
	
	
	/**
	 * 업데이트 게시물 조회
	 * @param model
	 * @return
	 */
	@RequestMapping(path={"/corporation"}, method={RequestMethod.GET})
	public String postList(Model model, PaginationVo paginationVo, HttpServletRequest request){
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
		
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("timelinePost", timelinePost);
		
		return "corporationTiles";
	}
	
	
	

	
	/**
	 * 회사타임라인게시글생성
	 * @param memberVo
	 * @param postVo
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/write",method={RequestMethod.POST,RequestMethod.GET})
	public String post(String mem_id,PostVo postVo, String post_contents, Model model){
		String writer_name= "a";
		int post_code=1000;
		postVo.setMem_id(mem_id);
		postVo.setWriter_name(writer_name);
		postVo.setPost_contents(post_contents);
		
		int insertCnt=0;
		insertCnt=postService.insert_post(postVo);
		return "corporationTiles";
	}
}

