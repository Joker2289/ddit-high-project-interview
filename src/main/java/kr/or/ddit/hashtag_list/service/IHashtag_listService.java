package kr.or.ddit.hashtag_list.service;

import java.util.List;

import kr.or.ddit.hashtag_list.model.Hashtag_listVo;

public interface IHashtag_listService {

	/**
	 * Method : insert_hashtaglist 작성자 : goo84 변경이력 :
	 * 
	 * @return Method 설명 : 해시태그 목록 등록
	 */
	int insert_hashtaglist(Hashtag_listVo taglistVo);

	/**
	 * Method : update_hashtaglist 작성자 : goo84 변경이력 :
	 * 
	 * @return Method 설명 : 해시태그 목록 수정
	 */
	int update_hashtaglist(Hashtag_listVo taglistVo);

	/**
	 * Method : delete_hashtaglist 작성자 : goo84 변경이력 :
	 * 
	 * @return Method 설명 : 해시태그 목록 삭제
	 */
	int delete_hashtaglist(Hashtag_listVo taglistVo);

	/**
	 * Method : select_hashtaglist 작성자 : goo84 변경이력 :
	 * 
	 * @return Method 설명 : 포함된 해시태그 조회
	 */
	List<Hashtag_listVo> select_hashtaglist(Hashtag_listVo taglistVo);
	
}
