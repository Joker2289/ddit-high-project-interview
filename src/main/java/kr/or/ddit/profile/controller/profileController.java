package kr.or.ddit.profile.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.or.ddit.ability.model.AbilityVo;
import kr.or.ddit.ability.service.IAbilityService;
import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.award_history.model.Award_historyVo;
import kr.or.ddit.award_history.service.IAward_historyService;
import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.education_info.service.IEducation_infoService;
import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.hashtag.service.IHashtagService;
import kr.or.ddit.language.model.LanguageVo;
import kr.or.ddit.language.service.ILanguageService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.patent_list.model.Patent_listVo;
import kr.or.ddit.patent_list.service.IPatent_listService;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.possesion_skills.model.Possesion_skillsVo;
import kr.or.ddit.possesion_skills.service.IPossesion_skillsService;
import kr.or.ddit.project_career.model.Project_careerVo;
import kr.or.ddit.project_career.service.IProject_careerService;
import kr.or.ddit.thesis_list.model.Thesis_listVo;
import kr.or.ddit.thesis_list.service.IThesis_listService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class profileController {
	
	private Logger logger = LoggerFactory.getLogger(profileController.class);
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="career_infoService")
	private ICareer_infoService carService;
	
	@Resource(name="education_infoService")
	private IEducation_infoService eduService;
	
	@Resource(name="possesion_skillsService")
	private IPossesion_skillsService possesion_skillsService;
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService;
	
	@Resource(name="filesService")
	private IFilesService filesService;
	
	@Resource(name="thesis_listService")
	private IThesis_listService thesis_listService;
	
	@Resource(name="patent_listService")
	private IPatent_listService patent_listService;
	
	@Resource(name="project_careerService")
	private IProject_careerService project_careerService;
	
	@Resource(name="award_historyService")
	private IAward_historyService award_historyService;
	
	@Resource(name="languageService")
	private ILanguageService languageService;
	
	@Resource(name="followService")
	private IFollowService followService;
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@Resource(name="abilityService")
	private IAbilityService abilityService;
	
	@Resource(name="hashtagService")
	private IHashtagService hashtagService;
	
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
				Map<String, Object> usersMap = usersService.select_introduce(user_id);
				model.addAttribute("usersMap", usersMap);
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
			case "ability":
				model.addAttribute("hashtagVoList", hashtagService.selelct_hashtag());
				result="/profile/modalInsert/ability";
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
			case "skills":
				result="/profile/modalInsert/skills";
				break;
			default:
				break;
		}
		
		return result;
		
	}
	
	@RequestMapping("/modalUpdateView")
	public String modalUpdateView(String modalStr, Model model, String code) {
		
		String result = "";
		
		switch (modalStr) {
			case "introduction":
				Map<String, Object> usersMap = usersService.select_introduce(code);
				model.addAttribute("usersMap", usersMap);
				result="/profile/modalInsert/introduction";
				break;
			case "career":
				Map<String, Object> career_infoMap = carService.select_oneCareerInfo(code);
				List<CorporationVo> corpVoList = corpService.select_allCorps();
				model.addAttribute("career_infoMap", career_infoMap);
				model.addAttribute("corpVoList", corpVoList);
				result="/profile/modalUpdate/careerUpdate";
				break;
			case "education":
				Map<String, Object> education_infoMap = eduService.select_oneEducationInfo(code);
				model.addAttribute("education_infoMap", education_infoMap);
				result="/profile/modalUpdate/educationUpdate";
				break;
			case "ability":
				AbilityVo abilityVo = abilityService.select_oneAbility(code);
				model.addAttribute("abilityVo", abilityVo);
				model.addAttribute("hashtagVoList", hashtagService.selelct_hashtag());
				result="/profile/modalUpdate/abilityUpdate";
				break;
			case "Thesis":
				Thesis_listVo thesis_listVo = thesis_listService.select_oneThesis_list(code);
				model.addAttribute("thesis_listVo", thesis_listVo);
				result="/profile/modalUpdate/ThesisUpdate";
				break;
			case "patent":
				Patent_listVo patent_listVo = patent_listService.select_onePatent_list(code);
				model.addAttribute("patent_listVo", patent_listVo);
				result="/profile/modalUpdate/patentUpdate";
				break;
			case "project":
				Project_careerVo project_careerVo = project_careerService.select_oneProject_career(code);
				model.addAttribute("project_careerVo", project_careerVo);
				result="/profile/modalUpdate/projectUpdate";
				break;
			case "award":
				Award_historyVo award_historyVo = award_historyService.select_oneAward_history(code);
				model.addAttribute("award_historyVo", award_historyVo);
				result="/profile/modalUpdate/awardUpdate";
				break;
			case "language":
				LanguageVo languageVo = languageService.select_oneLanguage(code);
				model.addAttribute("languageVo", languageVo);
				result="/profile/modalUpdate/languageUpdate";
				break;
			case "skills":
				Possesion_skillsVo possesion_skillsVo = possesion_skillsService.select_onePossesion_skills(code);
				model.addAttribute("possesion_skillsVo", possesion_skillsVo);
				result="/profile/modalUpdate/skillsUpdate";
				break;
			default:
				break;
		}
		
		return result;
		
	}
	@RequestMapping("/telInfo")
	public String telInfoView(String user_id, Model model) {
		model.addAttribute("usersVo", usersService.select_userInfo(user_id));
		
		return "/profile/telInfo";
	}
	
	@RequestMapping("/otherDropdown")
	public String otherDropdownView(String user_id, Model model, HttpSession session) {
		MemberVo SESSION_MEMBERVO = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		if (user_id != null && !user_id.equals(SESSION_MEMBERVO.getMem_id()) ) {
			
			Personal_connectionVo  personalVo = new Personal_connectionVo();
			personalVo.setUser_id(user_id);
			personalVo.setReceive_id(SESSION_MEMBERVO.getMem_id());
			personalVo = personalService.select_oneConnections(personalVo);
			FollowVo followVo = new FollowVo(); 
			followVo.setMem_id(SESSION_MEMBERVO.getMem_id());
			followVo.setRef_keyword(user_id);
			followVo = followService.select_oneFollow(followVo);
			
			model.addAttribute("personalVo", personalVo);
			model.addAttribute("user_id", user_id);
			model.addAttribute("followVo", followVo);
		}
		
		return "/profile/otherDropdown";
	}
	
	@RequestMapping("/profileDropdown")
	public String profileDropdownView(Model model, String user_id) {
		model.addAttribute("user_id", user_id);
		
		return "/profile/profileDropdown";
	}
	
	@RequestMapping(path= {"/profileHome"})
	public String profileHomeView(Model model, HttpSession session, String user_id) {
		MemberVo SESSION_MEMBERVO = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		if (user_id == null) {
			
			user_id = SESSION_MEMBERVO.getMem_id();
		}else{
			Personal_connectionVo  personalVo = new Personal_connectionVo();
			personalVo.setUser_id(user_id);
			personalVo.setReceive_id(SESSION_MEMBERVO.getMem_id());
			Personal_connectionVo  personalWaitVo = personalService.select_oneConnectionsWait(personalVo);
			personalVo = personalService.select_oneConnections(personalVo);
			FollowVo followVo = new FollowVo(); 
			followVo.setMem_id(SESSION_MEMBERVO.getMem_id());
			followVo.setRef_keyword(user_id);
			followVo = followService.select_oneFollow(followVo);
			model.addAttribute("followVo", followVo);
			model.addAttribute("personalVo", personalVo);
			model.addAttribute("personalWaitVo", personalWaitVo);
		}
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id(user_id);
		
		int peopleCount = personalService.connections_count(memberVo);
		Map<String, Object> usersMap = usersService.select_introduce(user_id);
		Map<String, Object> career_infoMap = carService.select_careerInfo(user_id);
		Map<String, Object> education_infoMap = eduService.select_educationInfo(user_id);
		Map<String, Object> recordMap = new HashMap<String, Object>();
		
		
		recordMap.put("thesis_listVoList", thesis_listService.select_thesis_list(user_id));
		recordMap.put("patent_listVoList", patent_listService.select_patent_list(user_id));
		recordMap.put("project_careerList", project_careerService.select_project_career(user_id));
		recordMap.put("award_historyList", award_historyService.select_award_history(user_id));
		recordMap.put("languageVoList", languageService.select_language(user_id));
		recordMap.put("possesion_skillsVoList", possesion_skillsService.select_possesion_skills(user_id));
		
		model.addAttribute("peopleCount", peopleCount);
		model.addAttribute("usersMap", usersMap);
		model.addAttribute("career_infoMap", career_infoMap);
		model.addAttribute("education_infoMap", education_infoMap);
		model.addAttribute("abilityVoList", abilityService.select_ability(user_id));
		model.addAttribute("recordMap", recordMap);
		model.addAttribute("hashtagFollowVoList", followService.select_hashtagFollowList(user_id));
		
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
		
		InputStream fis;
		URLConnection t_connection = null ;
		String filePath = "";
		if((users != null && users.getBg_path() != null) || (corporation != null && corporation.getBg_path() != null))
			if(users != null) {
				filePath = path + File.separator + users.getBg_path();
				fis = new FileInputStream(new File(filePath));
				
			}else {
				
				filePath = path + File.separator + corporation.getBg_path();
				fis =  new FileInputStream(new File(filePath));
			}
		
		else{
			String noimgPath = application.getRealPath("/images/profile/basicBackground.png");
			fis =  new FileInputStream(new File(noimgPath));
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
		
		InputStream fis = null;
		String filePath = "";
		if(users != null) {
			if (users.getProfile_path() == null){
				String noimgPath = application.getRealPath("/images/profile/basicProfile.png");
				fis =  new FileInputStream(new File(noimgPath));
				
			}else{
				filePath = path + File.separator + users.getProfile_path();
				fis = new FileInputStream(new File(filePath));
			}
		
		}else if(corporation != null){
			if (corporation.getLogo_path() == null){
				String noimgPath = application.getRealPath("/images/corporation/basic/basicCorporation.png");
				fis =  new FileInputStream(new File(noimgPath));
				
			}else{
				filePath = path + File.separator + corporation.getLogo_path();
				fis = new FileInputStream(new File(filePath));
			}
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
	
	@RequestMapping(path={"/profilePDF"})
	public String profilePDF(String user_id, Model model){
		Map<String, Object> usersMap = usersService.select_introduce(user_id);
		Map<String, Object> career_infoMap = carService.select_careerInfo(user_id);
		Map<String, Object> education_infoMap = eduService.select_educationInfo(user_id);
		Map<String, Object> recordMap = new HashMap<String, Object>();
		
		recordMap.put("thesis_listVoList", thesis_listService.select_thesis_list(user_id));
		recordMap.put("patent_listVoList", patent_listService.select_patent_list(user_id));
		recordMap.put("project_careerList", project_careerService.select_project_career(user_id));
		recordMap.put("award_historyList", award_historyService.select_award_history(user_id));
		recordMap.put("languageVoList", languageService.select_language(user_id));
		recordMap.put("possesion_skillsVoList", possesion_skillsService.select_possesion_skills(user_id));
		
		model.addAttribute("usersMap", usersMap);
		model.addAttribute("career_infoMap", career_infoMap);
		model.addAttribute("education_infoMap", education_infoMap);
		model.addAttribute("abilityVoList", abilityService.select_ability(user_id));
		model.addAttribute("recordMap", recordMap);
		
		return "/profile/profilePDF";
	}
	
	@RequestMapping(path={"/profileInsertConnection"})
	public String profileInsertConnection(Personal_connectionVo personalVo){
		personalService.insert_connections(personalVo);
		
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setMem_id(personalVo.getReceive_id());
		alarmInfo.setAlarm_check("0");
		alarmInfo.setDivision("25");
		alarmInfo.setSend_id(personalVo.getUser_id());
		alarmInfo.setAlarm_separate("04");
		
		alarmService.insert_alarmInfo(alarmInfo);
		
		return "redirect:/profileHome?user_id="+personalVo.getReceive_id();
	}
	
	@RequestMapping(path={"/profileDeleteConnection"})
	public String profileDeleteConnection(Personal_connectionVo personalVo){
		personalService.delete_connections(personalVo);
		return "redirect:/profileHome?user_id="+personalVo.getReceive_id();
	}
	
	@RequestMapping(path={"/profileInsertFollow"})
	public String profileInsertFollow(FollowVo followVo){
		followService.insert_follow(followVo);
		
		AlarmVo alarmInfo = new AlarmVo();
		
		alarmInfo.setMem_id(followVo.getRef_keyword());
		alarmInfo.setAlarm_check("0");
		alarmInfo.setDivision("14");
		alarmInfo.setSend_id(followVo.getMem_id());
		alarmInfo.setAlarm_separate("06");
		
		alarmService.insert_alarmInfo(alarmInfo);
		
		return "redirect:/profileHome?user_id="+followVo.getRef_keyword();
	}
	
	@RequestMapping(path={"/profileDeleteFollow"})
	public String profileDeleteFollow(FollowVo followVo){
		followService.delete_follow(followVo);
		return "redirect:/profileHome?user_id="+followVo.getRef_keyword();
	}
	
	
	
	
	

}
