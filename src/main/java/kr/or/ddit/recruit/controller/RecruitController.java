package kr.or.ddit.recruit.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;


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

	private List<String> img_list;
	private List<String> str_list;
	private List<String> one_list;
	private List<List<String>> com_list;
	
	@RequestMapping("/recruit")
	public String recruit(HttpSession session, String alarm_flag, String search_code, Model model) throws IOException{
		// 크롤링해서 값 넣기 어떻게 했더라. 삼성전자 데이터 있으면 리턴. 일단 비활성화.
//		crawling_company();
		
		List<CorporationVo> corpList = corpService.select_allCorps();
		model.addAttribute("corpList", corpList);
		
		// alarm_flag - 저장한 검색어 제거하기. - search_save를 '1'로 변경.
		if(alarm_flag != null && alarm_flag.equals("t")){
			Search_logVo sVo = search_logService.getSearch_log(search_code);
			sVo.setSearch_save("1");
			
			search_logService.updateSearch_log(sVo);
		}
		
		// 임시로 session에 user값 넣기.
		session.setAttribute("usersVo", usersService.select_userInfo("brown"));
		
		// 저장한 검색어 리스트 넘기기.
		Search_logVo sVo = new Search_logVo();
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		sVo.setUser_id(uVo.getUser_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = search_logService.getSaveList(sVo);
		
		logger.debug("check1");
		model.addAttribute("saveList", saveList);
		
		return "recruit/recruit";
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

	@RequestMapping("/temp_search")
	public String temp_search(HttpServletRequest req, String search_word, String search_local, 
			HttpSession session, Model model){
		// 검색어 DB에 저장하기
		Search_logVo sVo = new Search_logVo();
//		logger.debug("search_local? : {}", search_local);
		sVo.setSearch_word(search_word);
		sVo.setSearch_local(search_local);
		sVo.setSearch_code(String.valueOf(search_logService.getAllCnt()+1));
		sVo.setSearch_save("1");
		
		UsersVo uVo = (UsersVo) session.getAttribute("usersVo");
		sVo.setUser_id(uVo.getUser_id());
		
		search_logService.insertSearch_log(sVo);
		
		return "redirect:"+req.getContextPath()+"/recruit";
	}	
	
	
	

}












