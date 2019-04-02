package kr.or.ddit.recruit.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class RecruitController {
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@Resource(name="search_logService")
	private ISearch_logService sLogService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="memberService")
	private IMemberService memService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;
	
	@Resource(name="interestService")
	private IInterestService inteService;

	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	// 채용공고 페이지에 출력할 추천채용공고 리스트 사이즈.
	private int RRList1Size = 6; // 나중에 16쯤으로.
	private int rRList2Size = 16;

	// @채용공고 페이지 요청.
	@RequestMapping("/recruit")
	public String recruit(HttpSession session, String alarm_flag, String search_code, HttpServletRequest req, 
			Model model) throws IOException{
		// 유저정보 수정. 'SESSION_MEMBERVO'
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");		
		
		// 사용자 정보 없으면 로그인창으로 이동. -> 수정. 필터?
		
		// 크롤링해서 값 넣기 어떻게 했더라. 삼성전자 데이터 있으면 리턴. 일단 비활성화.
//		crawling_company();
		
		// 채용공고 등록해보자.
//		insert_recr();
		
		// 회사회원 데이터에 주소 넣기. (주소 -> 좌표)
//		update_corp_addr();
		
		// 회사 좌표 업데이트.
//		update_corp_location();
		
		// '관심분야'를 통해 'rRList2' 만들기. -_-! 우선 받은 값을 확인해보자. 확인 InterestController
		// 에서 하고 insert까지 한 다음 redirect - /recruit.
		List<RecruitVo> rRList2 = new ArrayList<>();
		
		InterestVo iVo = inteService.getInte(mVo.getMem_id());
		if(iVo != null){
			model.addAttribute("inteVo", iVo);
		
			String inte_type = iVo.getInte_type();
			String inte_local = iVo.getInte_local();
			String inte_emptype = iVo.getInte_emptype();
			String inte_size = iVo.getInte_size();
			List<RecruitVo> tempList = new ArrayList<>();
			
			// 처음에 지역으로 추천리스트를 채웠네. rRList2는 우선 설정한 조건에 맞는 채용공고들을 출력
			// 해주도록 하자. 조건 우선순위는 local > type > emptype > size
			// 우선 local, type만 맞춰서 리스트를 만들어보자. 
			
			// local이 '전국'인지 확인
			if(inte_local.equals("전국")){
				rRList2 = recrService.getAllRecr();
			}else{
				String inte_local1 = inte_local.split(" / ")[0];
				String inte_local2 = inte_local.split(" / ")[1];
				String inte_local3 = inte_local.split(" / ")[2];
				rRList2.addAll(recrService.getRecrByLocal(inte_local1));
				rRList2.addAll(recrService.getRecrByLocal(inte_local2));
				rRList2.addAll(recrService.getRecrByLocal(inte_local3));
			}
			
			// 업무분야의 1순위가 (inte_local1) 포함되어있지 않은 채용공고는 제외. -> remove - size 변경으로 인한
			// 오류 발생. inte_local1가 포함된 채용공고를 tempList에 추가하도록 수정. 
			for(int i=0; i < rRList2.size(); i++){
				// 채용공고 등록에서 업무분야 입력할 때 '가장 유사한 업무분야를 순서대로 3가지 선택해주세요'
				String inte_type1 = inte_type.split(" / ")[0];
				
				String job_type = rRList2.get(i).getJob_type();
				String job_type1 = job_type.split(" / ")[0];
				String job_type2 = job_type.split(" / ")[1];
				String job_type3 = job_type.split(" / ")[2];
				
				if(job_type1.equals(inte_type1) || job_type2.equals(inte_type1) || job_type3.equals(inte_type1)){
					tempList.add(rRList2.get(i));
				}
			}
			
			rRList2 = tempList;
			
			List<String> corpImgList2 = new ArrayList<>();
			List<String> corpNmList2 = new ArrayList<>();
			
			// 스크랩 데이터는 srecr에 있으니까 저장여부 리스트 scrapList 만들기. size는 rRList2에서 
			// 가져오고 uSRList에서 save_flag가 't'인게 있으면 t. 없으면 f.
			List<String> scrapList2 = new ArrayList<>();
			List<Save_recruitVo> uSRList2 = srecrService.getUserSrecrList(mVo.getMem_id());
	
			for(int i=0; i < rRList2.size(); i++){
				RecruitVo rVo = rRList2.get(i);
				CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
				corpImgList2.add(cVo.getLogo_path());
				corpNmList2.add(cVo.getCorp_name());
				
				boolean scrapCheck_flag = false;
				for(Save_recruitVo scrapCheckSVo : uSRList2){
					if(scrapCheckSVo.getRecruit_code().equals(rVo.getRecruit_code()) 
							&& scrapCheckSVo.getSave_flag().equals("t")){
						scrapCheck_flag = true;
						scrapList2.add("t");
						break;
					}
				}
				
				if(scrapCheck_flag == false){
					scrapList2.add("f");
				}
			}
			
			model.addAttribute("corpImgList2", corpImgList2);		
			model.addAttribute("corpNmList2", corpNmList2);			
			model.addAttribute("scrapList2", scrapList2);		
			
			
			// rRList2.size()가 rRList2Size가 될때까지 마지막 항목 지움.
			while(rRList2.size() > rRList2Size){
				rRList2.remove(rRList2.size()-1);
			}		
		}
		
		model.addAttribute("rRList2", rRList2);
		
		
		// alarm_flag - 저장한 검색어 제거하기. - search_save를 '1'로 변경.
		if(alarm_flag != null && alarm_flag.equals("t")){
			Search_logVo sVo = sLogService.getSearch_log(search_code);
			sVo.setSearch_save("1");
			
			sLogService.updateSearch_log(sVo);
		}

		// 저장한 검색어 리스트 넘기기.
		Search_logVo sVo = new Search_logVo();

		sVo.setUser_id(mVo.getMem_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = sLogService.getSaveList(sVo);
		
		model.addAttribute("saveList", saveList);
		
		List<RecruitVo> recrList = recrService.getAllRecr();
		model.addAttribute("recrList", recrList);
		
		// 조회한 항목(마지막으로 조회한 채용공고) model에 넣기.
		// 여기서 가장 큰 수를 구한다음 조회, 조회 하지말고 -> 'recrService.getLastViewRecr'
		// 조회한 채용공고가 없는 경우도 처리해줘야 함.
		// 변수 첫 자는 소문자로.
		RecruitVo lVRVo = recrService.getLastViewRecr(mVo.getMem_id());
		List<RecruitVo> rRList1 = new ArrayList<>();
		if(lVRVo == null){
			lVRVo = new RecruitVo();
			lVRVo.setRecruit_title("원하는 채용공고를 찾아보세요!");
			lVRVo.setJob_local("회원님에게 맞는 채용공고를 추천해드립니다.");
			
			// 이 글을 클릭했을 경우 채용공고 검색 페이지로 이동. '전체 - 전국'
			// 값이 있는 경우는 그 채용공고 상세페이지로 이동하지.
			// /recr_detail - recruit_code
			// 이동할 때 recruit_title을 확인해서 '원하는 채용공고를'로 시작하면 검색 페이지로 
			// 이동하도록 하자.
			model.addAttribute("lVRVo", lVRVo);
			
			// jsp에서 <c:if test="${RRList == null"> 이면 추천채용공고 리스트 출력하지 않기.
		}else{
			model.addAttribute("lVRVo", lVRVo);
			
			// 조회한 항목을 참고한 추천채용공고리스트 넘기기. (RRList1)
			rRList1 = recrService.getRecrByLocal(lVRVo.getJob_local());
			
			// 조회한 항목은 제외하고 나머지를 리스트에 넣도록 하자. (parameterMap 사용? 일단 X)
			// 여기서 list size가 0이 될수 있으니 size가 RRList1Size를 넘지 않는 경우 비슷한 업무를 찾아
			// 넣어주는 기능 만들기.
			// job_type -> 예 - POS / springboot / 알고리즘
			if(rRList1.size() < RRList1Size){
				String type1 = lVRVo.getJob_type().split(" / ")[0];
				List<RecruitVo> searchList1 = recrService.getRecrByType(type1);
				for(RecruitVo rVo : searchList1){
					boolean insertFlag = true;
					
					for(RecruitVo RRVo : rRList1){
						if(RRVo.getRecruit_code().equals(rVo.getRecruit_code())){
							// 중복되면 넣지 않기.
							insertFlag = false;
							break;
						}
					}
					
					if(insertFlag){
						rRList1.add(rVo);
					}
				}
				
				String type2 = lVRVo.getJob_type().split(" / ")[1];
				List<RecruitVo> searchList2 = recrService.getRecrByType(type2);
				for(RecruitVo rVo : searchList2){
					boolean insertFlag = true;
					
					for(RecruitVo RRVo : rRList1){
						if(RRVo.getRecruit_code().equals(rVo.getRecruit_code())){
							// 중복되면 넣지 않기.
							insertFlag = false;
							break;
						}
					}
					
					if(insertFlag){
						rRList1.add(rVo);
					}
				}
				
				String type3 = lVRVo.getJob_type().split(" / ")[2];
				List<RecruitVo> searchList3 = recrService.getRecrByType(type3);
				for(RecruitVo rVo : searchList3){
					boolean insertFlag = true;
					
					for(RecruitVo RRVo : rRList1){
						if(RRVo.getRecruit_code().equals(rVo.getRecruit_code())){
							// 중복되면 넣지 않기.
							insertFlag = false;
							break;
						}
					}
					
					if(insertFlag){
						rRList1.add(rVo);
					}
				}
				// 중복되는 걸 제거해야 됨.
			}
			
			// RRList1.size()가 RRList1Size가 될때까지 마지막 항목 지움.
			while(rRList1.size() > RRList1Size){
				rRList1.remove(rRList1.size()-1);
			}
			
			List<String> corpImgList1 = new ArrayList<>();
			List<String> corpNmList1 = new ArrayList<>();
			
			// 스크랩 데이터는 srecr에 있으니까 저장여부 리스트 scrapList 만들기. size는 rRList1에서 
			// 가져오고 uSRList에서 save_flag가 't'인게 있으면 t. 없으면 f.
			List<String> scrapList1 = new ArrayList<>();
			List<Save_recruitVo> uSRList1 = srecrService.getUserSrecrList(mVo.getMem_id());

			for(int i=0; i < rRList1.size(); i++){
				RecruitVo rVo = rRList1.get(i);
				CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
				corpImgList1.add(cVo.getLogo_path());
				corpNmList1.add(cVo.getCorp_name());
				
				boolean scrapCheck_flag = false;
				for(Save_recruitVo scrapCheckSVo : uSRList1){
					if(scrapCheckSVo.getRecruit_code().equals(rVo.getRecruit_code()) 
							&& scrapCheckSVo.getSave_flag().equals("t")){
						scrapCheck_flag = true;
						scrapList1.add("t");
						break;
					}
				}
				
				if(scrapCheck_flag == false){
					scrapList1.add("f");
				}
			}
			
			model.addAttribute("corpImgList1", corpImgList1);		
			model.addAttribute("corpNmList1", corpNmList1);			
			model.addAttribute("scrapList1", scrapList1);			
		}
		
		// 마지막 조회/스크랩 채용공고를 리스트의 맨앞으로 옮기자. lVRVo가 리스트에 없을수도 있음.
		// 있을 땐 인덱스 저장해놓기. (lVIdx)
		boolean lVRVo_flag = false;
		
		for(RecruitVo rVo : rRList1){
			if(rVo.getRecruit_code().equals(lVRVo.getRecruit_code())){
				lVRVo_flag = true;
				break;
			}
		}
		
		// list.add(index, element); 이용. 여기 만들다 말았었군.
		if(lVRVo_flag == false){
			// 없을 땐 lVRVo를 0번에 넣고 마지막 항목을 지움.
			
		}else{
			// 있을 땐 add([lVIdx])하고 remove([lVIdx+1]) <- 테스트 해보기.
			
		}
		
		model.addAttribute("rRList1", rRList1);
//		logger.debug("flag?? : {}", scrap_flag); // 설마 로그 너무 많아서..
		// logback.xml logger level error 추가함.
		
		return "recruitTiles";
	}	
	
	// 회사 좌표 업데이트.
	private void update_corp_location() {
		String data = "4/36.33503205924424/127.39677886497321//5/36.327950661050465/127.42659051361443//6/36.35141693706307/127.3401790981222//8/36.36067544342291/127.34464046741947//7/36.35455478978288/127.33955994392711//10/36.354222353058155/127.44422053795066//9/36.425479947931365/127.39263989076437//13/36.29857090530391/127.33793218829507//11/36.358465496689334/127.4232496366498//15/36.44864430849931/127.4199108121918//12/36.30370852264028/127.34892329869682//17/36.352958482623535/127.3777969073076//14/36.31717489752688/127.45338195339158//16/36.3502458465932/127.37725797696643//19/37.570744325762846/126.98360914667553//18/36.35427578252461/127.3772952471586//21/37.57126926703499/126.97630554223102//20/37.52525923818516/127.04183916231236//holly/37.522827164111504/127.04001424430611//22/37.56462407218648/126.97922335034117//kim/35.115364308266564/128.9595348158848//23/37.50449284378187/127.00784436615872//27/37.55720941721661/126.92361977091058//samsung/37.5265427209826/127.04053210013338//26/37.50653640461993/127.12048711570657//28/37.50944139825955/127.1052363434873//31/37.52201436464297/126.85883630726723//30/37.534802342638976/127.01093858339178//25/35.154275771307425/129.06359316332686//24/35.207169937902535/129.07204589207316";
		String[] arr_data = data.split("//");
		for(int i=0; i < arr_data.length; i++){
			String corp_id = arr_data[i].split("/")[0];
			CorporationVo cVo = corpService.select_corpInfo(corp_id);
			String location_value = arr_data[i].split("/")[1].substring(0, 8).concat("/" + arr_data[i].split("/")[2].substring(0, 9));
//			logger.debug("location_value ?? : {}", location_value);
			cVo.setCorp_location(location_value);
			corpService.update_corpInfo(cVo);
		}
	}

	// 회사회원 데이터에 주소 넣기.
	private void update_corp_addr() {
		String data = "대전 중구 대종로 486/대전 서구 계룡로 692 1층, 2층/대전 유성구 도안대로 573/대전 유성구 온천서로 2/대전 유성구 대학로 82/대전 유성구 테크노중앙로 68/대전 대덕구 동서대로 1776/대전 대덕구 한밭대로 1122/대전 서구 계백로 1128/대전 서구 관저로 142/대전 동구 옥천로 118/대전 대덕구 석봉동 309-10/대전 서구 대덕대로 189 1층/대전 서구 둔산로31번길 28 금정빌딩 1층/대전 서구 대덕대로241번길 35/서울 종로구 종로 51/서울 강남구 도산대로57길 24/서울 종로구 세종대로 167 현대해상본사사옥 별관내/서울 중구 소공로 112 반도조선아케이드/서울 서초구 사평대로 205 센트럴시티 파미에파크돔/서울 강남구 강남대로 390/서울 강남구 선릉로 836 삼원빌딩 1~2층/서울 강서구 등촌로 57/서울 송파구 오금로 241/서울 마포구 양화로 165 상진빌딩 1층/서울 송파구 석촌호수로 262 지상 1, 2층/서울 영등포구 신길로 137 1,2층/서울 용산구 독서당로 94/서울 양천구 신월로 341";
		String[] arr_data = data.split("/");		
		
		List<CorporationVo> corpList = corpService.select_allCorps();
		for(int i=0; i < corpList.size(); i++){
			CorporationVo cVo = corpList.get(i);
			
			if(cVo.getAddr1() == null){
				cVo.setAddr1(arr_data[i]);
				corpService.update_corpInfo(cVo);
			}
		}
	}

	// 채용공고 등록
	private void insert_recr() {
		for(int k=0; k<30; k++){
			RecruitVo rVo = new RecruitVo();
			rVo.setRecruit_code(String.valueOf(recrService.getRecrCnt()+1));
			
			// 전체 회사 수 - random pick - 'select_corpInfo' ... 먼저 corpList를 만들어놓고 random index로 
			// 픽을 해야겠다.
			List<CorporationVo> corpList = corpService.select_allCorps();
			
			int ridx = ran_i(corpList.size());
			rVo.setCorp_id(corpList.get(ridx-1).getCorp_id());
			
			String[] arr_title = new String[]{"2019년 상반기 신입/경력 채용", "2019 프론트엔드 개발직 경력사원 수시채용", "연구소(Software) 신입/경력 채용공고", "2019 상반기 클라이언트개발/백엔드 모집", "2019년 신입/경력/채용전제형인턴 채용", "SW QA엔지니어 채용[신입/경력] ", "보안엔지니어 신입 및 경력사원 모집", "웹(JAVA)/앱(AND,IOS) 개발자 부문 상반기 채용", "2019년 경력직원 모집(네트워크운영/DBA)", "신입(석/박사) 및 경력사원 채용"};
			String rstr = ran_arr(arr_title);
			rVo.setRecruit_title(rstr);
			
			String[] arr_jobtype = new String[]{"소프트웨어개발", "백엔드", "모바일앱개발", "웹마스터", "데이터베이스", "클라이언트개발", "네트워크구축", "DBMS", "솔루션", "DataMining", "네트워크보안", "유지보수", "공공기관", "전자상거래", "웹컨텐츠", "웹테스터", "소프트웨어QA", "리눅스", "안드로이드", "C++", "Java", "HTTP·TCP", "통신", "POS", "모바일기획", "서버관리", "시스템운영", "Framework", "springboot", "Nodejs", "알고리즘", ".NET", "웹프로그래밍", "Python", "빅데이터", "머신러닝", "asp", "Oracle", "MS-SQL", "SM", "SI", "WAS", "jsp", "DBA"};
			int num = 3;
			List<String> strList = ran_arr_arr(arr_jobtype, num);
			String str_input = strList.get(0);
			for(int i=0; i < strList.size()-1; i++){
				str_input += " / " +strList.get(i+1);
			}
			rVo.setJob_type(str_input);
			
			rVo.setRecruit_contents("xxx일을 해주세용");
			rVo.setStart_date("19/03/20");
			rVo.setEnd_date("19/04/27");
			
			String[] arr_per = new String[]{"O명", "O명", "OO명"};
			String rper = ran_arr(arr_per);
			rVo.setPersonnel(rper);
			
			rVo.setJob_rank("사원");
			
			String[] arr_emptype = new String[]{"정규직", "정규직", "정규직", "정규직", "계약직", "계약직", "인턴", "파견직", "도급", "프리랜서"};
			String remp = ran_arr(arr_emptype);
			rVo.setEmp_type(remp);
			
			String[] arr_apptype = new String[]{"t", "f"};
			String rapp = ran_arr(arr_apptype);
			rVo.setApp_type(rapp);
			
			rVo.setApp_count("0");
			
			String[] arr_local = new String[]{"서울", "서울", "서울", "서울", "서울", "서울", "경기", "경기", "경기", "경기", "경기", "인천", "인천", "대전", "대전", "세종", "충남", "충북", "광주", "전남", "전북", "대구", "경북", "부산", "부산", "울산", "경남", "강원", "제주"};
			String rlocal = ran_arr(arr_local);
			rVo.setJob_local(rlocal);
			
			recrService.insertRecr(rVo);
		}
	}
	
	// String[]을 넣으면 num개를 골라서 strList를 반환
	private List<String> ran_arr_arr(String[] arr_jobtype, int num) {
		List<String> strList = new ArrayList<>();
		List<Integer> numList = new ArrayList<>();
		numList.add((int) (Math.random() * arr_jobtype.length));
		
		// 먼저 numList에 중복되지 않게 숫자를 num개 뽑아서 넣음.
		// 중복이 되나??
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
		return strList;
	}

	// String[]을 넣으면 그중 하나를 골라서 random string 반환.
	private String ran_arr(String[] arr_title) {
		String rstr = arr_title[(int) (Math.random() * arr_title.length)];
		
		return rstr;
	}

	// size를 넣으면 random index 반환.
	private int ran_i(int size) {
		int ridx = (int) (Math.random() * size) + 1;
		
		return ridx;
	}

	// 잡코리아 - 연봉정보 - 직무별 - IT·인터넷 - 사원 많은순 - 1 page 크롤링.
	private void crawling_company() throws IOException, ParseException {
		// corp_name - 삼성전자가 있으면 insert하지 않도록 return.
		if(corpService.getCorp("삼성전자") != null){
			return;
		}
		
		Document doc = Jsoup.connect("http://www.jobkorea.co.kr/Salary/Index?coKeyword=&tabindex=2&indsCtgrCode=&indsCode=&jobTypeCode=10016&haveAGI=0&orderCode=5&coPage=1#salarySearchCompany").get();		

		Elements data_img = doc.select("#listCompany").get(0).select("img");
		
		img_list = new ArrayList<>();
		
		for(Element e : data_img){
			img_list.add(e.toString());
		}
		
		Elements data_str = doc.select("#listCompany").get(0).select("li");
		
		str_list = new ArrayList<>();
		
		for(Element e : data_str){
			str_list.add(e.text());
		}
		
		one_list = new ArrayList<>();
		String one = str_list.get(0);
		String[] arr_one = one.split(" ");	
		
		// split한 배열을 리스트에 넣기.
		for(String str : arr_one){
			one_list.add(str);
		}
		
		com_list = new ArrayList<>();
		for(String com : str_list){
			String[] arr_com = com.split(" ");
			List<String> temp_list = new ArrayList<>();
			
			for(String str : arr_com){
				// '채용중' 건너뛰기
				if(str.equals("채용중")){
					continue;
				}
				
				temp_list.add(str);
			}
			
			com_list.add(temp_list);
		}
		
		// index - 27. 사진이 없음.
		img_list.remove(27);
		str_list.remove(27);
		com_list.remove(27);
		
		logger.debug("com_list size?? : {}", com_list.size());
		
		// 크롤링한 데이터 CORPORATION 테이블에 넣기.
		insertList();		
	}

	// 회사 insert
	private void insertList() throws ParseException {
		for(int i=0; i<img_list.size(); i++){
			CorporationVo cVo = new CorporationVo();
			cVo.setLogo_path(img_list.get(i));
			cVo.setCorp_name(com_list.get(i).get(0));
			cVo.setIndustry_type(com_list.get(i).get(3));
			// get(4) 값에 따라 값 넣기.
			if(com_list.get(i).get(4).equals("사원수")){
				cVo.setCorp_size(com_list.get(i).get(5));
				cVo.setCorp_profile("평균연봉 " + com_list.get(i).get(6));
				cVo.setCorp_profile(cVo.getCorp_profile() + " 매출액 6조 8,000억원");
			}else{
				String money = com_list.get(i).get(5);
				
				for(int j=0; j<2; j++){
					if(com_list.get(i).get(5 + j+1).equals("사원수")){
						cVo.setCorp_size(com_list.get(i).get(5 + j+1 + 1));
						cVo.setCorp_profile(com_list.get(i).get(5 + j+1 + 2));
						break;
					}
					money += " " + com_list.get(i).get(5 + j+1);
					cVo.setCorp_size(com_list.get(i).get(5 + j+1 + 2));
					cVo.setCorp_profile(com_list.get(i).get(5 + j+1 + 3));
				}
				
				String last_str = money.substring(money.length()-1, money.length());
				if( ! last_str.equals("원")){
					money += "원";
				}
				
				cVo.setCorp_profile("평균연봉 " + cVo.getCorp_profile() + " 매출액 " + money);
			}
			
			// 회사 만들기 전에 먼저 member 추가하기. 비활성화.
//			MemberVo mVo = new MemberVo();
//			mVo.setMem_division("2");
//			mVo.setMem_id(String.valueOf((corpService.getCorpCnt()+1)));
//			mVo.setMem_status("1");
//			mVo.setPass(KISA_SHA256.encrypt("1234"));
//			mVo.setReport_count("0");
//			memService.insert_member(mVo);
			
			cVo.setCorp_id(String.valueOf((corpService.getCorpCnt()+1)));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			cVo.setCorp_birth(sdf.parse("94/03/03"));
			cVo.setCorp_code(UUID.randomUUID().toString().substring(0, 8));
			cVo.setTelno("01011112222");
			cVo.setEmail("123@gmail.com");
			
			corpService.insert_corp(cVo);
		}		
	}

	// @검색결과 저장 후 채용공고 검색 페이지 요청. -> 검색내역 저장은 Search_logController로 이동.
	@RequestMapping("/recrSearch")
	public String recrSearch(HttpSession session, Model model){
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// 회원이 검색한 값 가져오기. (getLSLog - get last search_log)
		Search_logVo lSLog = sLogService.getLSLog(mVo.getMem_id());
		
		model.addAttribute("lSLog", lSLog);
		
		return "recrSearchTiles";
	}	
	
	// @채용공고 상세화면.
	@RequestMapping("/recr_detail")
	public String recr_detail(String recruit_code, HttpSession session, Model model){
		// 회원 정보를 가져와서 채용공고저장에 마지막으로 조회한 채용공고 저장. 마지막 채용공고를 따로 
		// 설정하지는 않고 회원의 채용공고저장 리스트에서 save_code가 가장 큰 데이터를 확인하자.
		Save_recruitVo sVo = new Save_recruitVo();
		sVo.setRecruit_code(recruit_code);
		sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
		sVo.setSave_flag("f");
		
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		sVo.setUser_id(mVo.getMem_id());
		srecrService.insertSrecr(sVo);
		
		RecruitVo recr = recrService.getRecr(recruit_code);
		CorporationVo corp = corpService.select_corpInfo(recr.getCorp_id());
		model.addAttribute("recr", recr);
		model.addAttribute("corp", corp);
		
		return "recr_detailTiles";
	}
	
	// @채용공고 올리기 페이지 요청.
	@RequestMapping("/writeRecr")
	public String writeRecr() {

		return "writeRecrTiles";
	}
	
	// @지도 검색 페이지 요청.
	@RequestMapping("/map")
	public String map(Model model) {
		List<RecruitVo> recrList = recrService.getAllRecr();
		model.addAttribute("recrList", recrList);
		
		List<String> addrList = new ArrayList<>();
		for(int i=0; i < recrList.size(); i++){
			RecruitVo rVo = recrList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			addrList.add(cVo.getAddr1());
		}
		model.addAttribute("addrList", addrList);
		
		// 회사 목록을 넘겨보자.
		List<CorporationVo> corpList = corpService.select_allCorps();
		model.addAttribute("corpList", corpList);
		
		return "mapTiles";
	}
	
	
	
	
	
}








