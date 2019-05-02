package kr.or.ddit.signup.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.education_info.service.IEducation_infoService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.signup.model.SignupVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;
import kr.or.ddit.util.model.Job_positionVo;
import kr.or.ddit.util.service.IJob_positionService;

@RequestMapping("/signUp")
@Controller
public class SignupController {
	
	private Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	@Resource(name="memberService")
	private IMemberService memService;
	
	@Resource(name="usersService")
	private IUsersService userService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="career_infoService")
	private ICareer_infoService careerService;
	
	@Resource(name="education_infoService")
	private IEducation_infoService educationService;
	
	@Resource(name="job_positionService")
	private IJob_positionService job_positionService;
	
	private String SecurityCode;	//인증코드 저장
	private String id;				//id 저장
	private String division;		//구분 저장
	
	
	@RequestMapping("/kakaoLogin")
	@ResponseBody
	public String kakaoLogin(@RequestBody SignupVo vo, HttpServletRequest req) {
		
		MemberVo search_member = memService.select_memberInfo(vo.getKakaoId());
		
		if(search_member == null) {
			MemberVo mVo = new MemberVo();
			mVo.setMem_id(vo.getKakaoId());
			mVo.setMem_division("1");
			
			int insertCnt = memService.insert_member(mVo);
			
			if(insertCnt == 1) {
				UsersVo uVo = new UsersVo();
				uVo.setProfile_img("kakao profile");
				uVo.setProfile_path(vo.getKakaoProfile());
				uVo.setUser_id(vo.getKakaoId());
				uVo.setUser_name(vo.getKakaoName());
				
				userService.insert_users(uVo);
				
				req.getSession().setAttribute("SESSION_MEMBERVO", mVo);
				
				
				return "redirect:/timeline";
			}
		}
		else {
			UsersVo userInfo = userService.select_userInfo(vo.getKakaoId());
			
			if(userInfo.getUser_name().equals(vo.getKakaoName()) || userInfo.getProfile_path().equals(vo.getKakaoProfile())) {
				UsersVo uVo = new UsersVo();
				uVo.setUser_id(vo.getKakaoId());
				uVo.setUser_name(vo.getKakaoName());
				uVo.setProfile_path(vo.getKakaoProfile());
				userService.update_userInfo(uVo);
			}
			
		}
		
		req.getSession().setAttribute("SESSION_MEMBERVO", search_member);
		
		return "redirect:/timeline";
		
	}
	
	@RequestMapping("/cancel")
	public String cancel() {
		memService.delete_member(id);
		return "login/login";
	}
	
	@RequestMapping("/goStep1")
	public String goStep1(String division) {
		
		if(division.equals("1")){
			return "login/step1";
		}
		
		return "login/step1_corp";
	}
	
	//기업 검색(자동완성)
	@RequestMapping(path="/searchCorp")
	@ResponseBody
	public List<CorporationVo> searchCorp(String keyword) throws UnsupportedEncodingException {
		
		logger.debug("keyword : {}", keyword);
		
		List<CorporationVo> corpList = corpService.searchCorp(keyword);
		
		logger.debug("corpList : {}", corpList);
		
		return corpList;
	}
	
	//직군 검색(자동완성)
	@RequestMapping(path="/searchPosition")
	@ResponseBody
	public List<Job_positionVo> searchPosition(String keyword) throws UnsupportedEncodingException {
		
		logger.debug("keyword : {}", keyword);
		
		List<Job_positionVo> positionList = job_positionService.searchPosition(keyword);
		
		logger.debug("positionList : {}", positionList);
		
		return positionList;
	}
	
	//이메일 인증
	@RequestMapping(path="/error_email")
	@ResponseBody
	public String error_email(@RequestBody SignupVo vo) {
		
		String success = sendEmail(vo.getEmail());
		
		logger.debug("mail 인증 : {}", success);
		logger.debug("mail vo : {}", vo);
		
		if(success.equals("error")) {
			return "error";
		}
		
		SecurityCode = success;
		
		return "success";
	}
	
	//ID 중복체크
	@RequestMapping(path="/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		
		MemberVo memVo = memService.select_memberInfo(id);
		
		if(memVo != null) {
			return "error";
		}
		
		return "success";
	}
	
	//Step2
	@RequestMapping("/goStep2")
	public String goStep2(@RequestBody SignupVo vo, Model model) {

		
		logger.debug("ste1.vo : {}", vo);
		
		
		//member 등록 후 -> users / corp 등록
		MemberVo mVo = new MemberVo();
		mVo.setMem_id(vo.getId());
		mVo.setMem_division(vo.getDivision());
		mVo.setPass(KISA_SHA256.encrypt(vo.getPass()));
		
		int insertCnt = memService.insert_member(mVo);
		
		id = vo.getId();
		
		division = vo.getDivision();
		
		if(vo.getDivision().equals("1")) {
			
			if(insertCnt == 1) {
				UsersVo uVo = new UsersVo();
				uVo.setUser_id(vo.getId());
				uVo.setEmail(vo.getEmail());
				uVo.setUser_name(vo.getName());
				userService.insert_users(uVo);
			}
			
		}
		
		if(vo.getDivision().equals("2")) {
			
			if(insertCnt == 1) {
				CorporationVo cVo = new CorporationVo();
				cVo.setCorp_id(vo.getId());
				cVo.setEmail(vo.getEmail());
				cVo.setCorp_name(vo.getName());
				corpService.insert_corp(cVo);
			}
			
		}
		
		return "login/step2";
	}
	
	//인증코드 에러 검사
	@RequestMapping("/error_code")
	@ResponseBody
	public String error_code(@RequestBody SignupVo vo) {
		
		logger.debug("error_code : {}", vo.getSecurityCode());
		
		if(!SecurityCode.equals(vo.getSecurityCode())) {
			return "error";
		}
		return "success";
	}
	
	@RequestMapping("/goStep3")
	public String goStep3() {
		
		logger.debug("dividion: {}", division);
		
		if(division.equals("1")) {
			return "login/step3";
		}
		
		return "login/step3_corp";
	}
	
	
	@RequestMapping("/goStep5From3")
	public String goStep5From3(@RequestBody SignupVo vo, HttpServletRequest req) {
		
		logger.debug("step3 : {}", vo);
		
		Career_infoVo career_infoVo = new Career_infoVo();
		career_infoVo.setUser_id(id);
		career_infoVo.setJob_position(vo.getJob_position());		//직군
		career_infoVo.setJob_rank(vo.getJob_rank());				//직급
		career_infoVo.setCorporate_name(vo.getCorporate_name());	//회사이름
		career_infoVo.setJoin_date(vo.getJoin_date());
		career_infoVo.setResign_date(vo.getResign_date());
		
		careerService.insert_career_info(career_infoVo);
		
		logger.debug("step4 : {}", vo);
		
		return "login/step5";
	}
	
	@RequestMapping("/goStep5From4")
	public String goStep5From4(@RequestBody SignupVo vo, HttpServletRequest req) {
		
		logger.debug("step4 : {}", vo);
		
		Education_infoVo eVo = new Education_infoVo();
		eVo.setUser_id(id);
		eVo.setSchool_name(vo.getSchool_name());
		eVo.setDegree_name(vo.getDegree_name());
		eVo.setMajor(vo.getMajor());
		eVo.setAdmission(vo.getAdmission());
		eVo.setGraduation(vo.getGraduation());
		eVo.setGrade(vo.getGrade());
		
		educationService.insert_education_info(eVo);
		
		return "login/step5";
	}
	
	@RequestMapping("/returnStep4")
	public String returnStep4() {
		return "login/step4";
	}
	
	@RequestMapping("/returnStep3")
	public String returnStep3() {
		return "login/step3";
	}
	
	@RequestMapping("/goStep4_corp")
	public String goStep4_corp(@RequestBody SignupVo vo) {
		
		CorporationVo cVo = new CorporationVo();
		cVo.setCorp_id(id);
		cVo.setCorp_type(vo.getCorp_type());
		cVo.setIndustry_type(vo.getIndustry_type());
		cVo.setCorp_size(vo.getCorp_size());
		cVo.setCorp_birth(vo.getCorp_birth());
		
		corpService.update_corpInfo(cVo);
		
		return "login/step4_corp";
	}
	
	@RequestMapping("/goStep5_corp")
	public String goStep5_corp(@RequestBody SignupVo vo) {
		
		CorporationVo cVo = new CorporationVo();
		cVo.setCorp_id(id);
		cVo.setTelno(vo.getTelno());
		cVo.setZipcode(vo.getZipcode());
		cVo.setAddr1(vo.getAddr1());
		cVo.setAddr2(vo.getAddr2());
		logger.debug("location? : {}", vo.getLocation_data());
		cVo.setCorp_location(vo.getLocation_data());
		
		corpService.update_corpInfo(cVo);
		
		return "login/step5";
	}
	
	
	
	
	@RequestMapping(path="/finalStep", consumes ={"multipart/form-data"})
	@ResponseBody
	public String finalStep(@RequestParam(value = "profile") MultipartFile profile, HttpServletRequest req, Model model) throws IllegalStateException, IOException {
		
		String realFileName = "";
		String tmpFileName = UUID.randomUUID().toString(); 
		
		//사용자 사진을 업로드 한경우
		if(profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			
			//유저 프로필 등록
			if(division.equals("1")) {
				realFileName =  req.getServletContext().getRealPath("/upload/" + tmpFileName);
				profile.transferTo(new File(realFileName));
				
				UsersVo uVo = new UsersVo();
				uVo.setUser_id(id);
				uVo.setProfile_img(fileName);
				uVo.setProfile_path(tmpFileName);
				
				userService.update_userInfo(uVo);
				return "회원";
			}
			
			
			//기업 프로필 등록
			else {
				realFileName =  req.getServletContext().getRealPath("/upload/" + tmpFileName);
				profile.transferTo(new File(realFileName));
				
				//업체코드 등록
				String[] corp_code = UUID.randomUUID().toString().split("-");
				model.addAttribute("corp_code", corp_code[0]);
				
				
				CorporationVo cVo = new CorporationVo();
				cVo.setCorp_id(id);
				cVo.setCorp_logo(fileName);
				cVo.setLogo_path(tmpFileName);
				cVo.setCorp_code(corp_code[0]);
				
				corpService.update_corpInfo(cVo);
				
				return corp_code[0]; 
			}
			
		}
		return "회원";
	}
	
	/**
	 * 
	 * Method : sendEmail
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param to_email
	 * @return
	 * Method 설명 : 인증메일 보내기
	 */
	public String sendEmail(String to_email) {
		
		//보내는 사람 email
		String host = "smtp.naver.com";
		final String user = "pjk2289@naver.com";
		final String password = "dntjd72007989@";
		
		//받는 사람 email
		String to = to_email;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		String[] SecurityCode = UUID.randomUUID().toString().split("-");
		
		// 메일 정보
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 제목
			message.setSubject("[InterView] 회원가입 인증 메일 발송");

			
			// 내용
			message.setText("[인증번호:"+ SecurityCode[0] +"]");

			// 전송
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
			return "error";
		}
		
		return SecurityCode[0];
	}
	
}
