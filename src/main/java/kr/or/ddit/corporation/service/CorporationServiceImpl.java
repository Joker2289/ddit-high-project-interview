package kr.or.ddit.corporation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.dao.ICorporationDao;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.chart.ChartVo;
import kr.or.ddit.util.chart.Employee_listVo;
import kr.or.ddit.util.pagination.PaginationVo;

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

	/** 회사 직원의 user_id
	 * 
	 */
	@Override
	public List<Career_infoVo> employee_all(String corp_name) {
		List<Career_infoVo> ea  = corporationDao.employee_all(corp_name);
		return ea;
	}

	@Override
	public UsersVo select_userInfo(String user_id) {
		UsersVo select_userInfo = corporationDao.select_userInfo(user_id);
		return select_userInfo;
		
	}

	@Override
	public Education_infoVo employee_education(String user_id) {
		Education_infoVo employee_education = corporationDao.employee_education(user_id);
		return employee_education;
	}

	/**
	 * 회사 코드를 가진 유저 리스트
	 */
	@Override
	public List<Career_infoVo> corp_code_user_list(String corp_code) {
		List<Career_infoVo> corp_code_user_list = corporationDao.corp_code_user_list(corp_code);
		return corp_code_user_list;
	}

	/**
	 * 회사 코드를 가진 유저 수
	 */
	@Override
	public int corp_code_user_count(String corp_code) {
		int corp_code_user_count = corporationDao.corp_code_user_count(corp_code);
		return corp_code_user_count;
	}

	/**
	 * 직원들의 대학교 수 합
	 */
	@Override
	public List<Integer> empl_education_count(String corp_code) {
		List<Integer> empl_education_count = corporationDao.empl_education_count(corp_code);
		return empl_education_count;
	}

	@Override
	public List<Education_infoVo> empl_university_list(String corp_code) {
		List<Education_infoVo> empl_university_list = corporationDao.empl_university_list(corp_code);
		return empl_university_list;
	}

	/**
	 * 회사 정보로  graphinfo
	 */
	@Override
	public List<ChartVo> graphInfo(String corp_code) {
		List<ChartVo> graphInfo = corporationDao.graphInfo(corp_code);
		return graphInfo;
	}

	/**
	 * 회사 직원 리스트
	 */
	@Override
	public List<ChartVo> empl_list(ChartVo param) {
		List<ChartVo> empl_list = corporationDao.empl_list(param);
		return empl_list;
	}

	/**
	 * 전공 수 (중복 수 증가)
	 */
	@Override
	public List<Integer> major_count(String corp_code) {
		List<Integer> major_count = corporationDao.major_count(corp_code);
		return major_count;
	}


	/**
	 * 직책 수 (중복 수 증가)
	 */
	@Override
	public List<Integer> job_position_count(String corp_code) {
		List<Integer> job_position_count = corporationDao.job_position_count(corp_code);
		return job_position_count;
	}

	
	
	//정권----------------------------------------------------------
	@Override
	public List<ChartVo> job_position_list(String corp_code) {
		return corporationDao.job_position_list(corp_code);
	}

	@Override
	public List<ChartVo> school_name_list(String corp_code) {
		return corporationDao.school_name_list(corp_code);
	}

	@Override
	public List<ChartVo> major_list(String corp_code) {
		return corporationDao.major_list(corp_code);
	}
	
	@Override
	public List<ChartVo> ability_list(String corp_code) {
		return corporationDao.ability_list(corp_code);
	}

	@Override
	public List<Employee_listVo> select_employAllList(String corp_code) {
		return corporationDao.select_employAllList(corp_code);
	}

	@Override
	public List<Employee_listVo> select_employJobPositionList(Employee_listVo vo) {
		return corporationDao.select_employJobPositionList(vo);
	}

	@Override
	public List<Employee_listVo> select_employSchoolNameList(Employee_listVo vo) {
		return corporationDao.select_employSchoolNameList(vo);
	}

	@Override
	public List<Employee_listVo> select_employMajorList(Employee_listVo vo) {
		return corporationDao.select_employMajorList(vo);
	}

	@Override
	public List<Employee_listVo> select_employAbilityList(Employee_listVo vo) {
		return corporationDao.select_employAbilityList(vo);
	}

	


}
