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
import kr.or.ddit.chat_member.model.Chat_memberVo;
import kr.or.ddit.chat_member.service.IChat_memberService;
import kr.or.ddit.member.model.MemberVo;
public class MailWebsocket extends TextWebSocketHandler{
	
	@Resource(name="chat_contentsService")
	IChat_contentsService chat_contentsService;
	
	@Resource(name="chat_memberService")
	IChat_memberService chat_memberService;
	
	private Logger logger = LoggerFactory.getLogger(MailWebsocket.class);	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); // 전체 메일 보낼때
	private Map<String, WebSocketSession> idList = new HashMap<String,WebSocketSession>();
	
	
	// 서버와 연결끊겼을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String,Object> map = session.getAttributes();
		MemberVo memberVo = (MemberVo) map.get("SESSION_MEMBERVO");
		
		idList.remove(memberVo.getMem_id());
		sessionList.remove(session);
	}

	// 서버와 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String,Object> map = session.getAttributes();
		MemberVo memberVo = (MemberVo) map.get("SESSION_MEMBERVO");
		
		idList.put(memberVo.getMem_id(), session);
		sessionList.add(session);
		
	}

	// 서버가 메세지 받았을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String,Object> map = session.getAttributes();
		MemberVo memberVo = (MemberVo) map.get("SESSION_MEMBERVO");
		String mychat_code = message.getPayload().toString().split("▣")[0];
		
		Chat_contentsVo chat_contentsVo = new Chat_contentsVo();
		chat_contentsVo.setChat_code(mychat_code);
		chat_contentsVo.setMem_id(memberVo.getMem_id());
		
		List<Chat_memberVo> roomMemberList = chat_memberService.select_chatMember(mychat_code);
		if (message.getPayload().toString().split("▣")[2].equals("exit")){
			
			String name = chat_contentsService.select_findName(memberVo.getMem_id());
			chat_contentsVo.setMem_id(memberVo.getMem_id());
			chat_contentsVo.setChat_content(name +"▣"+"exit"); 
			chat_contentsService.insert_chatcontets(chat_contentsVo);
		}else if(!(message.getPayload().toString().split("▣")[2].equals("image") || 
					message.getPayload().toString().split("▣")[2].equals("file"))){
			
			chat_contentsVo.setChat_content(message.getPayload().toString().split("▣")[1]); 
			chat_contentsService.insert_chatcontets(chat_contentsVo);
			
		}
		
		
		for (Chat_memberVo chat_memberVo : roomMemberList) {
			if(idList.get(chat_memberVo.getMem_id()) != null) {
				if(message.getPayload().toString().split("▣")[2].equals("room")) {
					idList.get(chat_memberVo.getMem_id()).sendMessage(new TextMessage("room"));	
				}else {
					idList.get(chat_memberVo.getMem_id()).sendMessage(new TextMessage("chat"));
				}
			}
		}
		
		
		
	}

	
	
}
