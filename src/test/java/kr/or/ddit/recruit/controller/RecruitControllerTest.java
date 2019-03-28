package kr.or.ddit.recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.test.WebTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class RecruitControllerTest extends WebTestConfig{

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;	
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;	
	
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
		
		List<RecruitVo> RRList1 = (List<RecruitVo>) mav.getModel().get("RRList1");

		/***Then***/
		assertEquals("recruitTiles", viewName);
		assertNotNull(RRList1);
	}
	
	
	
	
}




