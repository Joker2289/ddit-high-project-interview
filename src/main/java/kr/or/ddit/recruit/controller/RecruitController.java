package kr.or.ddit.recruit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.AlarmServiceImpl;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.apply_recruit.service.IApply_recruitService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.item.model.ItemVo;
import kr.or.ddit.item.service.IItemService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.report.model.ReportVo;
import kr.or.ddit.report.service.IReportService;
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
	
	@Resource(name="itemService")
	private IItemService itemService;
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;

	@Resource(name="reportService")
	private IReportService reportService;
	
	@Resource(name="apply_recruitService")
	private IApply_recruitService appService;
	
	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	// 채용공고 페이지에 출력할 추천채용공고 리스트 사이즈.
	private int RRList1Size = 6; // 나중에 16쯤으로.
	private int rRList2Size = 16;

	// @채용공고 페이지 요청.
	@RequestMapping("/recruit")
	public String recruit(HttpSession session, HttpServletRequest req, String msg_flag, 
			String msg, Model model) throws IOException, ParseException{
		// 유저정보 수정. 'SESSION_MEMBERVO'
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");		
		
		// 채용공고 지역 - 회사의 주소 지역으로 바꾸기
//		editRecrLocal();
		
		// 사용자 정보 없으면 로그인창으로 이동. -> 수정. 필터?
		
		// 크롤링해서 값 넣기 어떻게 했더라. 삼성전자 데이터 있으면 리턴. 일단 비활성화.
//		crawling_company();
		
		// 채용공고 등록해보자.
//		insert_recr();
		
		// 회사회원 데이터에 주소 넣기. (주소 -> 좌표)
//		update_corp_addr();
		
		// 회사 좌표 업데이트.
//		update_corp_location();
		
		// 업무분야 항목 등록.
//		insert_item();
		
		// daum IT news crawling - titleList, linkList 넘기기.
		Document doc = Jsoup.connect("https://media.daum.net/digital/").get();
		
		Elements data = doc.select(".cate_sub").get(0).select("a");
		
		List<String> titleList = new ArrayList<>();
		List<String> linkList = new ArrayList<>();
				
		// 인덱스 번호는 고정된 게 아니라서 a 태그의 class에 main이 붙은 항목을 가져와야 함.
		boolean size_flag = false;
		int idx = 1;
		
		for(int i=0; i < data.size(); i++){
			if(data.get(i).toString().split("\">")[0].endsWith("main")){
				String temp_title = data.get(i).toString().split("\">")[1];
				String title = temp_title.substring(0, temp_title.length()-4);
				titleList.add(title + " ("+idx+"/5)");
				idx++;
				
				String link = data.get(i).toString().split("\"")[1];
				linkList.add(link);
				
				if(linkList.size() == 5){
					size_flag = true;
				}
			}
			
			if(size_flag == true){
				break;
			}
		}
		
		// 맨위의 기사 추가로 add.
//		String temp_str1 = data.get(0).toString().split("alt=\"")[1];
//		String title1 = temp_str1.substring(0, temp_str1.length()-7);
//		String link1 = data.get(0).toString().split("\"")[1];		
//		
//		titleList.add(0, title1);
//		linkList.add(0, link1);
		
		// index 0에 다섯번째 항목을 넣어놓는다. (슬라이드는 index 1부터 시작. 다섯번째 항목까지
		// 이동 후 margin-top을 0으로 설정.)
		titleList.add(0, titleList.get(4));
		linkList.add(0, linkList.get(4));
		
		model.addAttribute("titleList", titleList);
		model.addAttribute("linkList", linkList);
		
		// 'msg_flag' model에 넣기. (redirect시 여기서 한번더 넣어줘야 alert 띄울 수 있음)
		model.addAttribute("msg_flag", msg_flag);
		
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
			List<String> timeList2 = new ArrayList<>();
			
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
				
				String start_date = rVo.getStart_date();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
				Date start = sdf.parse(start_date);
				Date now = new Date();
				
				long temp_time = now.getTime() - start.getTime();
				
				int time_diff = (int) (temp_time / (60*1000));
				
				if(time_diff < 2){
					timeList2.add("방금");
				}else if(time_diff < 60){
					timeList2.add(time_diff + "분");
				}else if(time_diff < 1440){
					timeList2.add(time_diff/60 + "시간");
				}else if(time_diff < 43200){
					timeList2.add(time_diff/(60*24) + "일");
				}else{
					timeList2.add(time_diff/(60*24*30) + "달");
				}				
			}
			
			model.addAttribute("corpImgList2", corpImgList2);		
			model.addAttribute("corpNmList2", corpNmList2);			
			model.addAttribute("scrapList2", scrapList2);		
			model.addAttribute("timeList2", timeList2);		
			
			// rRList2.size()가 rRList2Size가 될때까지 마지막 항목 지움.
			while(rRList2.size() > rRList2Size){
				rRList2.remove(rRList2.size()-1);
			}		
		}
		
		model.addAttribute("rRList2", rRList2);

		// 조회한 항목(마지막으로 조회한 채용공고) model에 넣기.
		RecruitVo lVRVo = recrService.getLastViewRecr(mVo.getMem_id());
		
		if(lVRVo == null){
			lVRVo = new RecruitVo();
			lVRVo.setRecruit_title("원하는 채용공고를 찾아보세요!");
			lVRVo.setJob_local("회원님에게 맞는 채용공고를 추천해드립니다.");
		}
		
		model.addAttribute("lVRVo", lVRVo);
		
		// 저장한 검색어 리스트 (saveList) 넘기기.
		Search_logVo sVo = new Search_logVo();

		sVo.setUser_id(mVo.getMem_id());
		sVo.setSearch_save("2");
		sVo.setDel_flag("2");
		List<Search_logVo> saveList = sLogService.getSaveList(sVo);
		model.addAttribute("saveList", saveList);
		
		// 최근 검색어 리스트 (sList) 넘기기.
		List<Search_logVo> sList = sLogService.getSList(mVo.getMem_id());
		model.addAttribute("sList", sList);
		
