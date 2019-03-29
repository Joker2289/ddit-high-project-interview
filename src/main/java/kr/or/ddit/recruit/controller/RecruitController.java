package kr.or.ddit.recruit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
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
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class RecruitController {
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@Resource(name="search_logService")
	private ISearch_logService search_logService;
	
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

	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	// 채용공고 페이지에 출력할 추천채용공고 리스트 사이즈.
	private int RRList1Size = 6; // 나중에 16쯤으로.
	private int RRList2Size = 4;

	// @채용공고 페이지 요청.
	@RequestMapping("/recruit")
	public String recruit(HttpSession session, String alarm_flag, String search_code, String scrap_flag, Model model) throws IOException{
		// 크롤링해서 값 넣기 어떻게 했더라. 삼성전자 데이터 있으면 리턴. 일단 비활성화.
//		crawling_company();
		
		// 채용공고 등록해보자.
//		insert_recr();
		
		// alarm_flag - 저장한 검색어 제거하기. - search_save를 '1'로 변경.
		if(alarm_flag != null && alarm_flag.equals("t")){
			Search_logVo sVo = search_logService.getSearch_log(search_code);
			sVo.setSearch_save("1");
			
			search_logService.updateSearch_log(sVo);
		}
		
		// 임시로 session에 user값 넣기. -> 우선은 이렇게 해놓고 개발하고 나중에는 로그인 컨트롤러에서
		// 처리하는 방식으로 바꿔야 함. 'File Search - usersVo (usersV?)'
		session.setAttribute("usersVo", usersService.select_userInfo("kim"));
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");		
		
		// 채용공고 스크랩을 한 경우. scrap_flag.substring(0, 1) -> 't'
		if( scrap_flag != null && 
				(scrap_flag.substring(0, 1).equals("t") || scrap_flag.substring(0, 1).equals("f")) ){
			// recruit_code는 scrap_flag - substring - 앞의 한글자만 빼면 됨.
			String scrap_code = scrap_flag.substring(1, scrap_flag.length());
			
			List<Save_recruitVo> uSRList = new ArrayList<>();
			uSRList = srecrService.getUserSrecrList(uVo.getUser_id());
			
			// 조회한 데이터가 없는 경우 먼저 insert를 해야됨.
			boolean srecr_Flag = false;
			for(Save_recruitVo sVo : uSRList){
				if(sVo.getRecruit_code().equals(scrap_code)){
					srecr_Flag = true;
				}
			}
			
			if(uSRList.size() == 0 || srecr_Flag  == false){
				Save_recruitVo sVo = new Save_recruitVo();
				sVo.setRecruit_code(scrap_code);
				sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
				sVo.setSave_flag("t");
				sVo.setUser_id(uVo.getUser_id());
				srecrService.insertSrecr(sVo);
			}else{
				for(Save_recruitVo sVo : uSRList){
					if(sVo.getRecruit_code().equals(scrap_code)){
						if(scrap_flag.substring(0, 1).equals("t")){
							sVo.setSave_flag("t");
						}else{
							sVo.setSave_flag("f");
						}
						srecrService.updateSrecr(sVo);
					}
				}
			}
		}
	
		// 저장한 검색어 리스트 넘기기.
		Search_logVo sVo = new Search_logVo();

		sVo.setUser_id(uVo.getUser_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = search_logService.getSaveList(sVo);
		
		model.addAttribute("saveList", saveList);
		
		List<RecruitVo> recrList = recrService.getAllRecr();
		model.addAttribute("recrList", recrList);
		
		// 회사 리스트 - 혹시 나중에 느려지면 필요한 정보만 가져오는 쿼리 새로 만들기.
		// 이 부분은 처음에 리스트를 출력하려고 전체리스트를 가져온 거고 추천리스트 두개를 만들면
		// 불필요한 부분임.
		List<CorporationVo> corpList = corpService.select_allCorps();
		List<String> corpImgList = new ArrayList<>();
		List<String> corpNmList = new ArrayList<>();
		
		for(int i=0; i < recrList.size(); i++){
			RecruitVo rVo = recrList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			corpImgList.add(cVo.getLogo_path());
			corpNmList.add(cVo.getCorp_name());
		}
		
		model.addAttribute("corpImgList", corpImgList);		
		model.addAttribute("corpNmList", corpNmList);		
		
		// 조회한 항목(마지막으로 조회한 채용공고) model에 넣기.
		// 여기서 가장 큰 수를 구한다음 조회, 조회 하지말고 -> 'recrService.getLastViewRecr'
		// 조회한 채용공고가 없는 경우도 처리해줘야 함.
		// 변수 첫 자는 소문자로.
		RecruitVo lVRVo = recrService.getLastViewRecr(uVo.getUser_id());
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
			// job_type -> POS / springboot / 알고리즘
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
			List<Save_recruitVo> uSRList1 = srecrService.getUserSrecrList(uVo.getUser_id());

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
		
		model.addAttribute("rRList1", rRList1);
//		logger.debug("flag?? : {}", scrap_flag); // 설마 로그 너무 많아서..
		// logback.xml logger level error 추가함.
		
		return "recruitTiles";
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
		while(true){
			int rnum = (int) (Math.random() * arr_jobtype.length);
			for(int j=0; j < numList.size(); j++){
				if(rnum == numList.get(j)){
					continue;
				}
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
	private void crawling_company() throws IOException {
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
	private void insertList() {
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
			cVo.setCorp_birth("94/03/03");
			cVo.setCorp_code(UUID.randomUUID().toString().substring(0, 8));
			cVo.setTelno("01011112222");
			cVo.setEmail("123@gmail.com");
			
			corpService.insert_corp(cVo);
		}		
	}

	// @검색결과 저장 후 채용공고 검색 페이지 요청.
	@RequestMapping("/recrSearch")
	public String recrSearch(String search_word, String search_local, HttpSession session, Model model){
		// 검색어 DB에 저장하기
		Search_logVo sVo = new Search_logVo();
//		logger.debug("search_local? : {}", search_local);
		if(search_word == null || search_word.equals("")){
			sVo.setSearch_word("전체");
		}else{
			sVo.setSearch_word(search_word);
		}
		
		if(search_local == null || search_local.equals("")){
			sVo.setSearch_local("전국");
		}else{
			sVo.setSearch_local(search_local);			
		}
		
		sVo.setSearch_code(String.valueOf(search_logService.getAllCnt()+1));
		
		// search_save 임시로 2로 설정. -> 나중에 1로 바꾸기.
		sVo.setSearch_save("2");
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		if(uVo != null){
			sVo.setUser_id(uVo.getUser_id());
		}else{
			// 임시로 아이디 brown 입력.
			sVo.setUser_id("brown");
		}
		search_logService.insertSearch_log(sVo);
		
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
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		sVo.setUser_id(uVo.getUser_id());
		srecrService.insertSrecr(sVo);
		
		RecruitVo recr = recrService.getRecr(recruit_code);
		CorporationVo corp = corpService.select_corpInfo(recr.getCorp_id());
		model.addAttribute("recr", recr);
		model.addAttribute("corp", corp);
		
		return "recr_detailTiles";
	}
	
	
	
	
}








