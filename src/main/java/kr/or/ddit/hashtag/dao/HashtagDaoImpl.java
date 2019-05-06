package kr.or.ddit.hashtag.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("hashtagDao")
public class HashtagDaoImpl implements IHashtagDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_hashtag(String hashtag_name) {
		return sqlSession.insert("hashtag.insert_hashtag", hashtag_name);
	}

	/**
	 * Method : selelct_hashtag
	 * 작성자 : jin
	 * 변경이력 :
	 * @return
	 * Method 설명 : 해쉬태그 목록 조회
	 */
	@Override
	public List<String> selelct_hashtag() {
		return sqlSession.selectList("hashtag.select_hashtag");
	}

}
