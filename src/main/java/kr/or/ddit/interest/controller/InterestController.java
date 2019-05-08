package kr.or.ddit.interest.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.apply_recruit.service.IApply_recruitService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.item.service.IItemService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;

@Controller
public class InterestController {
	private Logger logger = LoggerFactory.getLogger(InterestController.class);
	
	@Resource(name="interestService")
	private IInterestService inteService;
	
	@Resource(name="itemService")
	private IItemService itemService;
	
	@Resource(name="apply_recruitService")
	private IApply_recruitService appService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	// 관심분야 페이지 요청.
	@RequestMapping("/interest")
	public String interest(HttpSession session, Model model){
		List<String> jobList = itemService.getItemList("job_type");
		
		model.addAttribute("jobList", jobList);
		
		// localList
		String[] arr_local = new String[]{"서울", "경기", "인천", "대전", "세종", "충남", "충북", 
				"광주", "전남", "전북", "대구", "경북", "부산", "울산", "경남", "강원", "제주"};
		
		List<String> localList = new ArrayList<>();
		for(String local : arr_local){
			localList.add(local);
		}

		model.addAttribute("localList", localList);	
		
		// empList
		String[] arr_emp = new String[]{"정규직", "계약직", "인턴", "파견직", "도급", "프리랜서"};
		
		List<String> empList = new ArrayList<>();
		for(String emp : arr_emp){
			empList.add(emp);
		}
		
		model.addAttribute("empList", empList);	
		
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");		
		
		// 지원한 채용공고 리스트 (appList) 넘기기.
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setRecr_app("t");
		tempSVo.setUser_id(mVo.getMem_id());
		
		List<Apply_recruitVo> tempList = appService.getAppList(mVo.getMem_id());
		List<RecruitVo> appList = new ArrayList<>();
		List<String> corpImgList_app = new ArrayList<>();
		List<String> corpIdList_app = new ArrayList<>();
		List<String> corpNmList_app = new ArrayList<>();
		
		if(tempList != null){
			for(int i=0; i < tempList.size(); i++){
				String recruit_code = tempList.get(i).getRecruit_code();
				
				appList.add(recrService.getRecr(recruit_code));
				
				RecruitVo rVo = recrService.getRecr(recruit_code);
				
				CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
				
				corpImgList_app.add(cVo.getLogo_path());
				corpIdList_app.add(cVo.getCorp_id());
				corpNmList_app.add(cVo.getCorp_name());				
			}
		}
		
		model.addAttribute("appList", appList);
		model.addAttribute("corpNmList_app", corpNmList_app);
		model.addAttribute("corpImgList_app", corpImgList_app);
		model.addAttribute("corpIdList_app", corpIdList_app);		
		
		return "interestTiles";
	}
	
	// @관심분야 등록.
	@RequestMapping("/insertInte")
	public String insertInte(HttpServletRequest req, String inte_type, String inte_local, String inte_emptype, 
			String inte_size, String change_flag, String tell_content, String job_condition, 
			HttpSession session) {
		logger.debug("inte_type? : {}", inte_type);
		
		// mem_id로 검색되는 관심분야가 있으면 update, 없으면 insert.
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		InterestVo iVo = inteService.getInte(mVo.getMem_id());
		if(iVo != null){
			iVo.setInte_emptype(inte_emptype);
			iVo.setInte_local(inte_local);
			iVo.setInte_size(inte_size);
			iVo.setInte_type(inte_type);
			iVo.setChange_flag(change_flag);
			iVo.setTell_content(tell_content);
			iVo.setJob_condition(job_condition);
			
			inteService.updateInte(iVo);
		}else{
			iVo = new InterestVo();
			iVo.setInte_code(String.valueOf(inteService.getInteCnt()+1));
			
			iVo.setUser_id(mVo.getMem_id());
			
			iVo.setInte_emptype(inte_emptype);
			iVo.setInte_local(inte_local);
			iVo.setInte_size(inte_size);
			iVo.setInte_type(inte_type);
			iVo.setChange_flag(change_flag);
			iVo.setTell_content(tell_content);
			iVo.setJob_condition(job_condition);			
			
			inteService.insertInte(iVo);
		}

		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	

}






