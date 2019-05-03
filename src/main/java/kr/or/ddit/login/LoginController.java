package kr.or.ddit.login;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;

@Controller
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;

	
	/**
	 * 
	 * Method : loginView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 로그인 화면을 요청
	 */
	@RequestMapping(path= {"/login"}, method=RequestMethod.GET)
	public String loginView(HttpServletRequest req, Model model) {
		
		return "login/login";
	}
	
	/**
	 * 
	 * Method : loginProcess
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param userVO
	 * @param session
	 * @return
	 * Method 설명 : 로그인 처리
	 */
	@RequestMapping(path= {"/login"}, method=RequestMethod.POST)
	public String loginProcess(MemberVo memVo, HttpServletRequest req) {
		
		MemberVo dbMemberVo = memberService.select_memberInfo(memVo.getMem_id());
		
		//로그인 성공
		if(dbMemberVo.getMem_id().equals(memVo.getMem_id()) &&
				dbMemberVo.getPass().equals(KISA_SHA256.encrypt(memVo.getPass()))){
			
			//일반회원 로그인
			if(dbMemberVo.getMem_division().equals("1")) {
				UsersVo uVo = usersService.select_userInfo(dbMemberVo.getMem_id());
				req.getSession().setAttribute("SESSION_DETAILVO", uVo);
				req.getSession().setAttribute("PROFILE_REALPATH", uVo.getProfile_path());
				req.getSession().setAttribute("MYNAME", uVo.getUser_name());
			}
				
			//기업 로그인
			else if(dbMemberVo.getMem_division().equals("2")) {
				CorporationVo cVo = corpService.select_corpInfo(dbMemberVo.getMem_id());
				req.getSession().setAttribute("SESSION_DETAILVO", cVo);
				req.getSession().setAttribute("PROFILE_REALPATH", cVo.getLogo_path());
				req.getSession().setAttribute("MYNAME", cVo.getCorp_name());
			}
			//관리자 로그인
			else {
			}
			
			req.getSession().setAttribute("SESSION_MEMBERVO", dbMemberVo);
//			return "timeLineTiles";
			return "redirect:/timeline";
		}
		
		//로그인 실패
		else {
			return "login/login";
		}
	}
	
	@RequestMapping(path= {"/kakaoLogin"}, method=RequestMethod.POST)
	public String kakaoLogin(MemberVo memVo, HttpServletRequest req) {
		
		logger.debug("---------------------- :{}", memVo.getMem_id());
		
		MemberVo dbMemberVo = memberService.select_memberInfo(memVo.getMem_id());
			
		if(dbMemberVo.getMem_division().equals("1")) {
			UsersVo uVo = usersService.select_userInfo(dbMemberVo.getMem_id());
			req.getSession().setAttribute("SESSION_DETAILVO", uVo);
			req.getSession().setAttribute("PROFILE_REALPATH", uVo.getProfile_path());
			req.getSession().setAttribute("MYNAME", uVo.getUser_name());
			req.getSession().setAttribute("SESSION_MEMBERVO", dbMemberVo);
			
			return "redirect:/timeline";
		}
				
		return "login/login";
	}

}
