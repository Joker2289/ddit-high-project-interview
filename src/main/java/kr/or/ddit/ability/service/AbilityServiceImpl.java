package kr.or.ddit.ability.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.ability.dao.IAbilityDao;
import kr.or.ddit.ability.model.AbilityVo;

@Service("abilityService")
public class AbilityServiceImpl implements IAbilityService{
	
	@Resource(name="abilityDao")
	private IAbilityDao abilityDao;

	/**
	 * Method : insert_ability
	 * 작성자 : jin
	 * 변경이력 :
	 * @param abilityvo
	 * @return
	 * Method 설명 : 보유기술 등록
	 */
	@Override
	public int insert_ability(AbilityVo abilityvo) {
		return abilityDao.insert_ability(abilityvo);
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
		return abilityDao.select_ability(user_id);
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
		return abilityDao.select_oneAbility(ability_code);
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
		return abilityDao.update_ability(abilityVo);
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
		return abilityDao.delete_ability(ability_code);
	}
	

}
