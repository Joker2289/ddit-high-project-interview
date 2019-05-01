package kr.or.ddit.chat_member.service;

import java.util.List;

import kr.or.ddit.chat_member.model.Chat_memberVo;

public interface IChat_memberService {
	
	/**
	 * Method : insert_chatMember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_memberVo
	 * @return
	 * Method 설명 : 채팅 방 유저 등록
	 */
	int insert_chatMember(Chat_memberVo chat_memberVo);
	
	/**
	 * Method : select_chatMember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 채팅 방 유저 조회
	 */
	List<Chat_memberVo> select_chatMember(String chat_code);

	/**
	 * Method : delete_chatmember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_memberVo
	 * @return
	 * Method 설명 : 채팅 방 유저 삭제
	 */
	int delete_chatmember(Chat_memberVo chat_memberVo);
}
