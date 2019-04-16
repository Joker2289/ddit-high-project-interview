package kr.or.ddit.thesis_list.dao;

import java.util.List;

import kr.or.ddit.thesis_list.model.Thesis_listVo;

public interface IThesis_listDao {
	
	/**
	 * Method : insert_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_listvo
	 * @return
	 * Method 설명 : 논문 저서 등록
	 */
	int insert_thesis_list(Thesis_listVo thesis_listvo);
	
	/**
	 * Method : select_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 논문 저서 조회
	 */
	List<Thesis_listVo> select_thesis_list(String user_id);
	
	/**
	 * Method : select_oneThesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 논문저서 조회
	 */
	Thesis_listVo select_oneThesis_list(String thesis_code);
	
	/**
	 * Method : update_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_listVo
	 * @return
	 * Method 설명 : 사용자의 논문저서 업데이트
	 */
	int update_thesis_list(Thesis_listVo thesis_listVo);
	
	/**
	 * Method : delete_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 사용자의 논문저서 삭제
	 */
	int delete_thesis_list(String thesis_code);
	
}
