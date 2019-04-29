package kr.or.ddit.chat_member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat_member.dao.IChat_memberDao;
import kr.or.ddit.chat_member.model.Chat_memberVo;

@Service("chat_memberService")
public class Chat_memberServiceImpl implements IChat_memberService{
	
	@Resource(name="chat_memberDao")
	private IChat_memberDao chat_memberDao;
	
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
		return chat_memberDao.insert_chatMember(chat_memberVo);
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
		return chat_memberDao.select_chatMember(chat_code);
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
		return chat_memberDao.delete_chatmember(chat_memberVo);
	}

}
