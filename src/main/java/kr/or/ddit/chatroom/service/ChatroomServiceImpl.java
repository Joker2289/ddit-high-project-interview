package kr.or.ddit.chatroom.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.velocity.runtime.directive.Parse;
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
	public String insert_chatroom(ChatroomVo chatroomVo, String[] chat_member, String chat_content) {
		chatroomDao.insert_chatroom(chatroomVo);
		
		for (String mem_id :chat_member){
			Chat_memberVo chat_memberVo = new Chat_memberVo();
			chat_memberVo.setChat_code(chatroomVo.getCurrval());
			chat_memberVo.setMem_id(mem_id);
			chat_memberDao.insert_chatMember(chat_memberVo);
		}
		
		Chat_memberVo chat_memberVo = new Chat_memberVo();
		chat_memberVo.setChat_code(chatroomVo.getCurrval());
		chat_memberVo.setMem_id(chatroomVo.getMem_id());
		chat_memberDao.insert_chatMember(chat_memberVo);
		
		return chatroomVo.getCurrval();
	}
	
	/**
	 * Method : select_userChatroomsSearch
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_contentsVo
	 * @return
	 * Method 설명 : 사용자가 입력한 내용으로 채팅방 검색
	 */
	@Override
	public List<String> select_userChatroomsSearch(Chat_contentsVo chat_contentsVo) {
		return chatroomDao.select_userChatroomsSearch(chat_contentsVo);
	}

	/**
	 * Method : delete_chatroom
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 채팅방 삭제 
	 */
	@Override
	public int delete_chatroom(String chat_code) {
		return chatroomDao.delete_chatroom(chat_code);
	}

}
