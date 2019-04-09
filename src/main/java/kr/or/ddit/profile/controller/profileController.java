package kr.or.ddit.profile.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.education_info.service.IEducation_infoService;
import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class profileController {
	
	private Logger logger = LoggerFactory.getLogger(profileController.class);
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="education_infoService")
	private IEducation_infoService eduService;
	
	@Resource(name="career_infoService")
	private ICareer_infoService carService;
	
	@Resource(name="personalService")
	private IPersonal_connectionService PersonalService;
	
	@Resource(name="filesService")
	private IFilesService filesService;
	
	@RequestMapping("/menu")
	public String menuDropdownView(String str) {
		
		logger.debug(str);
		
		if(str.equals("search")){
			return "/layout/searchDropdown";
		}
		else {
			
			return "/layout/myDropdown";
		}
		
	}
	
	@RequestMapping("/modalInsertView")
	public String modalInsertView(String modalStr, Model model, String user_id) {
		
		String result = "";
		
		switch (modalStr) {
			case "introduction":
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(user_id);
				filesVo.setDivision("43");
				List<FilesVo> userFilesList = filesService.select_usersFile(filesVo);
				model.addAttribute("userFilesList", userFilesList);
				result="/profile/modalInsert/introduction";
				break;
			case "career":
				List<CorporationVo> corpVoList = corpService.select_allCorps();
				model.addAttribute("corpVoList", corpVoList);
				result="/profile/modalInsert/career";
				break;
			case "education":
				result="/profile/modalInsert/education";
				break;
			case "skills":
				result="/profile/modalInsert/skills";
				break;
			case "Thesis":
				result="/profile/modalInsert/Thesis";
				break;
			case "patent":
				result="/profile/modalInsert/patent";
				break;
			case "project":
				result="/profile/modalInsert/project";
				break;
			case "award":
				result="/profile/modalInsert/award";
				break;
			case "language":
				result="/profile/modalInsert/language";
				break;
			case "recommendation":
				result="/profile/modalInsert/recommendation";
				break;
			default:
				break;
		}
		
		
		
		return result;
		
	}
	
	@RequestMapping("/otherDropdown")
	public String otherDropdownView() {
		
		return "/profile/otherDropdown";
	}
	
	@RequestMapping("/profileDropdown")
	public String profileDropdownView(Model model, HttpSession session,String user_id) {
		model.addAttribute("user_id", user_id);
		
		return "/profile/profileDropdown";
	}
	
	@RequestMapping(path= {"/profileHome"})
	public String profileHomeView(Model model, HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		UsersVo usersVo = usersService.select_userInfo(memberVo.getMem_id());
		FilesVo filesVo = new FilesVo();
		filesVo.setRef_code(memberVo.getMem_id());
		filesVo.setDivision("43");
		
		String introduce = usersService.select_introduce(usersVo.getUser_id());
		List<Education_infoVo> education_infoList = eduService.select_educationInfo(usersVo.getUser_id());
		List<Career_infoVo> career_infoList = carService.select_careerInfo(usersVo.getUser_id());
		int peopleCount = PersonalService.connections_count(memberVo);
		List<FilesVo> userFilesList = filesService.select_usersFile(filesVo);
		List<CorporationVo> corpVoList = corpService.select_allCorps();
		
		model.addAttribute("education_infoList", education_infoList);
		model.addAttribute("career_infoList", career_infoList);
		model.addAttribute("introduce", introduce);
		model.addAttribute("peopleCount", peopleCount);
		model.addAttribute("usersVo", usersVo);
		model.addAttribute("userFilesList", userFilesList);
		model.addAttribute("corpVoList", corpVoList);
		
		return "profileHomeTiles";
	}
	
	@RequestMapping(path= {"/background"})
	public void backgroundPicture(HttpServletRequest req, HttpServletResponse resp, MemberVo memberVo) throws IOException {
		resp.setHeader("content-Disposition", "attachment;"); 
		resp.setContentType("image");
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		
		UsersVo users = usersService.select_userInfo(memberVo.getMem_id());
		CorporationVo corporation = null;
		
		if(users == null) {
			corporation = corpService.select_corpInfo(memberVo.getMem_id());
		}
		
		FileInputStream fis;
		if((users != null && users.getBg_path() != null) || (corporation != null && corporation.getBg_path() != null))
			fis = new FileInputStream(new File(users != null ? path + File.separator + users.getBg_path() : path + File.separator + corporation.getBg_path()));
		
		else{
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
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		
		UsersVo users = usersService.select_userInfo(memberVo.getMem_id());
		CorporationVo corporation = null;
		
		if(users == null) {
			corporation = corpService.select_corpInfo(memberVo.getMem_id());
		}
		
		FileInputStream fis;
		if((users != null && users.getProfile_path() != null) || (corporation != null && corporation.getLogo_path() != null))
			fis = new FileInputStream(new File(users != null ? path + File.separator + users.getProfile_path() : path + File.separator + corporation.getLogo_path()));
		
		else{
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
	
	@RequestMapping(path={"/fileDownload"})
	public void fileDownload(String file_code, Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/octet-stream");
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		
		FilesVo filesVo = filesService.select_oneFile(file_code);
		String realFilename = path + File.separator + filesVo.getFile_path();
		
		logger.debug("realFilename {}",realFilename);
		
		String docName = new String(filesVo.getFile_name().getBytes("UTF-8"), "ISO-8859-1");
		
		FileInputStream fis = new FileInputStream(new File(realFilename));
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");

		//4.FileInputStream을 response객체의 outputStream 객체에 write
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
