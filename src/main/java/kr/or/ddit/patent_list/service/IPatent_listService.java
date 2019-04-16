package kr.or.ddit.patent_list.service;

import java.util.List;

import kr.or.ddit.patent_list.model.Patent_listVo;

public interface IPatent_listService {
	
	/**
	 * Method : insert_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param patent_listvo
	 * @return
	 * Method 설명 : 특허 등록
	 */
	int insert_patent_list(Patent_listVo patent_listvo);
	
	
	/**
	 * Method : select_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 특허 조회
	 */
	List<Patent_listVo> select_patent_list(String user_id);
	
	/**
	 * Method : select_onePatent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param patent_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 특허정보 조회
	 */
	Patent_listVo select_onePatent_list(String patent_code);
	
	/**
	 * Method : update_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param patent_listVo
	 * @return
	 * Method 설명 : 사용자의 특허정보 업데이트
	 */
	int update_patent_list(Patent_listVo patent_listVo);
	
	/**
	 * Method : delete_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param patent_code
	 * @return
	 * Method 설명 : 사용자의 특허정보 삭제
	 */
	int delete_patent_list(String patent_code);
}
