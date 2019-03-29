package kr.or.ddit.profile.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class profileController {
	
	private Logger logger = LoggerFactory.getLogger(profileController.class);
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@RequestMapping("/menu")
	public String menuDropdownView(String str) {
		
		logger.debug(str);
		
		if(str.equals("search")){
			return "/layout/searchDropdown";
		}
		else {
			
			return "/layout/profileDropdown";
		}
		
	}
	
	@RequestMapping(path= {"/profileHome"})
	public String profileHomeView() {
		return "profileHomeTiles";
	}
	
	@RequestMapping(path= {"/background"})
	public void backgroundPicture(HttpServletRequest req, HttpServletResponse resp, MemberVo memberVo) throws IOException {
		resp.setHeader("content-Disposition", "attachment;"); 
		resp.setContentType("image");
		
		
		
		UsersVo users = usersService.select_userInfo(memberVo.getMem_id());
		CorporationVo corporation = null;
		
		if(users == null) {
			corporation = corpService.select_corpInfo(memberVo.getMem_id());
		}
		
		FileInputStream fis;
		if((users != null && users.getBg_path() != null) || (corporation != null && corporation.getBg_path() != null))
			fis = new FileInputStream(new File(users != null ? users.getBg_path() : corporation.getBg_path()));
		
		else{
			ServletContext application = req.getServletContext();
			String noimgPath = application.getRealPath("/images/profile/basicBackground.png");
			fis = new FileInputStream(new File(noimgPath));
		}
		
		ServletOutputStream sos = resp.getOutputStream();
		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		
		sos.close();
		fis.close();
	}
	
	@RequestMapping(path= {"/profile"})
	public void profilePicture(HttpServletRequest req, HttpServletResponse resp, MemberVo memberVo) throws IOException {
		resp.setHeader("content-Disposition", "attachment;"); 
		resp.setContentType("image");
		
		UsersVo users = usersService.select_userInfo(memberVo.getMem_id());
		CorporationVo corporation = null;
		
		if(users == null) {
			corporation = corpService.select_corpInfo(memberVo.getMem_id());
		}
		
		FileInputStream fis;
		if((users != null && users.getProfile_path() != null) || (corporation != null && corporation.getLogo_path() != null))
			fis = new FileInputStream(new File(users != null ? users.getProfile_path() : corporation.getLogo_path()));
		
		else{
			ServletContext application = req.getServletContext();
			String noimgPath = application.getRealPath("/images/profile/basicProfile.png");
			fis = new FileInputStream(new File(noimgPath));
		}
		
		ServletOutputStream sos = resp.getOutputStream();
		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		
		sos.close();
		fis.close();
	}
	
	

}
