package kr.or.ddit.chatroom.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.chat_contents.model.Chat_contentsVo;
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
	
	/**
	 * Method : select_userChatroomsSearch
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_contentsVo
	 * @return
	 * Method 설명 : 사용자가 입력한 내용으로 채팅방 검색
	 */
	List<String> select_userChatroomsSearch(Chat_contentsVo chat_contentsVo);
	
	/**
	 * Method : delete_chatroom
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 채팅방 삭제 
	 */
	int delete_chatroom(String chat_code);
	
	
}
