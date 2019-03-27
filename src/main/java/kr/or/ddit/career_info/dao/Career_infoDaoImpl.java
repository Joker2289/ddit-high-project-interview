package kr.or.ddit.career_info.dao;

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

}
