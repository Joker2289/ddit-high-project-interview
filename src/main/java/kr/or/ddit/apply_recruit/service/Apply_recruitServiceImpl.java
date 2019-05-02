package kr.or.ddit.apply_recruit.service;

import java.util.List;

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
		int deleteCnt = appDao.deleteApp(aVo);
		
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
		List<Apply_recruitVo> appList = appDao.getAppList(mem_id);
		
		return appList;
	}

	
	
	
	
	
}



