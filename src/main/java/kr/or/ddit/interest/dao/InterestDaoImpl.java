package kr.or.ddit.interest.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.interest.model.InterestVo;

@Repository("interestDao")
public class InterestDaoImpl implements IInterestDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

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
		int insertCnt = sqlSessionTemplate.insert("inte.insertInte", iVo);
		
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
		int inteCnt = sqlSessionTemplate.selectOne("inte.getInteCnt");
		
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
		int deleteCnt = sqlSessionTemplate.delete("inte.deleteForTest", inte_code);
		
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
		InterestVo iVo = sqlSessionTemplate.selectOne("inte.getInte", mem_id);
		
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
		int updateCnt = sqlSessionTemplate.update("inte.updateInte", iVo);
		
		return updateCnt;
	}
	
	
	
	
}






