package kr.or.ddit.interest.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.interest.dao.IInterestDao;
import kr.or.ddit.interest.model.InterestVo;

@Service("interestService")
public class InterestServiceImpl implements IInterestService{
	
	@Resource(name="interestDao")
	private IInterestDao inteDao;

	/**
	 * 
	 * Method : insertInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param iVo
	 * @return
	 * Method 설명 : 관심분야 등록.
	 */
	@Override
	public int insertInte(InterestVo iVo) {
		int insertCnt = inteDao.insertInte(iVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : getInteCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 관심분야 수 조회.
	 */
	@Override
	public int getInteCnt() {
		int inteCnt = inteDao.getInteCnt();
		
		return inteCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param inte_code
	 * @return
	 * Method 설명 : 테스트를 위한 관심분야 삭제.
	 */
	@Override
	public int deleteForTest(String inte_code) {
		int deleteCnt = inteDao.deleteForTest(inte_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 관심분야 조회.
	 */
	@Override
	public InterestVo getInte(String mem_id) {
		InterestVo iVo = inteDao.getInte(mem_id);
		
		return iVo;
	}

	/**
	 * 
	 * Method : updateInte
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param iVo
	 * @return
	 * Method 설명 : 관심분야 수정.
	 */
	@Override
	public int updateInte(InterestVo iVo) {
		int updateCnt = inteDao.updateInte(iVo);
		
		return updateCnt;
	}
	
	
	
	
	
	

}




