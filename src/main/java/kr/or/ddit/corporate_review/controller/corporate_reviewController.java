package kr.or.ddit.corporate_review.controller;

import java.util.List;

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
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class corporate_reviewController {
	
	private Logger logger = LoggerFactory.getLogger(corporate_reviewController.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 
	
	@Resource(name = "corporationService")
	private ICorporationService corporationService;
	
	
	
	@RequestMapping(path={"/companyReview"})
	public String companyReviewView(String corp_id, Model model, PaginationVo paginationVo) {
		
		paginationVo.setPageSize(3);
		paginationVo.setCorp_id(corp_id);
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		List<Corporate_reviewVo> crVo = personalService.select_companyReview(paginationVo);
		if (crVo.size() > 0){
			int reviewCnt = Integer.parseInt(crVo.get(0).getReviewCnt());
			int lastPage = reviewCnt / 3 + (reviewCnt%paginationVo.getPageSize() > 0 ? 1 : 0);
			model.addAttribute("reviewCnt", reviewCnt);
			model.addAttribute("lastPage", lastPage);
		}
		
		model.addAttribute("crVo", crVo);
		model.addAttribute("corporationInfo", corporationInfo);
		model.addAttribute("paginationVo", paginationVo);
		
		return "companyReviewTiles";
	}
	
	
	@RequestMapping(path={"/companyReviewInsert"})
	public String companyReviewInsert(Corporate_reviewVo reviewVo, String[] cr_content) {
		
		String contents = cr_content[0]+"☆"+cr_content[1]+"☆"+cr_content[2];
		reviewVo.setCr_contents(contents);
		
		logger.debug("dd{}" , reviewVo);
		personalService.insert_companyReview(reviewVo);
		
		return "redirect:/companyReview?corp_id="+reviewVo.getCorp_id();
	}

}
