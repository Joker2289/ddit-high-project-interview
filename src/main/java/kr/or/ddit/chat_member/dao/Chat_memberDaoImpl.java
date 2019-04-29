package kr.or.ddit.chat_member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat_member.model.Chat_memberVo;

@Repository("chat_memberDao")
public class Chat_memberDaoImpl implements IChat_memberDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_chatMember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_memberVo
	 * @return
	 * Method 설명 : 채팅 방 유저 등록
	 */
	@Override
	public int insert_chatMember(Chat_memberVo chat_memberVo) {
		return sqlSessionTemplate.insert("chat_member.insert_chatMember",chat_memberVo);
	}
	
	/**
	 * Method : select_chatMember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 채팅 방 유저 조회
	 */
	@Override
	public List<Chat_memberVo> select_chatMember(String chat_code) {
		return sqlSessionTemplate.selectList("chat_member.select_chatMember", chat_code);
	}

	/**
	 * Method : delete_chatmember
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_memberVo
	 * @return
	 * Method 설명 : 채팅 방 유저 삭제
	 */
	@Override
	public int delete_chatmember(Chat_memberVo chat_memberVo) {
		return sqlSessionTemplate.delete("chat_member.delete_chatmember", chat_memberVo);
	}

}
