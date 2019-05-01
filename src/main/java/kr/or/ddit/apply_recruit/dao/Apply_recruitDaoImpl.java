package kr.or.ddit.apply_recruit.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;

@Repository("apply_recruitDao")
public class Apply_recruitDaoImpl implements IApply_recruitDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;	
	
	@Override
	public int insertApp(Apply_recruitVo aVo) {
		int insertCnt = sqlSessionTemplate.insert("app.insertApp", aVo);
		
		return insertCnt;
	}

}
