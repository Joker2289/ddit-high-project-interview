package kr.or.ddit.search_log.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.search_log.model.Search_logVo;

@Repository("search_logDao")
public class Search_logDaoImpl implements ISearch_logDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 
	 * Method : getAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 검색내역 수 조회.
	 */
	@Override
	public int getAllCnt() {
		int search_logCnt = sqlSessionTemplate.selectOne("search_log.getAllCnt"); 
		
		return search_logCnt;
	}

	/**
	 * 
	 * Method : insertSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 검색내역 등록.
	 */
	@Override
	public int insertSearch_log(Search_logVo sVo) {
		int insertCnt = sqlSessionTemplate.insert("search_log.insertSearch_log", sVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : getSaveList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 저장한 검색어 리스트 조회.
	 */
	@Override
	public List<Search_logVo> getSaveList(Search_logVo sVo) {
		List<Search_logVo> saveList = sqlSessionTemplate.selectList("search_log.getSaveList", sVo);
		
		return saveList;
	}

	/**
	 * 
	 * Method : getSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_code
	 * @return
	 * Method 설명 : 특정 검색내역 조회.
	 */
	@Override
	public Search_logVo getSearch_log(String search_code) {
		Search_logVo sVo = sqlSessionTemplate.selectOne("search_log.getSearch_log", search_code);
		
		return sVo;
	}

	/**
	 * 
	 * Method : deleteSearch_logForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_code
	 * @return
	 * Method 설명 : 테스트 코드 작성을 위한 검색내역 삭제.
	 */
	@Override
	public int deleteSearch_logForTest(String search_code) {
		int deleteCnt = sqlSessionTemplate.delete("search_log.deleteSearch_logForTest", search_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : updateSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 검색내역 수정.
	 */
	@Override
	public int updateSearch_log(Search_logVo sVo) {
		int updateCnt = sqlSessionTemplate.update("search_log.updateSearch_log", sVo);
		
		return updateCnt;
	}

	/**
	 * 
	 * Method : getLSLog
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 회원이 검색하려는 값 조회.
	 */
	@Override
	public Search_logVo getLSLog(String mem_id) {
		Search_logVo lSLog = sqlSessionTemplate.selectOne("search_log.getLSLog", mem_id);
		
		return lSLog;
	}

	/**
	 * 
	 * Method : getSList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 유저의 최근 검색어 리스트 조회.
	 */
	@Override
	public List<Search_logVo> getSList(String mem_id) {
		List<Search_logVo> sList = sqlSessionTemplate.selectList("search_log.getSList", mem_id);
		
		return sList;
	}	

	
	
}





