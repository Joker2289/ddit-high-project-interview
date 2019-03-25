package kr.or.ddit.search_log.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.search_log.dao.ISearch_logDao;


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

}
