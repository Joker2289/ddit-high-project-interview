package kr.or.ddit.chatroom.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chatroom.model.ChatroomVo;

@Repository("chatroomDao")
public class ChatroomDaoImpl implements IChatroomDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : select_userChatrooms
	 * 작성자 : jin
	 * 변경이력 :
	 * @return
	 * Method 설명 : 유저 채팅방 전체 검색
	 */
	@Override
	public List<Map<String, String>> select_userChatrooms(String mem_id) {
		return sqlSessionTemplate.selectList("chatroom.select_userChatrooms", mem_id);
	}

	/**
	 * Method : insert_chatroom
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chatroomVo
	 * @return
	 * Method 설명 : 방만들기
	 */
	@Override
	public int insert_chatroom(ChatroomVo chatroomVo) {
		return sqlSessionTemplate.insert("chatroom.insert_chatroom", chatroomVo);
	}

}
