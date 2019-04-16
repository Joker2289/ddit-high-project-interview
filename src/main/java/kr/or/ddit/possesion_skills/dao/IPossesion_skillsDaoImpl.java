package kr.or.ddit.possesion_skills.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.possesion_skills.model.Possesion_skillsVo;

@Repository("possesion_skillsDao")
public class IPossesion_skillsDaoImpl implements IPossesion_skillsDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param possesion_skillsvo
	 * @return
	 * Method 설명 : 보유기술 등록
	 */
	@Override
	public int insert_possesion_skills(Possesion_skillsVo possesion_skillsvo) {
		return sqlSessionTemplate.insert("possesion_skills.insert_possesion_skills", possesion_skillsvo);
	}
	
	/**
	 * Method : select_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 보유 기술 조회
	 */
	@Override
	public List<Possesion_skillsVo> select_possesion_skills(String user_id) {
		return sqlSessionTemplate.selectList("possesion_skills.select_possesion_skills", user_id);
	}

	/**
	 * Method : select_onePossesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param pskill_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 보유기술 조회
	 */
	@Override
	public Possesion_skillsVo select_onePossesion_skills(String pskill_code) {
		return sqlSessionTemplate.selectOne("possesion_skills.select_onePossesion_skills", pskill_code);
	}
	
	/**
	 * Method : update_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param possesion_skillsvo
	 * @return
	 * Method 설명 : 사용자의 보유기술 업데이트
	 */
	@Override
	public int update_possesion_skills(Possesion_skillsVo possesion_skillsVo) {
		return sqlSessionTemplate.update("possesion_skills.update_possesion_skills", possesion_skillsVo);
	}
	
	/**
	 * Method : delete_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param pskill_code
	 * @return
	 * Method 설명 : 사용자의 보유기술 삭제
	 */
	@Override
	public int delete_possesion_skills(String pskill_code) {
		return sqlSessionTemplate.delete("possesion_skills.delete_possesion_skills", pskill_code);
	}

}
