package kr.or.ddit.recruit.dao;

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

}
