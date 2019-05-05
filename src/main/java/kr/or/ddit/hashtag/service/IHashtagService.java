package kr.or.ddit.hashtag.service;

import java.util.List;

public interface IHashtagService {
	
	/**
	 * Method : insert_hashtag
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param hashtag_name
	 * @return
	 * Method 설명 : 해쉬태그 등록(신규등록/재등록 가능)
	 */
	int insert_hashtag(String hashtag_name);
	
	/**
	 * Method : selelct_hashtag
	 * 작성자 : jin
	 * 변경이력 :
	 * @return
	 * Method 설명 : 해쉬태그 목록 조회
	 */
	List<String> selelct_hashtag();
	
}
