package kr.or.ddit.profile.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.users.model.UsersVo;

@Controller
public class profileController {
	
	@RequestMapping(path= {"/profileHome"}, method=RequestMethod.GET)
	public String profileHomeView() {
		
		return "profileHomeTiles";
	}
	
	@RequestMapping(path= {"/background"})
	public void backgroundPicture(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setHeader("content-Disposition", "attachment; filename=profile.png"); 
		resp.setContentType("image");
		
		UsersVo usersVo = (UsersVo) req.getSession().getAttribute("detailVO");
		
		FileInputStream fis;
		if(usersVo != null && usersVo.getBg_path() != null)
			fis = new FileInputStream(new File(usersVo.getBg_path()));
		
		else{
			ServletContext application = req.getServletContext();
			String noimgPath = application.getRealPath("/upload/basicBackground.png");
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
	public void profilePicture(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setHeader("content-Disposition", "attachment; filename=profile.png"); 
		resp.setContentType("image");
		
		UsersVo usersVo = (UsersVo) req.getSession().getAttribute("detailVO");
		
		FileInputStream fis;
		if(usersVo != null && usersVo.getProfile_path() != null)
			fis = new FileInputStream(new File(usersVo.getProfile_path()));
		
		else{
			ServletContext application = req.getServletContext();
			String noimgPath = application.getRealPath("/upload/basicProfile.png");
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
