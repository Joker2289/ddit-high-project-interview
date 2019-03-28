package kr.or.ddit.interest.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.test.WebTestConfig;

public class InterestControllerTest extends WebTestConfig{

	/**
	 * 
	 * Method : testInterest
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 관심분야 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testInterest() throws Exception {
		/***Given***/
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/interest")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("interestTiles", viewName);
	}
	
	
	

}





