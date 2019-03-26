package kr.or.ddit.search_log.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.search_log.dao.ISearch_logDao;
import kr.or.ddit.search_log.model.Search_logVo;


@Service("search_logService")
public class Search_logServiceImpl implements ISearch_logService{
	
	@Resource(name="search_logDao")
	private ISearch_logDao search_logDao;

	/**
	 * 
	 * Method : getAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 검색내역 수를 조회.
	 */
	@Override
	public int getAllCnt() {
		int search_logCnt = search_logDao.getAllCnt();
		
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
		int insertCnt = search_logDao.insertSearch_log(sVo);
		
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
		List<Search_logVo> saveList = search_logDao.getSaveList(sVo);
		
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
		Search_logVo sVo = search_logDao.getSearch_log(search_code);
		
		return sVo;
	}

	/**
	 * 
	 * Method : deleteSearch_logForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_code
	 * @return
	 * Method 설명 : 테스트 코드를 위한 검색내역 삭제.
	 */
	@Override
	public int deleteSearch_logForTest(String search_code) {
		int deleteCnt = search_logDao.deleteSearch_logForTest(search_code);
		
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
		int updateCnt = search_logDao.updateSearch_log(sVo);
		
		return updateCnt;
	}

	
	
	
}






