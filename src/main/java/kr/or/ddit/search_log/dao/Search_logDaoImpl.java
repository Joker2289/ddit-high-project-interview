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

}
