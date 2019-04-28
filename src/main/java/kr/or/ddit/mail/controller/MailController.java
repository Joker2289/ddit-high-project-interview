package kr.or.ddit.mail.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.chat_contents.service.IChat_contentsService;
import kr.or.ddit.chat_member.service.IChat_memberService;
import kr.or.ddit.chatroom.model.ChatroomVo;
import kr.or.ddit.chatroom.service.IChatroomService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;

@Controller
public class MailController{
	
	private Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Resource(name="personalService")
	IPersonal_connectionService personalService;
	
	@Resource(name="chatroomService")
	IChatroomService chatroomService;
	
	@Resource(name="chat_memberService")
	IChat_memberService chat_memberService;
	
	@Resource(name="chat_contentsService")
	IChat_contentsService chat_contentsService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;	

	@RequestMapping(path={"/mailHome"})
	public String mailHomeView(Model model, HttpServletRequest req) throws ParseException{
		MemberVo memberVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		List<Map<String, String>> userChatroomsMap = chatroomService.select_userChatrooms(memberVo.getMem_id());
		
		String chat_code = (String) req.getSession().getAttribute("chat_code");
		if (chat_code == null) {
			
			if(userChatroomsMap.size() > 0) {
				chat_code = String.valueOf(userChatroomsMap.get(0).get("CHAT_CODE"));
				model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_code));
			}
		}else{
			model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_code));
		}
		
		model.addAttribute("userChatroomsMap",userChatroomsMap);
		
		/////////////////////////////// newList
		
		// 광고 부분 -> 신규 채용공고 (newList)
		List<RecruitVo> newList = recrService.getNewList();
		
		// newList size : 7. index 6 -> index 0에 add.
		newList.add(0, newList.get(6));
		
		List<String> newImgList = new ArrayList<>();
		List<String> newNmList = new ArrayList<>();
		List<String> newTimeList = new ArrayList<>();
		
		for(int i=0; i < newList.size(); i++){
			RecruitVo rVo = newList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			newImgList.add(cVo.getLogo_path());
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
		model.addAttribute("newNmList", newNmList);
		model.addAttribute("newTimeList", newTimeList);
		
		/////////////////////////////// newList		
		
		return "mailTiles";
	}
	
	@RequestMapping(path={"/produceRoomView"})
	public String produceRoomView(HttpSession session, Model model){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		model.addAttribute("usersVoList",personalService.select_connections(memberVo));
		
		return "/mail/produceRoom";
	}
	
	@RequestMapping(path={"/chatRoomMove"})
	public String chatRoomMove(Model model, String chat_code, HttpServletRequest req){
		req.getSession().setAttribute("chat_code", chat_code);
		
		return "redirect:/mailHome";
	}
	
	@RequestMapping(path={"/serverRecive"})
	public String serverRecive(Model model, String chat_code){
		model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_code));
		return "/mail/chatContents";
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
