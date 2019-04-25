package kr.or.ddit.util.view;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.model.BlogVo;
import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@RequestMapping("/view")
@Controller
public class ViewController {
	
	private static Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@Resource(name="memberService")
	private IMemberService memService;
	
	@Resource(name="usersService")
	private IUsersService userService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="blogService")
	private IBlogService blogService;
	
	
	@RequestMapping("/imageView")
	public void imageView(HttpServletRequest req, HttpServletResponse resp, @RequestParam("mem_id")String mem_id, @RequestParam("division")String division) throws IOException {
		
		String path = ""; //경로저장
		
		resp.setContentType("image");
		ServletContext application = req.getServletContext();
		
		MemberVo mVo = memService.select_memberInfo(mem_id);
		
		if(division.equals("cover_img")) {
			BlogVo bVo = blogService.select_blogInfo(mem_id);
			
			if(bVo.getCover_img() == null) {
				path = "/images/blog/cover_img/basicBackground.png";
			} else {
				path = "/images/blog/cover_img/" + bVo.getCover_img(); 
			}
			
		}
		
		if(division.equals("ht")) {
			path = "/images/profile/HashTag1.png";
		} else {
			
			if(mVo.getMem_division().equals("1")) {
				UsersVo uVo = userService.select_userInfo(mem_id);
				
				if(uVo.getProfile_path() != null && division.equals("pf")) {
					path = "/upload/" + uVo.getProfile_path();
				} else if(uVo.getProfile_path() == null && division.equals("pf")){
					path = "/images/profile/basicProfile.png";
				} else if(uVo.getBg_path() != null && division.equals("bg")) {
					path = "/upload/" + uVo.getBg_path();
				} else if(uVo.getBg_path() == null && division.equals("bg")) {
					path = "/images/profile/basicBackground.png";
				}
				
			} else if(mVo.getMem_division().equals("2")) {
				CorporationVo cVo = corpService.select_corpInfo(mem_id);
				
				if(cVo.getLogo_path() != null && division.equals("pf")) {
					path = "/upload/" + cVo.getLogo_path();
				} else if(cVo.getLogo_path() == null && division.equals("pf")){
					path = "/images/corporation/basic/basicCorporation.png";
				} else if(cVo.getBg_path() != null && division.equals("bg")) {
					path = "/upload/" + cVo.getBg_path();
				} else if(cVo.getBg_path() == null && division.equals("bg")) {
					path = "/images/profile/basicBackground.png";
				} 
			} 
			
			logger.debug("path : {}", path);
		}
		
		
		FileInputStream fis = new FileInputStream(new File(application.getRealPath(path)));
		
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		int len = 0; 
		while((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		sos.close();
		fis.close();
	}
	
	
	
}