//		logger.debug("flag?? : {}", scrap_flag); // 설마 로그 너무 많아서..
		// logback.xml logger level error 추가함.
		
		return "recruitTiles";
	}	
	
	// 채용공고 지역 - 회사의 주소 지역으로 수정하는 메서드.
	private void editRecrLocal() {
		List<RecruitVo> recrList = recrService.getAllRecr();
		for(int i=0; i < recrList.size(); i++){
			RecruitVo rVo = recrList.get(i);
			
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			rVo.setJob_local(cVo.getAddr1().substring(0, 2));
			
			recrService.updateRecr(rVo);
		}
		
		logger.debug("전체 채용공고 local 수정.");
	}

	// @rRList1 ajax 로직 처리 메서드.
	@RequestMapping("/rRList1AjaxHtml")
	public String rRList1AjaxHtml(HttpSession session, Model model) throws ParseException {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// 조회한 항목(마지막으로 조회한 채용공고) model에 넣기.
		// 여기서 가장 큰 수를 구한다음 조회, 조회 하지말고 -> 'recrService.getLastViewRecr'
		// 조회한 채용공고가 없는 경우도 처리해줘야 함.
		// 변수 첫 자는 소문자로.
		RecruitVo lVRVo = recrService.getLastViewRecr(mVo.getMem_id());
//		model.addAttribute("lVRVo", lVRVo);
		
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
			
			// 마지막 조회/스크랩 채용공고를 리스트의 맨앞으로 옮기자. lVRVo가 리스트에 없을수도 있음.
			// 있을 땐 인덱스 저장해놓기. (lVIdx)
			boolean lVRVo_flag = false;
			int tempIdx = 0;
			int lVIdx = 0;
			
			for(RecruitVo rVo : rRList1){
				if(rVo.getRecruit_code().equals(lVRVo.getRecruit_code())){
					lVRVo_flag = true;
					lVIdx = tempIdx;
					break;
				}
				
				tempIdx++;
			}
			
			// list.add(index, element); 이용. 여기 만들다 말았었군.
			if(lVRVo_flag == false){
				// 없을 땐 lVRVo를 0번에 넣고 마지막 항목을 지움.
				rRList1.add(0, lVRVo);
			}else{
				// 있을 땐 add([lVIdx])하고 remove([lVIdx+1]) <- 테스트 해보기.
				rRList1.add(0, rRList1.get(lVIdx));
				rRList1.remove(lVIdx+1);
			}
			
			// RRList1.size()가 RRList1Size가 될때까지 마지막 항목 지움.
			while(rRList1.size() > RRList1Size){
				rRList1.remove(rRList1.size()-1);
			}
			
			List<String> corpImgList1 = new ArrayList<>();
			List<String> corpNmList1 = new ArrayList<>();
			List<String> timeList1 = new ArrayList<>();
			
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
				
				// start_date -> '19/04/24 16:20'.
				// start_date와 new Date() - 차이 구함 (time_diff)
				String start_date = rVo.getStart_date();
				
				// 문자열을 날짜로 바꾸려면 sdf.parse([문자열])
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
				Date start = sdf.parse(start_date);
				Date now = new Date();
				
				// getTime()으로 얻은 long값이 int의 범위를 넘어가므로 먼저 분으로 고친다음
				// int로 변환을 하자.
				long temp_time = now.getTime() - start.getTime();
				
				int time_diff = (int) (temp_time / (60*1000));
				
				// time_diff < 2 : 방금 / time_diff < 60 : x분 
				// time_diff < 1440 : x시간 / time_diff < 43200 : x일 
				// else : x달
				if(time_diff < 2){
					timeList1.add("방금");
				}else if(time_diff < 60){
					timeList1.add(time_diff + "분");
				}else if(time_diff < 1440){
					timeList1.add(time_diff/60 + "시간");
				}else if(time_diff < 43200){
					timeList1.add(time_diff/(60*24) + "일");
				}else{
					timeList1.add(time_diff/(60*24*30) + "달");
				}
			}
			
			model.addAttribute("corpImgList1", corpImgList1);		
			model.addAttribute("corpNmList1", corpNmList1);			
			model.addAttribute("scrapList1", scrapList1);			
			model.addAttribute("timeList1", timeList1);			
		}
		
		model.addAttribute("rRList1", rRList1);		

		return "recruit/rRList1AjaxHtml";
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
	
	// 임시 채용공고 등록
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
			
			// 수정 필요.
			//recrService.insertRecr(rVo);
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
	
	// 항목(item) insert.
	private void insert_item(){
//		String[] arr_job = new String[]{"소프트웨어개발", "백엔드", "모바일앱개발", "웹마스터", 
//				"데이터베이스", "클라이언트개발", "네트워크구축", "DBMS", "솔루션", "DataMining", 
//				"네트워크보안", "유지보수", "공공기관", "전자상거래", "웹컨텐츠", "웹테스터", 
//				"소프트웨어QA", "리눅스", "안드로이드", "C++", "Java", "HTTP·TCP", "통신", "POS", 
//				"모바일기획", "서버관리", "시스템운영", "Framework", "springboot", "Nodejs", 
//				"알고리즘", ".NET", "웹프로그래밍", "Python", "빅데이터", "머신러닝", "asp", 
//				"Oracle", "MS-SQL", "SM", "SI", "WAS", "jsp", "DBA"};	
//		
//		List<String> jobList = new ArrayList<>();
//		for(String job : arr_job){
//			jobList.add(job);
//		}
//		
//		// jobList 정렬.
//        Collections.sort(jobList, new Comparator() {
//			@Override
//			public int compare(Object o1, Object o2) {
//				return ((String) o1).compareTo((String) o2);
//			}
//        });
//        
//        for(String job_type : jobList){
//        	ItemVo iVo = new ItemVo();
//        	iVo.setItem_code(String.valueOf(itemService.getItemCnt()+1));
//        	iVo.setItem_div("job_type");
//        	iVo.setItem_content(job_type);
//        	
//        	itemService.insertItem(iVo);
//        }
		
		String[] arr_rank = new String[]{"사원", "주임", "대리", "계장", "과장", "차장", 
				"부장", "이사", "상무이사", "전무이사", "부사장", "사장", "부회장", "회장"};
		
		List<String> rankList = new ArrayList<>();
		for(String rank : arr_rank){
			rankList.add(rank);
		}		
		
		for(String job_rank : rankList){
			ItemVo iVo = new ItemVo();
			iVo.setItem_code(String.valueOf(itemService.getItemCnt()+1));
			iVo.setItem_div("job_rank");
			iVo.setItem_content(job_rank);

			itemService.insertItem(iVo);
		}	
		
		String[] arr_emp = new String[]{"정규직", "계약직", "인턴", "파견직", "도급", "프리랜서"};
		
		List<String> empList = new ArrayList<>();
		for(String emp : arr_emp){
			empList.add(emp);
		}	
		
		for(String emp_type : empList){
			ItemVo iVo = new ItemVo();
			iVo.setItem_code(String.valueOf(itemService.getItemCnt()+1));
			iVo.setItem_div("emp_type");
			iVo.setItem_content(emp_type);
			
			itemService.insertItem(iVo);
		}		
	}

	// @검색결과 저장 후 채용공고 검색 페이지 요청. -> 검색내역 저장은 Search_logController로 이동.
	@RequestMapping("/recrSearch")
	public String recrSearch(HttpSession session, Model model) throws ParseException{
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// 회원이 검색한 값 가져오기. (getLSLog - get last search_log)
		// 검색 내역이 없는 경우 새로 sVo 만들고 insert하기.
		Search_logVo lSLog = sLogService.getLSLog(mVo.getMem_id());
		
		if(lSLog == null){
			lSLog = new Search_logVo();
			lSLog.setSearch_code(String.valueOf(sLogService.getAllCnt()+1));
			lSLog.setSearch_local("전국");
			lSLog.setSearch_save("1");
			lSLog.setSearch_word("전체");
			lSLog.setUser_id(mVo.getMem_id());
		}
		
		model.addAttribute("lSLog", lSLog);
		
		// 채용공고 리스트 넘기기. <- corpImgList / corpNmList도 추가해야됨.
		// 검색어를 통한 결과 리스트를 넘기기. search_word가 '전체'이면 전체 채용공고 리스트 넘기기.
		List<RecruitVo> recrList = new ArrayList<>();
		
		// 이어서. 수정
		if(lSLog.getSearch_word().equals("전체") && lSLog.getSearch_local().equals("전국")){
			recrList = recrService.getAllRecr();
		}else if(lSLog.getSearch_local().equals("전국")){
			recrList = recrService.searchRecrListByCorp_name(lSLog.getSearch_word());
		}else if(lSLog.getSearch_word().equals("전체")){
			recrList = recrService.searchRecrListByJob_local(lSLog.getSearch_local());
		}else{
			List<RecruitVo> tempList = recrService.searchRecrListByCorp_name(lSLog.getSearch_word());			
			
			for(int i=0; i < tempList.size(); i++){
				RecruitVo rVo = tempList.get(i);
				
				if(rVo.getJob_local().equals(lSLog.getSearch_local())){
					recrList.add(rVo);
				}
			}
		}
		
		List<String> corpImgList = new ArrayList<>();
		List<String> corpNmList = new ArrayList<>();
		List<String> timeList = new ArrayList<>();
		
		for(int i=0; i < recrList.size(); i++){
			RecruitVo rVo = recrList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			corpImgList.add(cVo.getLogo_path());
			corpNmList.add(cVo.getCorp_name());
			
			String start_date = rVo.getStart_date();
			
			// 문자열을 날짜로 바꾸려면 sdf.parse([문자열])
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				timeList.add("방금");
			}else if(time_diff < 60){
				timeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				timeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				timeList.add(time_diff/(60*24) + "일");
			}else{
				timeList.add(time_diff/(60*24*30) + "달");
			}
		}
		
		model.addAttribute("recrList", recrList);
		model.addAttribute("corpImgList", corpImgList);
		model.addAttribute("corpNmList", corpNmList);
		model.addAttribute("timeList", timeList);
		
		// 저장한 검색어 리스트 (saveList) 넘기기.
		Search_logVo sVo = new Search_logVo();

		sVo.setUser_id(mVo.getMem_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = sLogService.getSaveList(sVo);
		
		model.addAttribute("saveList", saveList);
		
		// 최근 검색어 리스트 (sList) 넘기기.
		List<Search_logVo> sList = sLogService.getSList(mVo.getMem_id());
		model.addAttribute("sList", sList);		
		
		return "recrSearchTiles";
	}	
	
	// @채용공고 상세화면.
	@RequestMapping(path="/recr_detail", method=RequestMethod.POST)
	public String recr_detail(String recruit_code, HttpSession session, String req_page, 
			String msg_flag, Model model){
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// 회원 정보를 가져와서 채용공고저장에 마지막으로 조회한 채용공고 저장. 마지막 채용공고를 따로 
		// 설정하지는 않고 회원의 채용공고저장 리스트에서 save_code가 가장 큰 데이터를 확인하자.
		Save_recruitVo sVo = new Save_recruitVo();
		sVo.setRecruit_code(recruit_code);
		sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
		sVo.setSave_flag("f");
		
		// recr_app값을 가져와야 함.
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id(mVo.getMem_id());
		tempSVo.setRecruit_code(recruit_code);
		
		Save_recruitVo checkSVo = srecrService.getLastSrecr(tempSVo);
		String recr_app = "";
		
		if(checkSVo == null){
			recr_app = "f";
		}else{
			recr_app = checkSVo.getRecr_app();
		}
		
		sVo.setRecr_app(recr_app);
		
		// 지원여부 넘기기.
		model.addAttribute("recr_app", recr_app);
		
		// 스크랩여부.
		tempSVo = new Save_recruitVo();
		
		tempSVo.setUser_id(mVo.getMem_id());
		tempSVo.setSave_flag("t");
		
		List<Save_recruitVo> sSrecrlist = srecrService.getSSrecrList(tempSVo);
		String scrap_flag = "f";
		
		// 특정 유저가 스크랩한 채용공고 리스트에서 recruit_code와 일치하는 게 있으면 t.
		for(int i=0; i < sSrecrlist.size(); i++){
			tempSVo = sSrecrlist.get(i);
			
			if(tempSVo.getRecruit_code().equals(recruit_code)){
				scrap_flag = "t";
				break;
			}
		}
		
		model.addAttribute("scrap_flag", scrap_flag);
		
		sVo.setUser_id(mVo.getMem_id());
		srecrService.insertSrecr(sVo);
		
		RecruitVo recr = recrService.getRecr(recruit_code);
		CorporationVo corp = corpService.select_corpInfo(recr.getCorp_id());
		model.addAttribute("recr", recr);
		model.addAttribute("corp", corp);
		
		// recruit에서 넘어온 req_page 넣기.
		model.addAttribute("req_page", req_page);
		
		model.addAttribute("msg_flag", msg_flag);
		
		return "recr_detailTiles";
	}
	
	// @채용공고 상세화면 method - get
	@RequestMapping(path="/recr_detail", method=RequestMethod.GET)
	public String recr_detail(String recruit_code, String req_page, HttpSession session, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		Save_recruitVo sVo = new Save_recruitVo();
		sVo.setRecruit_code(recruit_code);
		sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
		sVo.setSave_flag("f");
		
		// recr_app값을 가져와야 함.
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id(mVo.getMem_id());
		tempSVo.setRecruit_code(recruit_code);
		
		Save_recruitVo checkSVo = srecrService.getLastSrecr(tempSVo);
		String recr_app = "";
		
		if(checkSVo == null){
			recr_app = "f";
		}else{
			recr_app = checkSVo.getRecr_app();
		}
		
		sVo.setRecr_app(recr_app);
		
		// 지원여부 넘기기.
		model.addAttribute("recr_app", recr_app);
		
		// 스크랩여부.
		tempSVo = new Save_recruitVo();
		
		tempSVo.setUser_id(mVo.getMem_id());
		tempSVo.setSave_flag("t");		
		
		List<Save_recruitVo> sSrecrlist = srecrService.getSSrecrList(tempSVo);
		String scrap_flag = "f";
		
		// 특정 유저가 스크랩한 채용공고 리스트에서 recruit_code와 일치하는 게 있으면 t.
		for(int i=0; i < sSrecrlist.size(); i++){
			tempSVo = sSrecrlist.get(i);
			
			if(tempSVo.getRecruit_code().equals(recruit_code)){
				scrap_flag = "t";
				break;
			}
		}
		
		model.addAttribute("scrap_flag", scrap_flag);
		
		sVo.setUser_id(mVo.getMem_id());
		srecrService.insertSrecr(sVo);
		
		RecruitVo recr = recrService.getRecr(recruit_code);
		CorporationVo corp = corpService.select_corpInfo(recr.getCorp_id());
		model.addAttribute("recr", recr);
		model.addAttribute("corp", corp);
		
		// 뒤로가기를 할 때 req_page 확인을 위해 model에 넣기.
		model.addAttribute("req_page", req_page);
		
		return "recr_detailTiles";
	}
	
	// @채용공고 올리기 페이지 요청.
	@RequestMapping("/writeRecr")
	public String writeRecr(Model model) {
		// jobList 넘기기.
		List<String> jobList = itemService.getItemList("job_type");
		model.addAttribute("jobList", jobList);
		
		List<String> rankList = itemService.getItemList("job_rank");
		model.addAttribute("rankList", rankList);
		
		List<String> empList = itemService.getItemList("emp_type");
		model.addAttribute("empList", empList);
		
		return "writeRecrTiles";
	}
	
	// @지도 검색 페이지 요청.
	@RequestMapping("/map")
	public String map(HttpSession session, HttpServletRequest req, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		// mem_division이 2(회사회원)이면 redirect:/recruit하고 msg로 alert.
		if(mVo.getMem_division().equals("2")){
			String msg_flag = "t";
			model.addAttribute("msg_flag", msg_flag);
			
			return "redirect:" + req.getContextPath() + "/recruit";
		}
		
		// 지도 이용에 필요한 일반회원 정보 uVo 넘기기.
		UsersVo uVo = usersService.select_userInfo(mVo.getMem_id());
		model.addAttribute("uVo", uVo);
		
		List<RecruitVo> recrList = recrService.getAllRecr();
		model.addAttribute("recrList", recrList);
		
		// addrList - 회사의 주소, locationList - 회사의 좌표.
		List<String> addrList = new ArrayList<>();
		List<String> locationList = new ArrayList<>();
		for(int i=0; i < recrList.size(); i++){
			RecruitVo rVo = recrList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			addrList.add(cVo.getAddr1());
			locationList.add(cVo.getCorp_location());
		}
		model.addAttribute("addrList", addrList);
		model.addAttribute("locationList", locationList);
		
		// 회사 목록을 넘겨보자.
		List<CorporationVo> corpList = corpService.select_allCorps();
		model.addAttribute("corpList", corpList);
		
		return "mapTiles";
	}
	
	// 채용공고 페이지에서 @RequestMapping으로 void 메서드를 실행시키면 어떻게 되지?
	// attach_file에서 파일 다운로드 할때 void 메서드로 했는데.. 지금은 왜 404에러가 나지?
	// @void 메서드 테스트.
