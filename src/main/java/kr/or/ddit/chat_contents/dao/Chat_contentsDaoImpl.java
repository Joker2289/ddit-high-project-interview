package kr.or.ddit.chat_contents.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat_contents.model.Chat_contentsVo;

@Repository("chat_contentsDao")
public class Chat_contentsDaoImpl implements IChat_contentsDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		return sqlSessionTemplate.insert("chat_contents.insert_chatcontets", chat_contentsVo);
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
		return sqlSessionTemplate.selectList("chat_contents.select_chatContents", chat_code);
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
		return sqlSessionTemplate.selectList("chat_contents.select_chatContentsSearch", chat_contentsVo);
	}

}
