package kr.or.ddit.corporation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
	@RequestMapping("/postList")
	public List<PostVo> postList(@RequestParam("userId") String userId, Model model){
		
		List<PostVo> postList = postService.select_memberPost(userId);
		return postList;
		
	}
	
	@RequestMapping(path={"/corporationHome"},method={RequestMethod.GET})
	public String corporation(HttpSession session){
		
	return "corporation/corporationHome";
	}
	
	
}

