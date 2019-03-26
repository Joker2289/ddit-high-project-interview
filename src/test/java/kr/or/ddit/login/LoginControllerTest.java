package kr.or.ddit.login;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.test.WebTestConfig;

public class LoginControllerTest extends WebTestConfig{
	
	/**
	 * 
	 * Method : testLoginView
	 * 작성자 : pjk
	 * 변경이력 :
	 * @throws Exception
	 * Method 설명 : 로그인 화면요청 테스트
	 */
	@Test
	public void testLoginView() throws Exception {
		/***Given***/
		
		/***When***/
		MvcResult mvcResult =  mockMvc.perform(get("/login")).andReturn();
		
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		/***Then***/
		assertEquals("login/login", viewName);
	}
	
	/**
	 * 
	 * Method : testLoginProcess
	 * 작성자 : pjk
	 * 변경이력 :a
	 * Method 설명 : 로그인 처리 테스트
	 * @throws Exception 
	 */
	@Test
	public void testLoginProcess() throws Exception {
		/***Given***/
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(post("/login").param("mem_id", "joker").param("pass", "1234")).andReturn();
		
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		/***Then***/
		assertEquals("timeLineTiles", viewName);
	}
}
