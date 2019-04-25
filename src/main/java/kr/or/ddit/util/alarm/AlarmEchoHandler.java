package kr.or.ddit.util.alarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.member.model.MemberVo;

public class AlarmEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> memberSessions = new HashMap<>();

	private Logger logger = LoggerFactory.getLogger(AlarmEchoHandler.class);
	
	@Resource(name="alarmService")
	private IAlarmService alarm;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map<String, Object> httpSession = session.getAttributes();
		MemberVo loginMember = (MemberVo) httpSession.get("SESSION_MEMBERVO");
		
		String mem_id = loginMember.getMem_id();
		
		int alarmcnt = alarm.select_newAlarmCount(mem_id);
		session.sendMessage(new TextMessage(alarmcnt + ""));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
}
