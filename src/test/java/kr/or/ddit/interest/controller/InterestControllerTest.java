package kr.or.ddit.interest.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.test.WebTestConfig;

public class InterestControllerTest extends WebTestConfig{
	private Logger logger = LoggerFactory.getLogger(InterestControllerTest.class);
	
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
		
		String change_flag = "t";
		String tell_content = "안녕하세요";
		String job_condition = "2";
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/insertInte").sessionAttr("SESSION_MEMBERVO", mVo)
				.param("inte_type", "소프트웨어개발 / Framework / WAS").param("inte_local", "전국")
				.param("inte_emptype", "정규직 / 계약직").param("inte_size", "1명 / 500명")
				.param("change_flag", change_flag).param("tell_content", tell_content)
				.param("job_condition", job_condition)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		/***Then***/
		assertEquals("redirect:/recruit", viewName);
		assertEquals("소프트웨어개발 / Framework / WAS", inteService.getInte("brown").getInte_type());	
	}
	
	// 리스트 정렬 테스트.
	@Test
	public void testListSort() {
		/***Given***/
		String[] arr_job = new String[]{"소프트웨어개발", "백엔드", "모바일앱개발", "웹마스터", 
				"데이터베이스", "클라이언트개발", "네트워크구축", "DBMS", "솔루션", "DataMining", 
				"네트워크보안", "유지보수", "공공기관", "전자상거래", "웹컨텐츠", "웹테스터", 
				"소프트웨어QA", "리눅스", "안드로이드", "C++", "Java", "HTTP·TCP", "통신", "POS", 
				"모바일기획", "서버관리", "시스템운영", "Framework", "springboot", "Nodejs", 
				"알고리즘", ".NET", "웹프로그래밍", "Python", "빅데이터", "머신러닝", "asp", 
				"Oracle", "MS-SQL", "SM", "SI", "WAS", "jsp", "DBA"};	
		
		List<String> jobList = new ArrayList<>();
		for(String job : arr_job){
			jobList.add(job);
		}
		
        Collections.sort(jobList, new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				return ((String) o1).compareTo((String) o2);
			}
        });		
        
        logger.debug("list sort? : {}", jobList.toString());
		
		/***When***/

		/***Then***/
		assertNotNull(jobList);
	}
	
	
	
	
	

}





