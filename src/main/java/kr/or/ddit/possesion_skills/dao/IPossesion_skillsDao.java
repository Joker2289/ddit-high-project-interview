package kr.or.ddit.possesion_skills.dao;

import java.util.List;

import kr.or.ddit.possesion_skills.model.Possesion_skillsVo;

public interface IPossesion_skillsDao {
	
	/**
	 * Method : insert_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param possesion_skillsvo
	 * @return
	 * Method 설명 : 보유기술 등록
	 */
	int insert_possesion_skills(Possesion_skillsVo possesion_skillsvo);
	
	/**
	 * Method : select_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 보유 기술 조회
	 */
	List<Possesion_skillsVo> select_possesion_skills(String user_id);
	
	/**
	 * Method : select_onePossesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param pskill_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 보유기술 조회
	 */
	Possesion_skillsVo select_onePossesion_skills(String pskill_code);
	
	/**
	 * Method : update_possesion_skills
	 * 작성자 : jin
	 * 변경이력 :
	 * @param possesion_skillsvo
	 * @return
	 * Method 설명 : 사용자의 보유기술 업데이트
	 */
	int update_possesion_skills(Possesion_skillsVo possesion_skillsVo);
}
