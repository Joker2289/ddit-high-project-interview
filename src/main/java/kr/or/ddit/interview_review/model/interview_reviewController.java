package kr.or.ddit.interview_review.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class interview_reviewController {
	
	private Logger logger = LoggerFactory.getLogger(interview_reviewController.class);
	
	
	@RequestMapping(path={"/companyReview"})
	public String companyReviewView() {
		
		
		
		return "companyReviewTiles";
	}
	
	
	

}