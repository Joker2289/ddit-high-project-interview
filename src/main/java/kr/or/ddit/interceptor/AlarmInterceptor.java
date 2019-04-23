package kr.or.ddit.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.member.model.MemberVo;

public class AlarmInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LoggerFactory.getLogger(AlarmInterceptor.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		AlarmVo alarm = new AlarmVo();
		alarm.setMem_id(memberInfo.getMem_id());
		alarm.setAlarm_check("01");
		
		alarmService.update_alarmStatus(alarm);
		//context-interceptor에 등록 필요(url - /alarm)
	}

}
