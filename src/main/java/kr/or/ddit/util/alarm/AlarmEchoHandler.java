package kr.or.ddit.util.alarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.member.model.MemberVo;

public class AlarmEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> memberSessions = new HashMap<>();

	private Logger logger = LoggerFactory.getLogger(AlarmEchoHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.debug("afterConnectionEstablished : {}", session);
		sessions.add(session);
		String send_id = getId(session);
		memberSessions.put(send_id, session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String send_id = getId(session);
//		for(WebSocketSession s : sessions){
//			s.sendMessage(new TextMessage(send_id + ": " + message.getPayload()));
//		}
		
		//cmd, 발신자, 수신자, 참조코드  (cmd : postgood, postcomment, commentgood, recomconnect, receiveconnect, follow, apply, recruit)
		String msg = message.getPayload();
		
		if(StringUtils.isNotEmpty(msg)){
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 4){
				String cmd 		= strs[0];
				String sender 	= strs[1];
				String receiver = strs[2];
				String ref_code = strs[3];
				
				WebSocketSession receiverSession = memberSessions.get(receiver);
				if(receiverSession != null){
					TextMessage tempMsg = new TextMessage(sender);
					receiverSession.sendMessage(tempMsg);
				}
			}
		}
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVo loginMember = (MemberVo) httpSession.get("SESSION_MEMBERVO");
		
		if(loginMember == null){
			return session.getId(); 
		} else {
			return loginMember.getMem_id();
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
	
}
