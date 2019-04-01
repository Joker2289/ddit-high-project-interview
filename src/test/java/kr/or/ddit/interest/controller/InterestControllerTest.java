package kr.or.ddit.interest.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.test.WebTestConfig;

public class InterestControllerTest extends WebTestConfig{
	
	@Resource(name="memberService")
	private IMemberService memService;
	
	@Resource(name="interestService")
	private IInterestService inteService;

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
	
	/**
	 * 
	 * Method : testInte_update
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 관심분야 페이지 - 수정 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testInte_update() throws Exception {
		/***Given***/
		MockHttpSession session = new MockHttpSession();
		MockHttpServletRequest req = new MockHttpServletRequest();
		MemberVo mVo = memService.select_memberInfo("brown");
		req.setContextPath("");
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/insertInte").sessionAttr("memberVO", mVo).param("inte_type", "소프트웨어개발 / Framework / WAS").param("inte_local", "전국").param("inte_emptype", "정규직 / 계약직").param("inte_size", "1명 / 500명")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		/***Then***/
		assertEquals("redirect:/recruit", viewName);
		assertEquals("소프트웨어개발 / Framework / WAS", inteService.getInte("brown").getInte_type());	
	}
	
	
	
	
	
	

}





