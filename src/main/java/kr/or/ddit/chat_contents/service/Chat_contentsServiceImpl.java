package kr.or.ddit.chat_contents.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat_contents.dao.IChat_contentsDao;
import kr.or.ddit.chat_contents.model.Chat_contentsVo;

@Service("chat_contentsService")
public class Chat_contentsServiceImpl implements IChat_contentsService{
	
	@Resource(name="chat_contentsDao")
	private IChat_contentsDao chat_contentsDao;
	
	/**
	 * Method : insert_chatcontets
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_contentsVo
	 * @return
	 * Method 설명 : 채팅 내용 등록
	 */
	@Override
	public int insert_chatcontets(Chat_contentsVo chat_contentsVo) {
		return chat_contentsDao.insert_chatcontets(chat_contentsVo);
	}
	
	/**
	 * Method : select_chatContents
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_code
	 * @return
	 * Method 설명 : 선택한 채팅방 조회
	 */
	@Override
	public List<Chat_contentsVo> select_chatContents(String chat_code) {
		return chat_contentsDao.select_chatContents(chat_code);
	}

	/**
	 * Method : select_chatContentsSearch
	 * 작성자 : jin
	 * 변경이력 :
	 * @param chat_contentsVo
	 * @return
	 * Method 설명 : 내용 조회
	 */
	@Override
	public List<String> select_chatContentsSearch(Chat_contentsVo chat_contentsVo) {
		return chat_contentsDao.select_chatContentsSearch(chat_contentsVo);
	}

	/**
	 * Method : select_findName
	 * 작성자 : jin
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 이름찾기
	 */
	@Override
	public String select_findName(String mem_id) {
		return chat_contentsDao.select_findName(mem_id);
	}

}
