package kr.or.ddit.ability.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.ability.model.AbilityVo;
import kr.or.ddit.thesis_list.model.Thesis_listVo;

@Repository("abilityDao")
public class AbilityDaoImpl implements IAbilityDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param abilityvo
	 * @return
	 * Method 설명 : 보유기술 등록
	 */
	@Override
	public int insert_ability(AbilityVo abilityVo) {
		return sqlSessionTemplate.insert("ability.insert_ability", abilityVo);
	}

	/**
	 * Method : select_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 보유기술 조회
	 */
	@Override
	public List<AbilityVo> select_ability(String user_id) {
		return sqlSessionTemplate.selectList("ability.select_ability", user_id);
	}

	/**
	 * Method : select_oneAbility
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 보유기술 한건 조회
	 */
	@Override
	public AbilityVo select_oneAbility(String ability_code) {
		return sqlSessionTemplate.selectOne("ability.select_oneAbility", ability_code);
	}

	/**
	 * Method : update_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param abilityVo
	 * @return
	 * Method 설명 : 보유기술 수정
	 */
	@Override
	public int update_ability(AbilityVo abilityVo) {
		return sqlSessionTemplate.update("ability.update_ability", abilityVo);
	}

	/**
	 * Method : delete_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param ability_code
	 * @return
	 * Method 설명 : 보유기술 삭제
	 */
	@Override
	public int delete_ability(String ability_code) {
		return sqlSessionTemplate.delete("ability.delete_ability", ability_code);
	}

}
