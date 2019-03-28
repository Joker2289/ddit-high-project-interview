package kr.or.ddit.education_info.dao;

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

}
