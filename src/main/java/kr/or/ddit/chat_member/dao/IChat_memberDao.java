package kr.or.ddit.chat_member.dao;

import kr.or.ddit.chat_member.model.Chat_memberVo;

public interface IChat_memberDao {
	
	/**
	 * Method : insert_chatMember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_memberVo
	 * @return
	 * Method 설명 : 채팅 방 유저 등록
	 */
	int insert_chatMember(Chat_memberVo chat_memberVo);
}
