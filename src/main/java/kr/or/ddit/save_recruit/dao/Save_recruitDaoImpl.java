package kr.or.ddit.save_recruit.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.save_recruit.model.Save_recruitVo;

@Repository("save_recruitDao")
public class Save_recruitDaoImpl implements ISave_recruitDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 
	 * Method : insertSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 채용공고저장 등록.
	 */
	@Override
	public int insertSrecr(Save_recruitVo sVo) {
		int insertCnt = sqlSessionTemplate.insert("srecr.insertSrecr", sVo);
		
		return insertCnt;
	}
	
}
