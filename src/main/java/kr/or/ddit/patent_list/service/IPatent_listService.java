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
}
