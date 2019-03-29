package kr.or.ddit.recruit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.recruit.model.RecruitVo;

@Repository("recruitDao")
public class RecruitDaoImpl implements IRecruitDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

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
		int insertCnt = sqlSessionTemplate.insert("recr.insertRecr", rVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고 삭제.
	 */
	@Override
	public int deleteForTest(String recruit_code) {
		int deleteCnt = sqlSessionTemplate.delete("recr.deleteForTest", recruit_code);
		
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
		int recrCnt = sqlSessionTemplate.selectOne("recr.getRecrCnt");
		
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
		List<RecruitVo> recrList = sqlSessionTemplate.selectList("recr.getAllRecr");
		
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
		RecruitVo rVo = sqlSessionTemplate.selectOne("recr.getRecr", recruit_code);
		
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
		RecruitVo lVRVo = sqlSessionTemplate.selectOne("recr.getLastViewRecr", user_id);
		
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
		List<RecruitVo> rRList1 = sqlSessionTemplate.selectList("recr.getRecrByLocal", job_local);
		
		return rRList1;
	}

	/**
	 * 
	 * Method : getRecrByType
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param type
	 * @return
	 * Method 설명 : 특정 업무분야로 채용공고 목록 조회.
	 */
	@Override
	public List<RecruitVo> getRecrByType(String type) {
		List<RecruitVo> searchList = sqlSessionTemplate.selectList("recr.getRecrByType", type);
		
		return searchList;
	}
	
	
	

}




