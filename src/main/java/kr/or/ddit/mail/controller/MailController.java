package kr.or.ddit.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController{

	@RequestMapping(path={"/mailHome"})
	public String mailHomeView(){
		return "mailTiles";
	}
	
	
}
