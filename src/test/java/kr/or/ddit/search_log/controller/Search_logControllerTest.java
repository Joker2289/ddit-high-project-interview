package kr.or.ddit.search_log.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.test.WebTestConfig;

public class Search_logControllerTest extends WebTestConfig{

	@Resource(name="search_logService")
	private ISearch_logService sLogService;
	
	@Resource(name="memberService")
	private IMemberService memService;
	
	/**
	 * 
	 * Method : testInsertSLog
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 검색내역 등록 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testInsertSLog() throws Exception {
		/***Given***/
		MemberVo mVo = memService.select_memberInfo("brown");
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/insertSLog").sessionAttr("memberVO", mVo).param("search_word", "samsung").param("search_local", "부산")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("redirect:/recrSearch", viewName);
		assertEquals("samsung", sLogService.getLSLog("brown").getSearch_word());
	}

}
