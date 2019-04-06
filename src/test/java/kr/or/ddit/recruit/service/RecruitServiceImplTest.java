package kr.or.ddit.recruit.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class RecruitServiceImplTest extends LogicTestConfig{
	private Logger logger = LoggerFactory.getLogger(RecruitServiceImplTest.class);

	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Test
	public void testInsertRecruit() {
		/***Given***/
		recrService.deleteForTest("1");
		
		RecruitVo rVo = new RecruitVo();
		rVo.setRecruit_code("1");
		rVo.setCorp_id("5");
		rVo.setRecruit_title("2019년 상반기 신입/경력 채용");
		rVo.setJob_type("소프트웨어개발/백엔드");
		rVo.setRecruit_contents("xxx일을 해주세용");
		rVo.setStart_date("19/02/20");
		rVo.setEnd_date("19/02/27");
		rVo.setPersonnel("O명");
		rVo.setJob_rank("사원/대리");
		rVo.setEmp_type("정규직");
		rVo.setApp_type("t");
		rVo.setApp_count("0");
		rVo.setJob_local("서울");
		
		/***When***/
		int insertCnt = recrService.insertRecr(rVo);

		/***Then***/
		assertNotNull(insertCnt);
	}

	// math random 테스트.
	@Test
	public void testRandom() {
		/***Given***/
		int size = 10;

		/***When***/
		int ridx = 0;
		for(int i = 0; i < 20; i++){
			ridx = (int) (Math.random() * size) + 1;
			logger.debug("ridx? : {}", ridx);	
		}

		/***Then***/
		assertNotNull(ridx);
	}
	
	/**
	 * 
	 * Method : testGetRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 채용공고 조회 테스트.
	 */
	@Test
	public void testGetRecr() {
		/***Given***/

		/***When***/
		RecruitVo rVo = recrService.getRecr("1");

		/***Then***/
		assertNotNull(rVo);
	}

	/**
	 * 
	 * Method : testGetRecrByLocal
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 업무지역으로 채용공고 목록 조회 테스트.
	 */
	@Test
	public void testGetRecrByLocal() {
		/***Given***/

		/***When***/
		List<RecruitVo> RRList1 = recrService.getRecrByLocal("전북");

		/***Then***/
		assertNotNull(RRList1);
	}
	
	// List size, null 테스트.
	@Test
	public void testList() {
		/***Given***/
		List<String> list = new ArrayList<String>();

		/***When***/

		/***Then***/
		assertNotNull(list);
		assertEquals(0, list.size());
		// ArrayList 객체를 만들어놓으면 null 아니고 size는 0.
	}
	
	// 세로편집 테스트.
	@Test
	public void testEdit() {
		/***Given***/
		String aaa = "A 맘스터치 대전문화점 패스트푸드"+
				"0.00건 리뷰 4                 "      +
				"대전 중구 문화로 212          "      ; // 줄임.
		String data = "A 맘스터치 대전문화점 패스트푸드0.00건 리뷰 4                 xxxx대전 중구 문화로 212                                        (지번) 문화동 284-24                                        영업중매일 10:30 ~ 22:30                                    042-584-4259상세보기          즐겨찾기                      로드뷰                        B 맘스터치 대전문창점 패스트푸4.73건 리뷰 2                 xxxx대전 중구 대종로 302                                        (지번) 문창동 374-4                                         042-272-6686상세보기          즐겨찾기                      로드뷰길찾기                  C 맘스터치 대전은행동점 패스트2.73건 리뷰 5                 xxxx대전 중구 대종로480번길 40                                  (지번) 은행동 76-24                                         영업중매일 11:00 ~ 22:00                                    042-222-9288상세보기          즐겨찾기                      로드뷰                        D 맘스터치 대전대흥동점 패스트0.00건 리뷰 1                 xxxx대전 중구 선화서로 7 1층                                    (지번) 대흥동 521-4                                         042-242-5214상세보기          즐겨찾기                      로드뷰                        E 맘스터치 대전목동점 패스트푸1.01건 리뷰 4                 xxxx대전 중구 동서대로 1387-6                                   (지번) 목동 107-7                                           영업중매일 10:30 ~ 23:00                                    042-224-4222상세보기          즐겨찾기                      로드뷰                        F 맘스터치 서대전점 패스트푸드1.02건 리뷰 1                 xxxx대전 중구 계백로 1689 1층                                   (지번) 오류동 165-6                                         042-522-6633상세보기          즐겨찾기                      로드뷰                        G 맘스터치 대전아쿠아리움점 패2.04건 리뷰 1                 xxxx대전 중구 보문산공원로 469                                  (지번) 대사동 198-20                                        영업중매일 11:00 ~ 18:00                                    042-224-4008상세보기          즐겨찾기                      로드뷰                        H 맘스터치 우송대점 패스트푸드3.54건 리뷰 5                 xxxx대전 동구 동대전로 165 2층                                  (지번) 자양동 56-9                                          영업중매일 10:00 ~ 22:00                                    042-639-0008상세보기          즐겨찾기                      로드뷰                        I 맘스터치 대전복합터미널점 패2.73건 리뷰 5                 xxxx대전 동구 동서대로 1688 109,11                              (지번) 성남동 494-26                                        042-621-0125상세보기          즐겨찾기                      로드뷰                        J 맘스터치 대전가오점 패스트푸0.00건 리뷰 1                 xxxx대전 동구 은어송로 42-3 1층                                 (지번) 가오동 664                                           042-282-3001상세보기          즐겨찾기                      로드뷰                        K 맘스터치 한남대점 패스트푸드4.04건 리뷰 1                 xxxx대전 대덕구 한남로12번길 43 1층                              (지번) 오정동 212-3                                         영업중매일 14:00 ~ 24:00                                    042-626-9998상세보기          즐겨찾기                      로드뷰                        L 맘스터치 대전태평점 패스트푸2.52건 리뷰 1                 xxxx대전 중구 태평로 71 1층                                     (지번) 태평동 395-1                                         042-535-3311상세보기          즐겨찾기                      로드뷰                        M 맘스터치 대전둔산점 패스트푸2.68건 리뷰 8                 xxxx대전 서구 문예로 37                                         (지번) 둔산동 1498                                          영업중매일 11:00 ~ 24:00                                    042-472-9982상세보기          즐겨찾기                      로드뷰                        N 맘스터치 대전대점 패스트푸드4.01건 리뷰 1                 xxxx대전 동구 대학로 62-29 2층                                  (지번) 용운동 582                                           042-273-3000상세보기          즐겨찾기                      로드뷰                        O 맘스터치 대전보건대점 패스트1.52건 리뷰 0                 xxxx대전 동구 우암로 324 대복빌딩                               (지번) 가양동 162-3                                         영업중매일 11:00 ~ 22:00      ";
		String[] arr_data = data.split("xxxx");
		
		String data2 = "대전 중구 문화로 212"+
		"/대전 중구 대종로 302"+
		"/대전 중구 대종로480번길 40"+                 
		"/대전 중구 선화서로 7 1층"+
		"/대전 중구 동서대로 1387-6"+                
		"/대전 중구 계백로 1689 1층"+
		"/대전 중구 보문산공원로 469"+                
		"/대전 동구 동대전로 165 2층"+
		"/대전 동구 동서대로 1688"+
		"/대전 동구 은어송로 42-3 1층"+
		"/대전 대덕구 한남로12번길 43"+
		"/대전 중구 태평로 71 1층"+
		"/대전 서구 문예로 37"+
		"/대전 동구 대학로 62-29"+
		"/대전 동구 우암로 324";
		
		String data3 = "대전 중구 문화로 212/대전 중구 대종로 302/대전 중구 대종로480번길 40/대전 중구 선화서로 7 1층/대전 중구 동서대로 1387-6/대전 중구 계백로 1689 1층/대전 중구 보문산공원로 469/대전 동구 동대전로 165 2층/대전 동구 동서대로 1688/대전 동구 은어송로 42-3 1층/대전 대덕구 한남로12번길 43/대전 중구 태평로 71 1층/대전 서구 문예로 37/대전 동구 대학로 62-29/대전 동구 우암로 324";
		arr_data = data3.split("/");
		
		/***When***/
		String asd = "연구소(Software) 신입/경력 채";
		logger.debug("length : {}", asd.length());

		/***Then***/
		assertNotNull(aaa);
	}
	
	
}









