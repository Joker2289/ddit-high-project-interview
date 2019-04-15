package kr.or.ddit.career_info.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.career_info.model.Career_infoVo;

@Repository("career_infoDao")
public class Career_infoDaoImpl implements ICareer_infoDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insert_career_info(Career_infoVo vo) {
		return sqlSessionTemplate.insert("career_info.insert_career_info", vo);
	}

	/**
	 * Method : select_careerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	@Override
	public List<Career_infoVo> select_careerInfo(String user_id) {
		return sqlSessionTemplate.selectList("career_info.select_careerInfo", user_id);
	}
	
	/**
	 * Method : select_oneCareerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 경력정보 조회
	 */
	@Override
	public Career_infoVo select_oneCareerInfo(String career_code) {
		return sqlSessionTemplate.selectOne("career_info.select_oneCareerInfo", career_code);
	}
	
	/**
	 * Method : update_career_info
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_infoVo
	 * @return
	 * Method 설명 : 사용자의 경력정보 업데이트
	 */
	@Override
	public int update_career_info(Career_infoVo career_infoVo) {
		return sqlSessionTemplate.update("career_info.update_career_info", career_infoVo);
	}

}
