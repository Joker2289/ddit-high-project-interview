package kr.or.ddit.save_recruit.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.save_recruit.dao.ISave_recruitDao;
import kr.or.ddit.save_recruit.model.Save_recruitVo;

@Service("save_recruitService")
public class Save_recruitServiceImpl implements ISave_recruitService{

	@Resource(name="save_recruitDao")
	private ISave_recruitDao srecrDao;

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
		int insertCnt = srecrDao.insertSrecr(sVo);
		
		return insertCnt;
	}
	
	
	
	
}







