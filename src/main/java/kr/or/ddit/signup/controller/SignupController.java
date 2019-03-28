package kr.or.ddit.signup.controller;


import java.io.File;
import java.io.IOException;
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
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.education_info.service.IEducation_infoService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.signup.model.SignupUserVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;

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
	
	private String SecurityCode;
	private String id;
	
	@RequestMapping(path="/cancel")
	@ResponseBody
	public String cancel() {
		memService.delete_member(id);
		return "login/login";
	}
	
	@RequestMapping("/go")
	public String step() {
		return "login/step1";
	}
	
	
	@RequestMapping("/step1")
	public String step1(@RequestBody SignupUserVo vo, Model model) {

		logger.debug("step1 : {}", vo); 
		
		String success = sendEmail(vo.getEmail());
		
		if(success.equals("error")) {
			return "error";
		}
		
		//member 등록 후 -> users / corp 등록
		MemberVo mVo = new MemberVo();
		mVo.setMem_id(vo.getId());
		mVo.setMem_division(vo.getDivision());
		mVo.setPass(KISA_SHA256.encrypt(vo.getPass()));
		int insertCnt = memService.insert_member(mVo);
		
		
		
		if(insertCnt == 1) {
			UsersVo uVo = new UsersVo();
			uVo.setUser_id(vo.getId());
			uVo.setEmail(vo.getEmail());
			uVo.setUser_name(vo.getName());
			userService.insert_users(uVo);
		}
		
		id = vo.getId();
		SecurityCode = success;
		
		return "login/step2";
	}
	
	
	@RequestMapping("/step2")
	public String step2(@RequestBody SignupUserVo vo, HttpServletRequest req) {
		logger.debug("SecurityCode :{}", SecurityCode);
		logger.debug("SecurityCode2 :{}", vo.getSecurityCode());
		
		if(!SecurityCode.equals(vo.getSecurityCode())) {
			return "error";
		}
		
		return "login/step3";
	}
	
	
	@RequestMapping("/step3")
	public String step3(@RequestBody SignupUserVo vo, HttpServletRequest req) {
		
		logger.debug("step3 : {}", vo);
		
		Career_infoVo career_infoVo = new Career_infoVo();
		career_infoVo.setUser_id(id);
		career_infoVo.setJob_position(vo.getJob_position());		//직군
		career_infoVo.setJob_rank(vo.getJob_rank());				//직급
		career_infoVo.setCorporate_name(vo.getCorporate_name());	//회사이름
		
		careerService.insert_career_info(career_infoVo);
		
		return "login/step4";
	}
	
	@RequestMapping("/step4")
	public String step4(@RequestBody SignupUserVo vo, HttpServletRequest req) {
		
		logger.debug("step4 : {}", vo);
		
		Education_infoVo eVo = new Education_infoVo();
		eVo.setUser_id(id);
		eVo.setSchool_name(vo.getSchool_name());
		eVo.setDegree_name(vo.getDegree_name());
		eVo.setMajor(vo.getMajor());
		//eVo.setAdmission(vo.getAdmission());
		//eVo.setGraduation(vo.getGraduation());
		eVo.setGrade(vo.getGrade());
		
		educationService.insert_education_info(eVo);
	
		
		return "login/step5";
	}
	
	
	
	@RequestMapping(path="/step5", consumes ={"multipart/form-data"})
	public String step5(@RequestParam(value = "profile") MultipartFile profile, HttpServletRequest req) throws IllegalStateException, IOException {
		
		logger.debug("step5 : {}", profile);
		
		//사용자 사진을 업로드 한경우
		if(profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String realFileName =  "/Users/pjk/Documents/picture/" + UUID.randomUUID().toString();
			
			profile.transferTo(new File(realFileName));
			UsersVo uVo = new UsersVo();
			uVo.setUser_id(id);
			uVo.setProfile_img(fileName);
			uVo.setProfile_path(realFileName);
			
			userService.update_userInfo(uVo);
		}
		
		return "login/login";
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
	
	@RequestMapping("/test111")
	public String test111() {
		
		return "login/test111";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
