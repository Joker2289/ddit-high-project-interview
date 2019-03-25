package kr.or.ddit.corporation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CorporationController {
	
	
	
	@RequestMapping(path={"/corporationUpdate"},method={RequestMethod.GET})
	public String corporation(HttpSession session){
		return "corporation/corporationUpdate";
		
		
		
	}
}
