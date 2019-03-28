package kr.or.ddit.save_recruit.service;

import java.util.List;

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

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param string
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고저장 삭제.
	 */
	@Override
	public int deleteForTest(String save_code) {
		int deleteCnt = srecrDao.deleteForTest(save_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getSrecrCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고저장 수 조회.
	 */
	@Override
	public int getSrecrCnt() {
		int srecrCnt = srecrDao.getSrecrCnt();
		
		return srecrCnt;
	}

	/**
	 * 
	 * Method : getUserSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 전체 채용공고저장 목록 조회.
	 */
	@Override
	public List<Save_recruitVo> getUserSrecrList(String user_id) {
		List<Save_recruitVo> USList = srecrDao.getUserSrecrList(user_id);
		
		return USList;
	}
	
	
	
	
}







