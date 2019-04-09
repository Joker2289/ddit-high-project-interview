package kr.or.ddit.recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.io.IOException;
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
import kr.or.ddit.save_recruit.model.Save_recruitVo;
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
	
	// 실수 값 변환 테스트.
	@Test
	public void testDouble() {
		/***Given***/
		String lat = "123.2233332223";
		// 에러. lat - split - 형변환 - 다시 소수점 붙이기?
		String[] arr_lat = lat.split("\\.");
		
		logger.debug("arr_lat[1]? : {}", arr_lat[1]);
		int int_lat = Integer.valueOf(arr_lat[0].concat(arr_lat[1].substring(0, 5)));
		
		/***When***/
		// 123.22333 <- 12322333 / 100000.0
		double double_lat = int_lat / 100000.0;
		logger.debug("double_lat? : {}", double_lat);

		/***Then***/
		assertTrue(double_lat > 100);
	}
	
	// 다음 지도 - 주소 값 크롤링 테스트.
	@Test
	public void testCrawling() throws IOException {
		/***Given***/
		// addr값이 페이지 소스에 나타나지가 않네. -> 그냥 select element 한 다음 소스를 복사해오면 되네.
		// 가 아니고 select elememt 한 다음 링크 주소를 복사해야됨. 도 안되네. javascript로 페이지가 만들
		// 어지는 곳은 크롤링하기가..
		
//		Document doc = Jsoup.connect("https://map.naver.com/?query=%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4&type=SITE_1&queryRank=0").get();		
//				
//		Elements data = doc.select("#panel dd");
//		logger.debug("data? : {}", data);
		
//		대전 중구 대종로 486, 대전 서구 계룡로 692 1층, 2층, 대전 유성구 도안대로 573, 대전 유성구 온천서로 2, 대전 유성구 대학로 82, 대전 유성구 테크노중앙로 68, 대전 대덕구 동서대로 1776, 대전 대덕구 한밭대로 1122, 대전 서구 계백로 1128, 대전 서구 관저로 142, 대전 동구 옥천로 118, 대전 대덕구 석봉동 309-10, 대전 서구 대덕대로 189 1층, 대전 서구 둔산로31번길 28 금정빌딩 1층, 대전 서구 대덕대로241번길 35

//http://img.jobkorea.kr/images/logo/200/w/h/whwpwhwp_200.gif"
//http://img.jobkorea.kr/images/logo/200/s/e/seagateJK_200.gif
//http://img.jobkorea.kr/images/logo/200/l/o/LOTTEGROUP_200.gif
//http://img.jobkorea.kr/images/logo/200/c/j/cjrecruit_200.gif
//http://img.jobkorea.kr/images/logo/200/g/6/g614075_200.gif
//http://img.jobkorea.kr/images/logo/200/k/i/kiamotor01_200.gif
//http://img.jobkorea.kr/images/logo/200/s/e/semcorecruit_200.gif
//http://img.jobkorea.kr/images/logo/200/p/1/p155297_200.gif
//http://img.jobkorea.kr/images/logo/200/n/n/nnnnn210024_200.gif
//http://img.jobkorea.kr/images/logo/200/e/b/ebonsa_200.gif
//http://img.jobkorea.kr/images/logo/200/t/e/tesco_200.gif
//http://img.jobkorea.kr/images/logo/200/v/1/v142945_200.gif
//http://img.jobkorea.kr/images/logo/200/s/d/sd45237_200.gif
//http://img.jobkorea.kr/images/logo/200/h/y/hynix_200.gif
//http://img.jobkorea.kr/images/logo/200/k/e/kepco01_200.gif
//http://img.jobkorea.kr/images/logo/200/w/n/wnvkfl_200.gif
//http://img.jobkorea.kr/images/logo/200/h/1/h168693_200.gif
//http://img.jobkorea.kr/images/logo/200/h/p/hpexpress1_200.gif 
//http://img.jobkorea.kr/images/logo/200/k/k/kk114794_200.gif
//
//http://img.jobkorea.kr/images/logo/200/w/1/w198139_200.gif
//http://img.jobkorea.kr/images/logo/200/n/1/n100012_200.gif
//http://img.jobkorea.kr/images/logo/200/w/1/w198139_200.gif
//http://img.jobkorea.kr/images/logo/200/j/k/jknhoras_200.gif
//http://img.jobkorea.kr/images/logo/200/c/j/cjfoodvill_200.gif 
//http://img.jobkorea.kr/images/logo/200/w/o/wooribank0_200.gif 
//http://img.jobkorea.kr/images/logo/200/w/c/wc10186_200.gif
//http://img.jobkorea.kr/images/logo/200/p/o/poscohrteam_200.gif
//http://img.jobkorea.kr/images/logo/200/g/m/GMKCAREERS_200.gif


		/***When***/

		/***Then***/
		//assert
	}
	
	// 주소 데이터 가져오기.
	@Test
	public void testAddr() {
		/***Given***/
		String data_daejeon = "대전 중구 대종로 486/대전 서구 계룡로 692 1층, 2층/대전 유성구 도안대로 573/대전 유성구 온천서로 2/대전 유성구 대학로 82/대전 유성구 테크노중앙로 68/대전 대덕구 동서대로 1776/대전 대덕구 한밭대로 1122/대전 서구 계백로 1128/대전 서구 관저로 142/대전 동구 옥천로 118/대전 대덕구 석봉동 309-10/대전 서구 대덕대로 189 1층/대전 서구 둔산로31번길 28 금정빌딩 1층/대전 서구 대덕대로241번길 35";
		String[] arr_data_daejeon = data_daejeon.split("/");
		
		String data_seoul = "서울 종로구 종로 51/서울 강남구 도산대로57길 24/서울 종로구 세종대로 167 현대해상본사사옥 별관내/서울 중구 소공로 112 반도조선아케이드/서울 서초구 사평대로 205 센트럴시티 파미에파크돔/서울 강남구 강남대로 390/서울 강남구 선릉로 836 삼원빌딩 1~2층/서울 강서구 등촌로 57/서울 송파구 오금로 241/서울 마포구 양화로 165 상진빌딩 1층/서울 송파구 석촌호수로 262 지상 1, 2층/서울 영등포구 신길로 137 1,2층/서울 용산구 독서당로 94/서울 양천구 신월로 341/서울 종로구 인사동길 14";
		String[] arr_data_seoul = data_daejeon.split("/");
		
		String data = "대전 중구 대종로 486/대전 서구 계룡로 692 1층, 2층/대전 유성구 도안대로 573/대전 유성구 온천서로 2/대전 유성구 대학로 82/대전 유성구 테크노중앙로 68/대전 대덕구 동서대로 1776/대전 대덕구 한밭대로 1122/대전 서구 계백로 1128/대전 서구 관저로 142/대전 동구 옥천로 118/대전 대덕구 석봉동 309-10/대전 서구 대덕대로 189 1층/대전 서구 둔산로31번길 28 금정빌딩 1층/대전 서구 대덕대로241번길 35/서울 종로구 종로 51/서울 강남구 도산대로57길 24/서울 종로구 세종대로 167 현대해상본사사옥 별관내/서울 중구 소공로 112 반도조선아케이드/서울 서초구 사평대로 205 센트럴시티 파미에파크돔/서울 강남구 강남대로 390/서울 강남구 선릉로 836 삼원빌딩 1~2층/서울 강서구 등촌로 57/서울 송파구 오금로 241/서울 마포구 양화로 165 상진빌딩 1층/서울 송파구 석촌호수로 262 지상 1, 2층/서울 영등포구 신길로 137 1,2층/서울 용산구 독서당로 94/서울 양천구 신월로 341";
		String[] arr_data = data.split("/");
		// 부산 : 부산 동래구 충렬대로 101/부산 부산진구 전포대로199번길 27
		
		String rest_data = "서울 종로구 인사동길 14";

		/***When***/
		logger.debug("check : {}", arr_data_daejeon[2]);
		logger.debug("check length : {}", arr_data_daejeon.length);
		logger.debug("check length : {}", arr_data.length);

		/***Then***/
		assertTrue(arr_data_daejeon.length > 5);
	}

	/**
	 * 
	 * Method : testRecr_app
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 지원시 지원자 수 수정 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecr_app() throws Exception {
		/***Given***/
		String recruit_code = "1";
		RecruitVo rVo = recrService.getRecr(recruit_code);
		String app_count = rVo.getApp_count();
		
		Save_recruitVo sVo = srecrService.getLastSrecr(recruit_code);
		String recr_app = sVo.getRecr_app();
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recr_app").param("recruit_code", recruit_code)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();

		String app_count_after = recrService.getRecr(recruit_code).getApp_count();
		
		/***Then***/
		assertEquals("recr_detailTiles", viewName);
		assertNotEquals(app_count, app_count_after);
		
		if(Integer.valueOf(app_count) > Integer.valueOf(app_count_after)){
			app_count_after = String.valueOf(Integer.valueOf(app_count_after)+1);
		}else{
			app_count_after = String.valueOf(Integer.valueOf(app_count_after)-1);
		}
		
		rVo.setApp_count(app_count_after);
		recrService.updateRecr(rVo);
	}
	
	
	
	
	
}




