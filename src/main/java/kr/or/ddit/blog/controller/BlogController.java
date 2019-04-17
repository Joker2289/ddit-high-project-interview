package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@RequestMapping("/blog")
@Controller
public class BlogController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="followService")
	private IFollowService followService;
	
	/**
	 * 
	 * Method : blogView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @return
	 * Method 설명 : 나의 Blog 페이지 이동
	 */
	@RequestMapping(path={"blogMainView"}, method = RequestMethod.GET)
	public String blogMainView(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		UsersVo uVo = usersService.select_userInfo(userId);
		model.addAttribute("uVo", uVo);
		
		
		
		return "blogTiles";
		
	}
	
	
	/**
	 * 
	 * Method : blogProfileImageView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @param model
	 * @return
	 * Method 설명 : blog 프로필 이미지 뷰
	 * @throws IOException 
	 */
	@RequestMapping("/blogProfileImageView")
	public void blogProfileImageView(HttpServletRequest req, HttpServletResponse resp, @RequestParam("userId")String userId) throws IOException {
		
		resp.setContentType("image");
		ServletContext application = req.getServletContext();
		
		UsersVo userVO = usersService.select_userInfo(userId);
		
		FileInputStream fis;
		if(userVO != null && userVO.getProfile_img() != null) {
			fis = new FileInputStream(new File(application.getRealPath(userVO.getProfile_path())));
		} else {
			String noimgPath = application.getRealPath("/images/profile/profile_noimage.jpg");
			fis = new FileInputStream(new File(noimgPath));
		}
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		int len = 0; 
		while((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		sos.close();
		fis.close();
	}
	
	@RequestMapping("/activityFollower")
	public String activityFollower(HttpServletRequest req, HttpServletResponse resp, @RequestParam("userId")String userId) {
		
		return "";
	}
	
	@RequestMapping("/activityFollowing")
	public String activityFollowing(HttpServletRequest req, Model model, @RequestParam("userId")String userId) {
		
		List<FollowVo> followingList = followService.select_followingList(userId);
		
		model.addAttribute("followingList", followingList);
		
		return "blog/following_body";
	}
	
	
}
