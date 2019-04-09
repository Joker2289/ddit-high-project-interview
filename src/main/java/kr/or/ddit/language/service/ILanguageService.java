package kr.or.ddit.language.service;

import java.util.List;

import kr.or.ddit.language.model.LanguageVo;

public interface ILanguageService {
	
	/**
	 * Method : insert_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param languagevo
	 * @return
	 * Method 설명 : 외국어 등록
	 */
	int insert_language(LanguageVo languagevo);
	
	/**
	 * Method : select_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 외국어 등록
	 */
	List<LanguageVo> select_language(String user_id);
}
