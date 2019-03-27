package kr.or.ddit.corporation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;


@RequestMapping("/corporation")
@Controller
public class CorporationController {
	

	@Resource(name="postService")
	private IPostService postService;
	
	
	/**
	 * 업데이트 게시물 조회
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/corporationHome", method={RequestMethod.GET})
	public String postList( Model model){
		// 임시 아이디(jocker) -> 로그인하고 연동되면 로그인한(회사아이디) 계정으로 게시물 호출
		List<PostVo> postList = postService.select_memberPost("joker");
		model.addAttribute("postList", postList);
		
		return "corporation/corporationHome";
		
	}
	
	@RequestMapping(path="/write")
	public String post(MemberVo memberVo,PostVo postVo,  Model model){
		String mem_id = "";
		String post_contents = "";
		postVo.setMem_id(mem_id);
		
		int insertCnt=0;
		insertCnt=postService.insert_post(postVo);
		return "corporation/corporationHome";
	}
}