//	@RequestMapping("/test")
//	public void test() {
//		logger.debug("void test !!");
//	}
	
	// @ajax로 지도 검색 페이지의 회사와의 거리 그리기.
	@RequestMapping("/mapAjaxHtml")
	public String mapAjaxHtml(String result, String width_value, HttpSession session, Model model) throws ParseException {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		List<CorporationVo> corpList = corpService.select_allCorps();
		List<RecruitVo> recrList = recrService.getAllRecr();
		
		// 설정한 범위 내에 있는 회사(채용공고) - corpList2
		List<RecruitVo> recrList2 = new ArrayList<>();
		
		// result - 회사1:신세계,거리:702.9181827114676/반경:756.8619424973508
		String[] arr_result = result.split("/");
		int recr_num = arr_result.length - 1;
		
		List<String> corpNmList = new ArrayList<>();
		List<String> corpImgList = new ArrayList<>();
		List<String> corpDList = new ArrayList<>();	
		List<String> timeList = new ArrayList<>();	
		
		// 스크랩 여부 리스트.
		List<String> scrapList = new ArrayList<>();
		List<Save_recruitVo> uSRList = srecrService.getUserSrecrList(mVo.getMem_id());
				
		for(int i=0; i < recr_num; i++){
			String data = arr_result[i];
			String recruit_code = data.split(",")[0].split(":")[1];
			String str_corpD = data.split(",")[1].split(":")[1];

			RecruitVo rVo = recrService.getRecr(recruit_code);
			recrList2.add(rVo);
			
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			corpImgList.add(cVo.getLogo_path());
			corpNmList.add(cVo.getCorp_name());
			
			boolean scrapCheck_flag = false;
			for(Save_recruitVo scrapCheckSVo : uSRList){
				if(scrapCheckSVo.getRecruit_code().equals(rVo.getRecruit_code()) 
						&& scrapCheckSVo.getSave_flag().equals("t")){
					scrapCheck_flag = true;
					scrapList.add("t");
					break;
				}
			}
			
			if(scrapCheck_flag == false){
				scrapList.add("f");
			}			
			
			String start_date = rVo.getStart_date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				timeList.add("방금");
			}else if(time_diff < 60){
				timeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				timeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				timeList.add(time_diff/(60*24) + "일");
			}else{
				timeList.add(time_diff/(60*24*30) + "달");
			}			
		}
		
		model.addAttribute("recrList2", recrList2);
		model.addAttribute("corpImgList", corpImgList);
		model.addAttribute("corpNmList", corpNmList);
		model.addAttribute("scrapList", scrapList);
		model.addAttribute("timeList", timeList);

		// 슬라이드 출력할 박스 width 넘기기.
		model.addAttribute("width_value", width_value);

		return "recruit/mapAjaxHtml";
	}
	
	// @채용공고 지원
	@RequestMapping("/recr_app")
	public String recr_app(String recruit_code, String scrap_flag, HttpSession session, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setUser_id(mVo.getMem_id());
		tempSVo.setRecruit_code(recruit_code);
		
		Save_recruitVo sVo = srecrService.getLastSrecr(tempSVo);
		String recr_app = "";
		
		// 채용공고의 지원자 수(app_count) 수정하기.
		RecruitVo rVo = recrService.getRecr(recruit_code);
		String app_count = rVo.getApp_count();
		
		// recr_app값이 t면 f로, f면 t로 수정.
		if(sVo.getRecr_app().equals("t")){
			recr_app = "f";
			
			app_count = String.valueOf(Integer.valueOf(app_count) - 1);
		}else{
			recr_app = "t";
			
			app_count = String.valueOf(Integer.valueOf(app_count) + 1);
		}
		
		sVo.setSave_flag(scrap_flag);
		sVo.setRecr_app(recr_app);
		rVo.setApp_count(app_count);
		
		// 스크랩 여부. 받은 것 다시 넘겨줘야 됨.
		model.addAttribute("scrap_flag", scrap_flag);
		
		srecrService.updateSrecr(sVo);
		recrService.updateRecr(rVo);
		
		// 지원여부 넘기기.
		model.addAttribute("recr_app", recr_app);
		
		RecruitVo recr = recrService.getRecr(recruit_code);
		CorporationVo corp = corpService.select_corpInfo(recr.getCorp_id());
		model.addAttribute("recr", recr);
		model.addAttribute("corp", corp);
		
		// apply_recruit insert
		Apply_recruitVo aVo = new Apply_recruitVo();
		aVo.setRecruit_code(recruit_code);
		aVo.setUser_id(mVo.getMem_id());
		
		appService.insertApp(aVo);

		return "recr_detailTiles";
	}
	
	// @회사 드롭다운 출력.
	@RequestMapping("/comDropdown")
	public String comDropdown(String corp_name, Model model) {
		// corp_name으로 회사 검색후 corpList 넘기기.
		List<CorporationVo> corpList = corpService.searchCorp(corp_name);
		
		List<String> fmtNmList = new ArrayList<>();
		
		// corp_name이 영문인지 판별.
		boolean alphabet_flag = true;
		
		char[] arr_char = corp_name.toUpperCase().toCharArray();

		for(char letter : arr_char){
			int int_letter = (int) letter;
			
			if(! (int_letter >= 65 && int_letter <= 90)){
				alphabet_flag = false;
				break;
			}
		}
		
		if(alphabet_flag == true){
			for(CorporationVo cVo : corpList){
				String name = cVo.getCorp_name();
				String upperName = name.toUpperCase();
				
				String upper_corp_name = corp_name.toUpperCase();
				
				int start_idx = upperName.indexOf(upper_corp_name);
				
				String str_front = name.substring(0, start_idx);
				String search_word = name.substring(start_idx, start_idx + corp_name.length());
				String str_back = name.substring(start_idx + corp_name.length(), name.length());
				
				String fmtNm = str_front + "<strong>" + search_word + "</strong>" + str_back;
				
				fmtNmList.add(fmtNm);
				// 극한의 로직충..ㅜㅜ
			}
		}else{
			for(CorporationVo cVo : corpList){
				String name = cVo.getCorp_name();
				String fmtNm = name.replace(corp_name, "<strong>"+corp_name+"</strong>");
				
				fmtNmList.add(fmtNm);
			}
		}
		
		model.addAttribute("fmtNmList", fmtNmList);
		model.addAttribute("corpList", corpList);

		return "/recruit/comDropdown";
	}
	
	// @채용공고 등록.
	@RequestMapping("/insertRecr")
	public String insertRecr(String corp_id, String emp_type, String recruit_period, String job_rank,
			String job_type, String personnel, String recruit_contents, String recruit_title, 
			String app_type, HttpServletRequest req, Model model) {
		RecruitVo rVo = new RecruitVo();
		rVo.setApp_count("0");
		
		// 임시 -> '간편지원' -> 프로필 pdf 전송
		rVo.setApp_type(app_type);
		rVo.setCorp_id(corp_id);
		rVo.setEmp_type(emp_type);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DAY_OF_MONTH, Integer.valueOf(recruit_period));
		String end_date = sdf.format(cal.getTime());
		rVo.setEnd_date(end_date);
		
		CorporationVo cVo = corpService.select_corpInfo(corp_id);
		rVo.setJob_local(cVo.getAddr1().substring(0, 2));
		rVo.setJob_rank(job_rank);
		rVo.setJob_type(job_type);
		rVo.setPersonnel(personnel);
		
		String recruit_code = String.valueOf(recrService.getRecrCnt()+1);
		rVo.setRecruit_code(recruit_code);
		rVo.setRecruit_contents(recruit_contents);
		rVo.setRecruit_title(recruit_title);
		
		recrService.insertRecr(rVo);
		
		model.addAttribute("msg_flag", "t2");
		
		// 채용공고 insert -> 알림 insert
		// recruit_code, search_word, userList
		List<String> wordList = sLogService.getWordList();
		
		List<String> alarmWordList = new ArrayList<>();
		String corp_name = cVo.getCorp_name();
		
		for(String word : wordList){
			if(corp_name.toUpperCase().contains(word.toUpperCase())
					|| recruit_title.toUpperCase().contains(word.toUpperCase())){
				alarmWordList.add(word);
			}
		}
		
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setAlarm_check("0");
		alarmInfo.setAlarm_separate("08");
		alarmInfo.setDivision("34");
		alarmInfo.setRef_code(recruit_code);
		alarmInfo.setSend_id(corp_id);

		Map<String, List<String>> resultMap = new HashMap<>();
		
		for(String alarmWord : alarmWordList){
			List<String> userList = sLogService.getAlarmUserList(alarmWord);
			
			for(int i=0; i<userList.size(); i++){
				alarmInfo.setMem_id(userList.get(i));
				alarmService.insert_alarmInfo(alarmInfo);
			}
		}
		
		logger.debug("map? : {}", resultMap.toString());
		
		// tiles로 바로 가면 안되고 /recruit로 redirect 해야지.
		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	// @채용공고 신고.
	@RequestMapping("/reportRecr")
	public String reportRecr(HttpServletRequest req, HttpSession session, String report_contents,
			String recruit_code, String req_page, Model model) {
		ReportVo rVo = new ReportVo();
		rVo.setDivision("34"); // recruit
		
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		rVo.setMem_id(mVo.getMem_id());
		rVo.setRef_code(recruit_code);
		rVo.setReport_contents(report_contents);
		logger.debug("recruit_code? : {}", recruit_code);
		
		reportService.insert_reportInfo(rVo);
		
		// t - "정상적으로 신고접수 되었습니다."
		model.addAttribute("msg_flag", "t");
		
		model.addAttribute("recruit_code", recruit_code);
		model.addAttribute("req_page", req_page);
		
		return "redirect:" + req.getContextPath() + "/recr_detail";
	}
	
	
	

	
	
}




