package kr.or.ddit.corporation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.corporation.dao.ICorporationDao;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;

@Service("corporationService")
public class CorporationServiceImpl implements ICorporationService{

	@Resource(name="corporationDao")
	private ICorporationDao corporationDao;
	
	@Override
	public CorporationVo select_corpInfo(String corp_id) {
		return corporationDao.select_corpInfo(corp_id);
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
		CorporationVo cVo = corporationDao.getCorp(corp_name);
		
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
		int insertCnt = corporationDao.insert_corp(cVo);
		
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
		int deleteCnt = corporationDao.deleteForTest(corp_name);
		
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
		List<CorporationVo> corpList = corporationDao.select_allCorps();
		
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
		int corpCnt = corporationDao.getCorpCnt();
		
		return corpCnt;
	}
	
	/**
	 * 
	 * Method : searchCorp
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param keyword
	 * @return
	 * Method 설명 : 회사 검색
	 */
	@Override
	public List<CorporationVo> searchCorp(String corp_name) {
		List<CorporationVo> corpList = corporationDao.searchCorp(corp_name);
		return corpList;
	}
	
	/**
	 * 
	 * Method : update_corpInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 기업 정보 수정
	 */
	@Override
	public int update_corpInfo(CorporationVo vo) {
		return corporationDao.update_corpInfo(vo);
	}

	/**
	 * 직원의 전공
	 */
	@Override
	public List<Education_infoVo> employee_major(String corp_name) {
		List<Education_infoVo> em = corporationDao.employee_major(corp_name);
		return em;
	}

	/**
	 * 직원의 전공수
	 */
	@Override
	public List<Integer> employee_major_count(String corp_name) {
		List<Integer> emc = corporationDao.employee_major_count(corp_name);
		return emc;
	}


}
