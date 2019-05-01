package kr.or.ddit.apply_recruit.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.apply_recruit.dao.IApply_recruitDao;
import kr.or.ddit.apply_recruit.model.Apply_recruitVo;

@Service("apply_recruitService")
public class Apply_recruitServiceImpl implements IApply_recruitService{
	
	@Resource(name="apply_recruitDao")
	private IApply_recruitDao appDao;
	
	/**
	 * 
	 * Method : insertApp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param aVo
	 * @return
	 * Method 설명 : 채용공고지원 등록.
	 */
	@Override
	public int insertApp(Apply_recruitVo aVo) {
		int insertCnt = appDao.insertApp(aVo);
		
		return insertCnt;
	}

	
	
	
	
	
}



