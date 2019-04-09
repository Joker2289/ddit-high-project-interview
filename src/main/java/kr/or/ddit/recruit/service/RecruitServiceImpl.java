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

	/**
	 * 
	 * Method : getRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 특정 채용공고 조회.
	 */
	@Override
	public RecruitVo getRecr(String recruit_code) {
		RecruitVo rVo = recrDao.getRecr(recruit_code);
		
		return rVo;
	}

	/**
	 * 
	 * Method : getLastViewRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저가 마지막으로 조회한 채용공고 조회.
	 */
	@Override
	public RecruitVo getLastViewRecr(String user_id) {
		RecruitVo lVRVo = recrDao.getLastViewRecr(user_id);
		
		return lVRVo;
	}

	/**
	 * 
	 * Method : getRecrByLocal
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param job_local
	 * @return
	 * Method 설명 : 특정 업무지역으로 채용공고 목록 조회. 
	 */
	@Override
	public List<RecruitVo> getRecrByLocal(String job_local) {
		List<RecruitVo> rRList1 = recrDao.getRecrByLocal(job_local);
		
		return rRList1;
	}

	/**
	 * 
	 * Method : getRecrByType
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param type1
	 * @return
	 * Method 설명 : 특정 업무분야로 채용공고 목록 조회.
	 */
	@Override
	public List<RecruitVo> getRecrByType(String type) {
		List<RecruitVo> searchList = recrDao.getRecrByType(type);
		
		return searchList;
	}

	
	/**
	 * 
	 * Method : getRecrCorpId
	 * 작성자 : PC18
	 * 변경이력 :
	 * @param corp_id
	 * @return
	 * Method 설명 : 특정 회사 채용공고 조회.
	 */
	@Override
	public RecruitVo getRecrCorpId(String corp_id) {
		RecruitVo rVo = recrDao.getRecrCorpId(corp_id);
		
		return rVo;
	}

	/**
	 * 
	 * Method : updateRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param rVo
	 * @return
	 * Method 설명 : 채용공고 수정.
	 */
	@Override
	public int updateRecr(RecruitVo rVo) {
		int updateCnt = recrDao.updateRecr(rVo);
		
		return updateCnt;
	}

	/**
	 * 
	 * Method : searchRecrListByCorp_name
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 특정 회사 이름으로 검색한 채용공고 목록 조회.
	 */
	@Override
	public List<RecruitVo> searchRecrListByCorp_name(String search_word) {
		List<RecruitVo> recrList = recrDao.searchRecrListByCorp_name(search_word);
		
		return recrList;
	}

	
	
	
}




