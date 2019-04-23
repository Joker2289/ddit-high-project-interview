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
public class AlaramController {
	
	private Logger logger = LoggerFactory.getLogger(AlaramController.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@RequestMapping(path={"/alarm"}, method=RequestMethod.GET)
	public String alarmHome(Model model, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		PaginationVo paginationVo = new PaginationVo(1, 10);
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		//최근 알림 조회
		List<AlarmVo> recentList = alarmService.select_recentAlarmList(paginationVo);
		model.addAttribute("recentList", recentList);
		model.addAttribute("recentCount", recentList.size() + "");
		
		int newAlarmCount = alarmService.select_newAlarmCount(memberInfo.getMem_id());
		
		if(newAlarmCount == 0){
			model.addAttribute("newAlarmCount", "no");
		} else {
			model.addAttribute("newAlarmCount", newAlarmCount+"");
		}
		
		//이전 알림 조회
		List<AlarmVo> previousList = alarmService.select_previousAlarmList(paginationVo);
		model.addAttribute("previousList", previousList);
		model.addAttribute("previousCount", previousList.size() + "");
		
		//알림 확인(읽음) -> 현재까지의 전체 알림을 읽음 표시(언제 처리할지 정해야함)
//		AlarmVo alarmInfo = new AlarmVo();
//		alarmInfo.setAlarm_check("01");
//		alarmInfo.setMem_id(memberInfo.getMem_id());
//		alarmService.update_alarmStatus(alarmInfo);
		
		return "alarmTiles";
	}
	
	@RequestMapping(path={"/deletealarm"}, method=RequestMethod.POST)
	@ResponseBody
	public String deleteAlarm(String alarm_code){
		
		alarmService.delete_alarmInfo(alarm_code);
		
		return "complate";
	}
	
	//언팔로우는 postController의 unfollow 요청을 활용 (parameter : target_id)
}
