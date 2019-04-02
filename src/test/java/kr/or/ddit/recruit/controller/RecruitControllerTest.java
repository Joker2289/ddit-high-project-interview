package kr.or.ddit.recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.ArrayList;
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
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.model.Search_logVo;
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
	
	@Resource(name="memberService")
	private IMemberService memService;	
	
	
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
	
	// 리스트에 항목 추가하고 제거하기 테스트.
	@Test
	public void testListAdd() {
		/***Given***/
		List<String> list = new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		list.add("5");
		
		int lVIdx = 2; // 인덱스 2 이면 -> 세번째 항목.

		/***When***/
		list.add(0, list.get(lVIdx));
		list.remove(list.size()-1);

		/***Then***/
		assertEquals("3", list.get(0));
		assertEquals(5, list.size());
	}
	
	/**
	 * 
	 * Method : testRecr_search
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 검색 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecr_search() throws Exception {
		/***Given***/
		MemberVo mVo = memService.select_memberInfo("brown");

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recrSearch").sessionAttr("memberVO", mVo)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		Search_logVo lSLog = (Search_logVo) mav.getModel().get("lSLog");

		/***Then***/
		assertEquals("recrSearchTiles", viewName);
		assertEquals("samsung", lSLog.getSearch_word());
	}
	
	/**
	 * 
	 * Method : testRandomArr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : String[]을 넣으면 num개를 골라서 strList를 반환해주는 메서드 테스트.
	 */
	@Test
	public void testRandomArr() {
		/***Given***/
		// String[]을 넣으면 num개를 골라서 strList를 반환
//		private List<String> ran_arr_arr(String[] arr_jobtype, int num) {
		String[] arr_jobtype = new String[]{"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		int num = 10;
		
		List<String> strList = new ArrayList<>();
		List<Integer> numList = new ArrayList<>();
		numList.add((int) (Math.random() * arr_jobtype.length));
		
		// 먼저 numList에 중복되지 않게 숫자를 num개 뽑아서 넣음.
		// 중복이 되나?? - ㅇㅇ. continue를 쓸때 while문이 다시 반복되는게 아니고 먼저 걸려있는 for문이 
		// 반복되기 때문에 내가 원하는 결과가 나오지 않음. flag를 추가해서 for문 밖에서 continue를 타게 만들자.
		while(true){
			int rnum = (int) (Math.random() * arr_jobtype.length);
			
			boolean skip_flag = false;
			for(int j=0; j < numList.size(); j++){
				if(rnum == numList.get(j)){
					skip_flag = true;
				}
			}
			
			if(skip_flag == true){
				continue;
			}
			
			numList.add(rnum);
			
			if(numList.size() == num){
				break;
			}
		}
		
		for(int i=0; i < numList.size(); i++){
			strList.add(arr_jobtype[numList.get(i)]);
		}
//			return strList;

		/***When***/
		logger.debug("to string strList ? : {}", strList.toString());
		// 중복되네.. - 수정.
		
		boolean duplication_flag = true;
		boolean duplication_check = false;
		String checkValue = strList.get(0);
		for(int i=1; i < strList.size(); i++){
			if(strList.get(i).equals(checkValue)){
				duplication_check = true;
				break;
			}
		}
		
		if(duplication_check == false){
			duplication_flag = false;
		}

		/***Then***/
		assertFalse(duplication_flag);
	}
	
	/**
	 * 
	 * Method : testMap
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 지도 검색 페이지 요청 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testMap() throws Exception {
		/***Given***/

		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/map")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		/***Then***/
		assertEquals("mapTiles", viewName);
	}
	
	
	
	
	
}




