package kr.or.ddit.career_info.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.career_info.model.Career_infoVo;

@Repository("carrer_infoDao")
public class Carrer_infoDaoImpl implements ICarrer_infoDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insert_carrer_info(Career_infoVo vo) {
		return sqlSessionTemplate.insert("career_info.insert_carrer_info", vo);
	}

}
