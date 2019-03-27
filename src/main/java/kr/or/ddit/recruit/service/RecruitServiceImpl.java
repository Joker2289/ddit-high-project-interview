package kr.or.ddit.recruit.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.recruit.dao.IRecruitDao;
import kr.or.ddit.recruit.model.RecruitVo;

@Service("recruitService")
public class RecruitServiceImpl implements IRecruitService{

	@Resource(name="recruitDao")
	private IRecruitDao recrDao;
	
	/**
	 * 
	 * Method : insertRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param rVo
	 * @return
	 * Method 설명 : 채용공고 등록.
	 */
	@Override
	public int insertRecr(RecruitVo rVo) {
		int insertCnt = recrDao.insertRecr(rVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param string
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고 삭제.
	 */
	@Override
	public int deleteForTest(String recruit_code) {
		int deleteCnt = recrDao.deleteForTest(recruit_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getRecrCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고 수 조회.
	 */
	@Override
	public int getRecrCnt() {
		int recrCnt = recrDao.getRecrCnt();
		
		return recrCnt;
	}

	/**
	 * 
	 * Method : getAllRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고 조회.
	 */
	@Override
	public List<RecruitVo> getAllRecr() {
		List<RecruitVo> recrList = recrDao.getAllRecr();
		
		return recrList;
	}

}
