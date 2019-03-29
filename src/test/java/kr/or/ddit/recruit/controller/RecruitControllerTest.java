package kr.or.ddit.recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.test.WebTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class RecruitControllerTest extends WebTestConfig{
	private Logger logger = LoggerFactory.getLogger(RecruitControllerTest.class);

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;	
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;	
	
	@Resource(name="search_logService")
	private ISearch_logService SLService;	
	
	/**
	 * 
	 * Method : testRecr_detail
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 상세조회 페이지 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecr_detail() throws Exception {
		/***Given***/
		String recruit_code = "1";
		
		// ** session 객체 생성. MockHttpSession()
		HttpSession session = new MockHttpSession();
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("brown");
		session.setAttribute("usersVo", uVo);
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recr_detail").param("recruit_code", recruit_code).session((MockHttpSession) session)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		RecruitVo rVo = (RecruitVo) mav.getModel().get("recr");
		CorporationVo cVo = (CorporationVo) mav.getModel().get("corp");
		
		/***Then***/
		assertEquals("recr_detailTiles", viewName);
		assertNotNull(rVo);
		assertNotNull(cVo);
	}

	/**
	 * 
	 * Method : testSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고저장 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testSrecr() throws Exception {
		/***Given***/

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/srecr")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		/***Then***/
		assertEquals("srecrTiles", viewName);
	}
	
	/**
	 * 
	 * Method : testRecruit
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecruit() throws Exception {
		/***Given***/
		MockHttpSession session = new MockHttpSession();
		String alarm_flag = null;

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recruit").session(session).param("alarm_flag", alarm_flag)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("recruitTiles", viewName);
	}
	
	/**
	 * 
	 * Method : testRRList1
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 페이지 - 추천채용공고 리스트 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRRList1() throws Exception {
		/***Given***/
		MockHttpSession session = new MockHttpSession();
		String alarm_flag = null;
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("brown");
		session.setAttribute("usersVo", uVo);

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recruit").session(session).param("alarm_flag", alarm_flag)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		List<RecruitVo> rRList1 = (List<RecruitVo>) mav.getModel().get("rRList1");

		/***Then***/
		assertEquals("recruitTiles", viewName);
		assertNotNull(rRList1);
	}
	
	/**
	 * 
	 * Method : testRecrSearch
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고검색 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecrSearch() throws Exception {
		/***Given***/
		MockHttpServletRequest req = new MockHttpServletRequest();
		MockHttpSession session = new MockHttpSession();
		String search_word = "google";
		String search_local = null;

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recrSearch").session(session).param("search_word", search_word).param("search_local", search_local)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("recrSearchTiles", viewName);
		
		// 테스트 돌려도 insert가 되네.
		SLService.deleteSearch_logForTest(String.valueOf(SLService.getAllCnt()));
	}
	
	/**
	 * 
	 * Method : testScrapList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : scrapList size 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testScrapList() throws Exception {
		/***Given***/
		MockHttpSession session = new MockHttpSession();
		String alarm_flag = null;
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("brown");
		session.setAttribute("usersVo", uVo);

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recruit").session(session).param("alarm_flag", alarm_flag)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		List<RecruitVo> rRList1 = (List<RecruitVo>) mav.getModel().get("rRList1");
		List<String> scarpList1 = (List<String>) mav.getModel().get("scarpList1");
		logger.debug("rRList1 size? : {}", rRList1.size());
		logger.debug("scarpList1 size? : {}", scarpList1.size());
		
		/***Then***/
		assertEquals("recruitTiles", viewName);
		assertNotNull(rRList1);
		assertNotNull(scarpList1);
	}
	
	/**
	 * 
	 * Method : testWriteRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 올리기 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testWriteRecr() throws Exception {
		/***Given***/

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/writeRecr")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("writeRecrTiles", viewName);
	}
	
	
	
	
	
}




