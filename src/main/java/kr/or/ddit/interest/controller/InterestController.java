package kr.or.ddit.interest.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.interest.service.IInterestService;

@Controller
public class InterestController {
	private Logger logger = LoggerFactory.getLogger(InterestController.class);
	
	@Resource(name="interestService")
	private IInterestService inteService;
	
	// 관심분야 페이지 요청.
	@RequestMapping("/interest")
	public String interest(){
		return "interestTiles";
	}
	
	// @관심분야 등록.
	@RequestMapping("/insertInte")
	public String insertInte(HttpServletRequest req, String inte_type, String inte_local, String inte_emptype, 
			String inte_size) {
		InterestVo iVo = new InterestVo();
		inteService.insertInte(iVo);

		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	

}







