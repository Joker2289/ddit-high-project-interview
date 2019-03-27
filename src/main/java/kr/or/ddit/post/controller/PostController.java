package kr.or.ddit.post.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;

@Controller
public class PostController {
	
	@Resource(name="postService")
	private IPostService postService;
	
	@RequestMapping(path={"/timeline"}, method={RequestMethod.GET})
	public String testView(Model model){
		
		List<PostVo> testPost = postService.select_memberPost("goo8455");
		model.addAttribute("testPost",testPost);
		
		return "timeLineTiles";
	}
	
	
}
