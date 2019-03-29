package kr.or.ddit.interest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterestController {
	private Logger logger = LoggerFactory.getLogger(InterestController.class);
	
	// 관심분야 페이지 요청.
	@RequestMapping("/interest")
	public String interest(){
		
		return "interestTiles";
	}
	

}







