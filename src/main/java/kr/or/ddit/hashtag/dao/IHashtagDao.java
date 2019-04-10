package kr.or.ddit.hashtag.dao;

public interface IHashtagDao {
	
	/**
	 * Method : insert_hashtag
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param hashtag_name
	 * @return
	 * Method 설명 : 해쉬태그 등록(신규등록/재등록 가능)
	 */
	int insert_hashtag(String hashtag_name);

}
