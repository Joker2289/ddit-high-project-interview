package kr.or.ddit.mail.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.chat_contents.service.IChat_contentsService;
import kr.or.ddit.chat_member.service.IChat_memberService;
import kr.or.ddit.chatroom.model.ChatroomVo;
import kr.or.ddit.chatroom.service.IChatroomService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;

@Controller
public class MailController{
	
	@Resource(name="personalService")
	IPersonal_connectionService personalService;
	
	@Resource(name="chatroomService")
	IChatroomService chatroomService;
	
	@Resource(name="chat_memberService")
	IChat_memberService chat_memberService;
	
	@Resource(name="chat_contentsService")
	IChat_contentsService chat_contentsService;

	@RequestMapping(path={"/mailHome"})
	public String mailHomeView(HttpSession session, Model model){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		model.addAttribute("userChatroomsMap",chatroomService.select_userChatrooms(memberVo.getMem_id()));
		
		return "mailTiles";
	}
	
	@RequestMapping(path={"/produceRoomView"})
	public String produceRoomView(HttpSession session, Model model){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		model.addAttribute("usersVoList",personalService.select_connections(memberVo));
		
		return "/mail/produceRoom";
	}
	
	@RequestMapping(path={"/insertChatRoom"})
	public String insertChatRoom(HttpSession session, String[] chat_member, String chat_name, String chat_content){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		ChatroomVo chatroomVo = new ChatroomVo(); 
		chatroomVo.setChat_name(chat_name);
		chatroomVo.setMem_id(memberVo.getMem_id());
		
		chatroomService.insert_chatroom(chatroomVo, chat_member,chat_content);
		
		return "redirect:/mailHome";
	}
	
	
}
