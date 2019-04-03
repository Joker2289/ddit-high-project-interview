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

}
