package kr.or.ddit.mail.controller;

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

import kr.or.ddit.chat_contents.model.Chat_contentsVo;
import kr.or.ddit.chat_contents.service.IChat_contentsService;
import kr.or.ddit.member.model.MemberVo;
public class MailWebsocket extends TextWebSocketHandler{
	
	@Resource(name="chat_contentsService")
	IChat_contentsService chat_contentsService;
	
	private Logger logger = LoggerFactory.getLogger(MailWebsocket.class);	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); // 전체 메일 보낼때
	private Map<String, ArrayList<WebSocketSession>> roomList = new HashMap<String, ArrayList<WebSocketSession>>();
	
	
	// 서버와 연결끊겼을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String,Object> map = session.getAttributes();
		String chat_code = (String) map.get("chat_code");
		
		if(chat_code != null){
			if(!(roomList.get(chat_code) == null)) {
				ArrayList<WebSocketSession> list = new ArrayList<WebSocketSession>();
				list.remove(session);
				roomList.put(chat_code, list);
			}
		}
		
		sessionList.remove(session);
	}

	// 서버와 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String,Object> map = session.getAttributes();
		
		if((String) map.get("chat_code") != null){
			String chat_code = (String) map.get("chat_code");
			if(roomList.get(chat_code) == null) {
				ArrayList<WebSocketSession> list = new ArrayList<WebSocketSession>();
				list.add(session);
				roomList.put(chat_code, list);
			}else{
				ArrayList<WebSocketSession> list = roomList.get(chat_code);
				list.add(session);
				roomList.put(chat_code, list);
			}
		}
		
		sessionList.add(session);
		
	}

	// 서버가 메세지 받았을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String,Object> map = session.getAttributes();
		MemberVo memberVo = (MemberVo) map.get("SESSION_MEMBERVO");
		String chat_code = (String) map.get("chat_code");
		
		logger.debug(",jdbcType=VARCHAR  {}",chat_code);
		
		Chat_contentsVo chat_contentsVo = new Chat_contentsVo();
		chat_contentsVo.setChat_code(chat_code);
		chat_contentsVo.setMem_id(memberVo.getMem_id());
		chat_contentsVo.setChat_content(message.getPayload()); 
		
		chat_contentsService.insert_chatcontets(chat_contentsVo);
		
		ArrayList<WebSocketSession> list = roomList.get(chat_code);
		
		for (WebSocketSession sess : list) {
			sess.sendMessage(new TextMessage( memberVo.getMem_id()+ ":" + message.getPayload()));
		}
	}

	
	
}
