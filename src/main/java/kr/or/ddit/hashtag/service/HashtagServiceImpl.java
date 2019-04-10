package kr.or.ddit.hashtag.service;

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

}
