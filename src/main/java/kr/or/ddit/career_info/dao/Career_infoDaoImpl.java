package kr.or.ddit.career_info.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.education_info.model.Education_infoVo;

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
		
	/**
	 * Method : delete_career_info
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_code
	 * @return
	 * Method 설명 : 사용자의 경력정보 삭제
	 */
	@Override
	public int delete_career_info(String career_code) {
		return sqlSessionTemplate.delete("career_info.delete_career_info", career_code);
	}
	
	/**
	 * 회사 직원 수
	 * @param vo
	 * @return
	 */
	@Override
	public int employee_count(String corporate_name) {
		int empCount = sqlSessionTemplate.selectOne("career_info.employee_count",corporate_name);
		return empCount;
	}

	/**
	 * 회사 직원의 각 대학 count
	 * @param vo
	 * @return
	 */
	@Override
	public List<Education_infoVo> employee_education_count(String corporate_name) {
		List<Education_infoVo> eec = sqlSessionTemplate.selectList("career_info.employee_education_count", corporate_name);
		return eec;
	}
	/**
	 * 회사 직원의 각 대학 count
	 * @param vo
	 * @return
	 */
	@Override
	public List<Integer> employee_education_count2(String corporate_name) {
		List<Integer> eec = sqlSessionTemplate.selectList("career_info.employee_education_count2", corporate_name);
		return eec;
	}

	/**
	 * 직원들 이름과 다니는 대학교
	 * @param vo
	 * @return
	 */
	@Override
	public Map<String, Object> employee_education(String corporate_name) {
		Map<String, Object> ee = new HashMap<String, Object>();
		ee = sqlSessionTemplate.selectMap("career_info.employee_education", corporate_name);
		return ee;
	}

	/**
	 * 
	 * Method : getLastCareer
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 마지막 경력정보 조회.
	 */
	@Override
	public Career_infoVo getLastCareer(String user_id) {
		Career_infoVo cVo = sqlSessionTemplate.selectOne("career_info.getLastCareer", user_id);
		
		return cVo;
	}

}
