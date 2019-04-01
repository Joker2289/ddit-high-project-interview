package kr.or.ddit.search_log.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.search_log.dao.ISearch_logDao;
import kr.or.ddit.search_log.model.Search_logVo;


@Service("search_logService")
public class Search_logServiceImpl implements ISearch_logService{
	
	@Resource(name="search_logDao")
	private ISearch_logDao sLogDao;

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
		int search_logCnt = sLogDao.getAllCnt();
		
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
		int insertCnt = sLogDao.insertSearch_log(sVo);
		
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
		List<Search_logVo> saveList = sLogDao.getSaveList(sVo);
		
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
		Search_logVo sVo = sLogDao.getSearch_log(search_code);
		
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
		int deleteCnt = sLogDao.deleteSearch_logForTest(search_code);
		
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
		int updateCnt = sLogDao.updateSearch_log(sVo);
		
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
		Search_logVo lSLog = sLogDao.getLSLog(mem_id);
		
		return lSLog;
	}

	
	
	
}






