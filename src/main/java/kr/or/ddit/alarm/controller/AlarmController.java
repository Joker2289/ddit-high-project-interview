package kr.or.ddit.alarm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class AlarmController {
	
	private Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@RequestMapping(path={"/alarm"}, method=RequestMethod.GET)
	public String alarmHome(Model model, HttpServletRequest request) throws ParseException{
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		PaginationVo paginationVo = new PaginationVo(1, 5);
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		//새 알림 갯수 조회
		int newAlarmCount = alarmService.select_newAlarmCount(memberInfo.getMem_id());
		if(newAlarmCount == 0){
			model.addAttribute("newAlarmCount", "no");
		} else {
			model.addAttribute("newAlarmCount", newAlarmCount+"");
		}
		
		
		//최근 알림 조회
		List<AlarmVo> recentList = alarmService.select_recentAlarmList(paginationVo);
		model.addAttribute("recentList", recentList);
		
		//최근 알림 갯수 조회
		int recentCount = alarmService.select_recentCount(memberInfo.getMem_id());
		
		if(recentCount == 0){
			model.addAttribute("recentCount", "0");
		} else {
			model.addAttribute("recentCount", recentCount);
		}
		

		//이전 알림 조회
		List<AlarmVo> previousList = alarmService.select_previousAlarmList(paginationVo);
		model.addAttribute("previousList", previousList);
		
		int previousCount = alarmService.select_previousCount(memberInfo.getMem_id());
		if(previousCount == 0){
			model.addAttribute("previousCount", "0");
		} else {
			model.addAttribute("previousCount", previousCount);
		}
		
		/////////////////////////////// newList
		
		// 광고 부분 -> 신규 채용공고 (newList)
		List<RecruitVo> newList = recrService.getNewList();
		
		// newList size : 7. index 6 -> index 0에 add.
		newList.add(0, newList.get(6));
		
		List<String> newImgList = new ArrayList<>();
		List<String> newIdList = new ArrayList<>();
		List<String> newNmList = new ArrayList<>();
		List<String> newTimeList = new ArrayList<>();
		
		for(int i=0; i < newList.size(); i++){
			RecruitVo rVo = newList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			newImgList.add(cVo.getLogo_path());
			newIdList.add(cVo.getCorp_id());
			newNmList.add(cVo.getCorp_name());
			
			String start_date = rVo.getStart_date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				newTimeList.add("방금");
			}else if(time_diff < 60){
				newTimeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				newTimeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				newTimeList.add(time_diff/(60*24) + "일");
			}else{
				newTimeList.add(time_diff/(60*24*30) + "달");
			}				
		}		
		
		model.addAttribute("newList", newList);
		model.addAttribute("newImgList", newImgList);
		model.addAttribute("newIdList", newIdList);
		model.addAttribute("newNmList", newNmList);
		model.addAttribute("newTimeList", newTimeList);
		
		/////////////////////////////// newList		
		
		return "alarmTiles";
	}
	
	@RequestMapping(path={"/nextrecentalarm"}, method=RequestMethod.POST)
	public String nextRecentAlarm(@RequestParam String pageNum, @RequestParam String alarm_code, HttpServletRequest request, Model model){
		
		logger.debug("pageNum : {}, alarm_code : {}", pageNum, alarm_code);
		
		PaginationVo paginationVo = new PaginationVo(); 
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		paginationVo.setPage(Integer.parseInt(pageNum));
		paginationVo.setPageSize(5);
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setCriteria_code(alarm_code);
		
		List<AlarmVo> nextRecentAlarm = alarmService.select_nextRecentAlarm(paginationVo);
		int recentCount = alarmService.select_recentCount(memberInfo.getMem_id());		
		
		model.addAttribute("recentCount", recentCount);
		model.addAttribute("nextRecentAlarm", nextRecentAlarm);
		
		return "alarm/moreRecentAlarm";
	}
	
	@RequestMapping(path={"/nextpreviousalarm"}, method=RequestMethod.POST)
	public String nextPreviousAlarm(@RequestParam String pageNum, @RequestParam String alarm_code, HttpServletRequest request, Model model){
		
		PaginationVo paginationVo = new PaginationVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		paginationVo.setPage(Integer.parseInt(pageNum));
		paginationVo.setPageSize(5);
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setCriteria_code(alarm_code);
		
		List<AlarmVo> nextPreviousAlarm = alarmService.select_nextPreviousAlarm(paginationVo);
		int previousCount = alarmService.select_previousCount(memberInfo.getMem_id());
		
		model.addAttribute("previousCount", previousCount);
		model.addAttribute("nextPreviousAlarm", nextPreviousAlarm);
		
		return "alarm/morePreviousAlarm";
	}
	
	@RequestMapping(path={"/deletealarm"}, method=RequestMethod.POST)
	@ResponseBody
	public String deleteAlarm(String alarm_code){
		
		alarmService.delete_alarmInfo(alarm_code);
		
		return "complate";
	}
	
	//언팔로우는 postController의 unfollow 요청을 활용 (parameter : target_id)
	
	
}
