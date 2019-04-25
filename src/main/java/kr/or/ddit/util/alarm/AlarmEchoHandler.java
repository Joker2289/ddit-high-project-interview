package kr.or.ddit.util.alarm;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class AlarmEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
//	Map<String, WebSocketSession> memberSessions = new HashMap<>();

	private Logger logger = LoggerFactory.getLogger(AlarmEchoHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.debug("afterConnectionEstablished : {}", session);
		sessions.add(session);
//		String send_id = getId(session);
//		memberSessions.put(send_id, session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.debug("handleTextMessage : " + session + " : " + message);
		String send_id = getId(session); 
		
		for(WebSocketSession sess : sessions){
			sess.sendMessage(new TextMessage(send_id + " : " + message.getPayload()));
		}
		
		//발신자, 수신자
//		String msg = message.getPayload();
//		
//		if(StringUtils.isNotEmpty(msg)){
//			String[] strs = msg.split(",");
//			if(strs != null && strs.length == 2){
//				String sender 	= strs[0];
//				String receiver = strs[1];
//				
//				WebSocketSession receiverSession = memberSessions.get(receiver);
//				if(receiverSession != null){
//					TextMessage tempMsg = new TextMessage(sender);
//					receiverSession.sendMessage(tempMsg);
//				}
//			}
//		}
	}
	
	private String getId(WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//		MemberVo loginMember = (MemberVo) httpSession.get("SESSION_MEMBERVO");
//		
//		if(loginMember == null){
//			return session.getId(); 
//		} else {
//			return loginMember.getMem_id();
//		}
		
		return "";
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.debug("afterConnectionClosed : {}", session + " : " + status);
	}
	
}
