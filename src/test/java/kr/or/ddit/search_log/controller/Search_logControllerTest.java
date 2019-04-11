package kr.or.ddit.search_log.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.search_log.model.Search_logVo;
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
		MvcResult mvcResult = mockMvc.perform(get("/insertSLog").sessionAttr("SESSION_MEMBERVO", mVo).param("search_word", "samsung").param("search_local", "부산")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("redirect:/recrSearch", viewName);
		assertEquals("samsung", sLogService.getLSLog("brown").getSearch_word());
		
		sLogService.deleteSearch_logForTest(String.valueOf(sLogService.getAllCnt()));
	}

	/**
	 * 
	 * Method : testUpdateSLog
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 알림여부 수정 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testUpdateAlarm() throws Exception {
		/***Given***/
		MockHttpServletRequest req = new MockHttpServletRequest();
		String search_code = "1";
		Search_logVo sVo = sLogService.getSearch_log(search_code);
		String search_alarm = sVo.getSearch_alarm();

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/updateAlarm").param("search_alarm", search_alarm).param("search_code", search_code)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		sVo = sLogService.getSearch_log(search_code);
		String search_alarm_after = sVo.getSearch_alarm();

		/***Then***/
		assertEquals("redirect:" + req.getContextPath() + "/recruit", viewName);
		assertTrue(! search_alarm.equals(search_alarm_after));
		
		// search_alarm 처음값으로 업데이트.
		sVo.setSearch_alarm(search_alarm);
		sLogService.updateSearch_log(sVo);
	}
	
	
	
	
}


