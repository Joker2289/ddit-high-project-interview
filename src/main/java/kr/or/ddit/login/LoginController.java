package kr.or.ddit.login;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
//	@Resource(name="userService")
//	IUserService userService;
//	
//	@Resource(name="boardService")
//	IBoardService boardService;
	
	/**
	 * 
	 * Method : loginView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 로그인 화면을 요청
	 */
	//method 속성이 설정되어 있지 않으면 모든 method에 대해 처리
	@RequestMapping(path= {"/login"}, method=RequestMethod.GET)
	public String loginView() {
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
//	@RequestMapping(path= {"/login"}, method=RequestMethod.POST)
//	public String loginProcess(UserVO userVO, HttpServletRequest req) {
//		
//		//사용자가 요청한 ID에 해당되는 실제 DB에 저장된 값
//		UserVO dbUserVO = userService.searchUser(userVO.getUserId());
//		
//		//로그인 성공
//		if(dbUserVO.getUserId().equals(userVO.getUserId()) &&
//				dbUserVO.getPass().equals(KISA_SHA256.encrypt(userVO.getPass()))){
//			
//			req.getSession().setAttribute("boardList", boardService.getAllBoard());
//			req.getSession().setAttribute("userVO_log", dbUserVO);
//			
//			return "module/main_D";
//		}
//		
//		//로그인 실패
//		else {
//			return "login/login";
//		}
//	}
	
}
