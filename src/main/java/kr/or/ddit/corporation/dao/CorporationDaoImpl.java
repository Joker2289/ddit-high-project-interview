package kr.or.ddit.corporation.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.corporation.model.CorporationVo;

@Repository("corporationDao")
public class CorporationDaoImpl implements ICorporationDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public CorporationVo select_corpInfo(String corp_id) {
		return sqlSessionTemplate.selectOne("corp.select_corpInfo", corp_id);
	}

	/**
	 * 
	 * Method : getCorp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 회사이름으로 특정 회사 조회.
	 */
	@Override
	public CorporationVo getCorp(String corp_name) {
		CorporationVo cVo = sqlSessionTemplate.selectOne("corp.getCorp", corp_name);
		
		return cVo;
	}

	/**
	 * 
	 * Method : insert_corp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param cVo
	 * @return
	 * Method 설명 : 회사 등록.
	 */
	@Override
	public int insert_corp(CorporationVo cVo) {
		int insertCnt = sqlSessionTemplate.insert("corp.insert_corp", cVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 테스트 코드를 위한 회사 삭제.
	 */
	@Override
	public int deleteForTest(String corp_name) {
		int deleteCnt = sqlSessionTemplate.delete("corp.deleteForTest", corp_name);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : select_allCorps
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 회사 목록 조회.
	 */
	@Override
	public List<CorporationVo> select_allCorps() {
		List<CorporationVo> corpList = sqlSessionTemplate.selectList("corp.select_allCorps");
		
		return corpList;
	}

	/**
	 * 
	 * Method : getCorpCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 회사 수 조회.
	 */
	@Override
	public int getCorpCnt() {
		int corpCnt = sqlSessionTemplate.selectOne("corp.getCorpCnt");
		
		return corpCnt;
	}

}
