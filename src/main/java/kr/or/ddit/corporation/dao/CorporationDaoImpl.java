package kr.or.ddit.corporation.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.corporation.model.CorporationVo;

@Repository("corporationDao")
public class CorporationDaoImpl implements ICorporationDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public CorporationVo select_corpInfo(String corp_id) {
		return sqlSessionTemplate.selectOne("corp.select_corpInfo", corp_id);
	}

}
