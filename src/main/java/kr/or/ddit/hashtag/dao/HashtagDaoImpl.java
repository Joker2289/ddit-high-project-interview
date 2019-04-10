package kr.or.ddit.hashtag.dao;

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

}
