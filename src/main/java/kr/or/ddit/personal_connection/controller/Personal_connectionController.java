package kr.or.ddit.personal_connection.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Personal_connectionController {

	@RequestMapping(path={"/personalConnection"})
	public String personalConnectionView() {
		return "personalTiles";
	}
	
	
	
	
	
}
