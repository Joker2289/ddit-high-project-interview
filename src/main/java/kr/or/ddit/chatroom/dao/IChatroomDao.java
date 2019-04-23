package kr.or.ddit.chatroom.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.chatroom.model.ChatroomVo;

public interface IChatroomDao {
	
	/**
	 * Method : select_userChatrooms
	 * 작성자 : jin
	 * 변경이력 :
	 * @return
	 * Method 설명 : 유저 채팅방 전체 검색
	 */
	List<Map<String,String>> select_userChatrooms(String mem_id);
	
	/**
	 * Method : insert_chatroom
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chatroomVo
	 * @return
	 * Method 설명 : 방만들기
	 */
	int insert_chatroom(ChatroomVo chatroomVo);
	
	
}
