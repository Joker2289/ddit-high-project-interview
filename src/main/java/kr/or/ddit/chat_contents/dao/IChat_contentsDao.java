package kr.or.ddit.chat_contents.dao;

import java.util.List;

import kr.or.ddit.chat_contents.model.Chat_contentsVo;

public interface IChat_contentsDao {
	
	/**
	 * Method : insert_chatcontets
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_contentsVo
	 * @return
	 * Method 설명 : 채팅 내용 등록
	 */
	int insert_chatcontets(Chat_contentsVo chat_contentsVo);
	
	/**
	 * Method : select_chatContents
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 선택한 채팅방 조회
	 */
	List<Chat_contentsVo> select_chatContents(String chat_code);
}
