package kr.or.ddit.hashtag.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.hashtag.dao.IHashtagDao;

@Service("hashtagService")
public class HashtagServiceImpl implements IHashtagService {

	@Resource(name="hashtagDao")
	private IHashtagDao hashtagDao;
	
	@Override
	public int insert_hashtag(String hashtag_name) {
		return hashtagDao.insert_hashtag(hashtag_name);
	}

	/**
	 * Method : selelct_hashtag
	 * 작성자 : jin
	 * 변경이력 :
	 * @return
	 * Method 설명 : 해시태그 목록 조회
	 */
	@Override
	public List<String> selelct_hashtag() {
		return hashtagDao.selelct_hashtag();
	}

}
