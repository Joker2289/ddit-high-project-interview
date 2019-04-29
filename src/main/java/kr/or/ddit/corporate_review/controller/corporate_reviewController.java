package kr.or.ddit.corporate_review.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.corporate_review.model.Corporate_reviewVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;

@Controller
public class corporate_reviewController {
	
	private Logger logger = LoggerFactory.getLogger(corporate_reviewController.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 
	
	@Resource(name = "corporationService")
	private ICorporationService corporationService;
	
	
	
	@RequestMapping(path={"/companyReview"})
	public String companyReviewView(String corp_id, Model model) {
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		
		model.addAttribute("corporationInfo", corporationInfo);
		return "companyReviewTiles";
	}
	
	
	@RequestMapping(path={"/companyReviewInsert"})
	public String companyReviewInsert(Corporate_reviewVo reviewVo) {
		
		logger.debug("dd{}" , reviewVo);
		personalService.insert_companyReview(reviewVo);
		
		return "redirect:/companyReview?corp_id="+reviewVo.getCorp_id();
		
	}

}
