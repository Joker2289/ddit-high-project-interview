package kr.or.ddit.page.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.login.LoginController;

@Controller
public class PageController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * 
	 * Method : onenoteView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 로그인 화면을 요청
	 */
	@RequestMapping(path= {"/onenote"}, method=RequestMethod.GET)
	public String onenoteView(HttpServletRequest req, Model model) {
		
		return "onenote/write";
	}
}
