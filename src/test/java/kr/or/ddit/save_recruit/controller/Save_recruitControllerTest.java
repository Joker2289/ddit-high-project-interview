package kr.or.ddit.save_recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.test.WebTestConfig;

public class Save_recruitControllerTest extends WebTestConfig{
	private Logger logger = LoggerFactory.getLogger(Save_recruitControllerTest.class);

	@Resource(name="memberService")
	private IMemberService memService;
	
	/**
	 * 
	 * Method : testSrecr_appList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 저장한 채용공고 페이지 - 지원한 채용공고 목록 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testSrecr_appList() throws Exception {
		/***Given***/
		MemberVo mVo = memService.select_memberInfo("brown");
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/srecr").sessionAttr("SESSION_MEMBERVO", mVo)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		List<Save_recruitVo> appList = (List<Save_recruitVo>) mav.getModel().get("appList");
		logger.debug("appList size? : {}", appList.size());
		
		/***Then***/
		assertEquals("srecrTiles", viewName);
		assertNotNull(appList);
	}

}
