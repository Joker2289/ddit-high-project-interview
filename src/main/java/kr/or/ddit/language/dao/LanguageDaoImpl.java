package kr.or.ddit.language.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.language.model.LanguageVo;

@Repository("languageDao")
public class LanguageDaoImpl implements ILanguageDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param languagevo
	 * @return
	 * Method 설명 : 외국어 등록
	 */
	@Override
	public int insert_language(LanguageVo languagevo) {
		return sqlSessionTemplate.insert("language.insert_language", languagevo);
	}

	/**
	 * Method : select_language
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 외국어 등록
	 */
	@Override
	public List<LanguageVo> select_language(String user_id) {
		return sqlSessionTemplate.selectList("language.select_language", user_id);
	}

}
