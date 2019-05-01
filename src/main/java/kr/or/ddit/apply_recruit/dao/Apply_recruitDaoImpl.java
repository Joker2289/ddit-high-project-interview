package kr.or.ddit.apply_recruit.dao;

import java.util.List;

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

	/**
	 * 
	 * Method : deleteApp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param aVo
	 * @return
	 * Method 설명 : 채용공고지원 삭제.
	 */
	@Override
	public int deleteApp(Apply_recruitVo aVo) {
		int deleteCnt = sqlSessionTemplate.delete("app.deleteApp", aVo);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getAppList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 유저의 채용공고지원 목록 조회.
	 */
	@Override
	public List<Apply_recruitVo> getAppList(String mem_id) {
		List<Apply_recruitVo> appList = sqlSessionTemplate.selectList("app.getAppList", mem_id);
		
		return appList;
	}

	
	
	
	
	
	
	
}


