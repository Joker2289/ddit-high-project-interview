package kr.or.ddit.education_info.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.education_info.model.Education_infoVo;

@Repository("education_infoDao")
public class Education_infoDaoImpl implements IEducation_infoDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public int insert_education_info(Education_infoVo vo) {
		return sqlSessionTemplate.insert("education_info.insert_education_info", vo);
	}


	/**
	 * Method : select_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 학력 조회
	 */
	@Override
	public List<Education_infoVo> select_educationInfo(String user_id) {
		return sqlSessionTemplate.selectList("education_info.select_educationInfo", user_id);
	}

	/**
	 * Method : select_oneEducationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 학력정보 조회
	 */
	@Override
	public Education_infoVo select_oneEducationInfo(String education_code) {
		return sqlSessionTemplate.selectOne("education_info.select_oneEducationInfo", education_code);
	}

	/**
	 * Method : update_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_infoVo
	 * @return
	 * Method 설명 : 사용자의 학력정보 업데이트
	 */
	@Override
	public int update_educationInfo(Education_infoVo education_infoVo) {
		return sqlSessionTemplate.update("education_info.update_educationInfo", education_infoVo);
	}

	/**
	 * Method : delete_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_code
	 * @return
	 * Method 설명 : 사용자의 학력정보 삭제
	 */
	@Override
	public int delete_educationInfo(String education_code) {
		return sqlSessionTemplate.delete("education_info.delete_educationInfo", education_code);
	}

}
