package kr.or.ddit.save_recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Save_recruitController {
	private Logger logger = LoggerFactory.getLogger(Save_recruitController.class);

	// @채용공고저장 페이지 요청.
	@RequestMapping("/srecr")
	public String srecr(){
		
		return "srecrTiles";
	}
	
	
}




