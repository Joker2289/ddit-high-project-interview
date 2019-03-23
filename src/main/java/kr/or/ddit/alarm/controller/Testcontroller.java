package kr.or.ddit.alarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Testcontroller {
	
	@RequestMapping(path={"/layout"})
	public String loginView() {
		return "layout";
	}
}
