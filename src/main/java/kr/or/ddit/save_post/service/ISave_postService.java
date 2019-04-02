package kr.or.ddit.save_post.service;

import java.util.List;

import kr.or.ddit.save_post.model.Save_postVo;

public interface ISave_postService {

	/**
	 * Method : insert_savepostData
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param savepostVo
	 * @return
	 * Method 설명 : 저장글 정보 삽입
	 */
	int insert_savepostData(Save_postVo savepostVo);
	
	/**
	 * Method : delete_savepostData
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param postsave_code
	 * @return
	 * Method 설명 : 저장글 삭제
	 */
	int delete_savepostData(String postsave_code);
	
	/**
	 * Method : select_savepostData
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 저장글 목록 조회
	 */
	List<Save_postVo> select_savepostData(String mem_id);
	
	/**
	 * Method : savepost_count
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 저장글 갯수 조회
	 */
	int savepost_count(String mem_id);
	
}
