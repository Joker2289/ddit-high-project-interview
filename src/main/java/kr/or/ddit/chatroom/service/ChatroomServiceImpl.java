package kr.or.ddit.chatroom.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat_contents.dao.IChat_contentsDao;
import kr.or.ddit.chat_contents.model.Chat_contentsVo;
import kr.or.ddit.chat_member.dao.IChat_memberDao;
import kr.or.ddit.chat_member.model.Chat_memberVo;
import kr.or.ddit.chatroom.dao.IChatroomDao;
import kr.or.ddit.chatroom.model.ChatroomVo;

@Service("chatroomService")
public class ChatroomServiceImpl implements IChatroomService{
	
	@Resource(name="chatroomDao")
	private IChatroomDao chatroomDao;
	
	@Resource(name="chat_memberDao")
	private IChat_memberDao chat_memberDao;
	
	@Resource(name="chat_contentsDao")
	private IChat_contentsDao chat_contentsDao;
	
	@Override
	public List<Map<String, String>> select_userChatrooms(String mem_id) {
		return chatroomDao.select_userChatrooms(mem_id);
	}

	@Override
	public int insert_chatroom(ChatroomVo chatroomVo, String[] chat_member, String chat_content) {
		int chatroomCount = chatroomDao.insert_chatroom(chatroomVo);
		
		for (String mem_id :chat_member){
			Chat_memberVo chat_memberVo = new Chat_memberVo();
			chat_memberVo.setChat_code(chatroomVo.getCurrval());
			chat_memberVo.setMem_id(mem_id);
			chat_memberDao.insert_chatMember(chat_memberVo);
		}
		
		Chat_contentsVo chat_contentsVo = new Chat_contentsVo();
		chat_contentsVo.setChat_code(chatroomVo.getCurrval());
		chat_contentsVo.setMem_id(chatroomVo.getMem_id());
		chat_contentsVo.setChat_content(chat_content);
		chat_contentsDao.insert_chatcontets(chat_contentsVo);
		
		return chatroomCount;
	}

}
