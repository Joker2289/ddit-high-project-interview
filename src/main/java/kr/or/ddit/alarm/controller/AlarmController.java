package kr.or.ddit.alarm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class AlarmController {
	
	private Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@RequestMapping(path={"/alarm"}, method=RequestMethod.GET)
	public String alarmHome(Model model, HttpServletRequest request){
		
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
		
		return "alarmTiles";
	}
	
	@RequestMapping(path={"/nextrecentalarm"}, method=RequestMethod.POST)
	public String nextRecentAlarm(String pageNum, String alarm_code, HttpServletRequest request, Model model){
		
		PaginationVo paginationVo = new PaginationVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		paginationVo.setPage(Integer.parseInt(pageNum));
		paginationVo.setPageSize(5);
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setCriteria_code(alarm_code);
		
		List<AlarmVo> nextRecentAlarm = alarmService.select_nextRecentAlarm(paginationVo);
		model.addAttribute("nextRecentAlarm", nextRecentAlarm);
		
		return "alarm/moreRecentAlarm";
	}
	
	@RequestMapping(path={"/nextpreviousalarm"}, method=RequestMethod.POST)
	public String nextPreviousAlarm(String pageNum, String alarm_code, HttpServletRequest request, Model model){
		
		PaginationVo paginationVo = new PaginationVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		paginationVo.setPage(Integer.parseInt(pageNum));
		paginationVo.setPageSize(5);
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setCriteria_code(alarm_code);
		
		List<AlarmVo> nextPreviousAlarm = alarmService.select_nextPreviousAlarm(paginationVo);
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
