package kr.or.ddit.language.dao;

import java.util.List;

import kr.or.ddit.language.model.LanguageVo;

public interface ILanguageDao {
	
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
	
	/**
	 * Method : select_oneLanguage
	 * 작성자 : jin
	 * 변경이력 :
	 * @param lang_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 외국어 조회
	 */
	LanguageVo select_oneLanguage(String lang_code);
	
	/**
	 * Method : update_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param languageVo
	 * @return
	 * Method 설명 : 사용자의 외국어 업데이트
	 */
	int update_language(LanguageVo languageVo);
	
	/**
	 * Method : delete_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param lang_code
	 * @return
	 * Method 설명 : 사용자의 외국어 삭제
	 */
	int delete_language(String lang_code);
	
}
