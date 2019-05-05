package kr.or.ddit.ability.dao;

import java.util.List;

import kr.or.ddit.ability.model.AbilityVo;

public interface IAbilityDao {
	
	/**
	 * Method : insert_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param abilityvo
	 * @return
	 * Method 설명 : 보유기술 등록
	 */
	int insert_ability(AbilityVo abilityvo); 
	
	/**
	 * Method : select_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 보유기술 조회
	 */
	List<AbilityVo> select_ability(String user_id);
	
	
	/**
	 * Method : select_oneAbility
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 보유기술 한건 조회
	 */
	AbilityVo select_oneAbility(String thesis_code);
	
	
	/**
	 * Method : update_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param abilityVo
	 * @return
	 * Method 설명 : 보유기술 수정
	 */
	int update_ability(AbilityVo abilityVo);
	
	
	/**
	 * Method : delete_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param ability_code
	 * @return
	 * Method 설명 : 보유기술 삭제
	 */
	int delete_ability(String ability_code);
	
}
