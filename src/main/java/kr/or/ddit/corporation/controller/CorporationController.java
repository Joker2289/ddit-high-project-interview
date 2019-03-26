package kr.or.ddit.corporation.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	

	@Resource(name = "postService")
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
