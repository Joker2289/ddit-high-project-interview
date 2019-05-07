package kr.or.ddit.corporation.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.chart.ChartVo;
import kr.or.ddit.util.chart.Employee_listVo;
import kr.or.ddit.util.pagination.PaginationVo;

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
	
	/**
	 * 
	 * Method : searchCorp
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 회사 검색
	 */
	@Override
	public List<CorporationVo> searchCorp(String corp_name) {
		List<CorporationVo> corpList = new ArrayList<CorporationVo>();
		corpList = sqlSessionTemplate.selectList("corp.searchCorp", corp_name);
		
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
		return sqlSessionTemplate.update("corp.update_corpInfo", vo);
	}

	/**
	 * 직원 전공
	 */
	public List<Education_infoVo> employee_major(String corp_name){
		List<Education_infoVo> em = new ArrayList<Education_infoVo>();
		em = sqlSessionTemplate.selectList("corp.employee_major", corp_name);
		return em;
	}
	
	
	/**
	 * 직원 전공 수
	 */
	public List<Integer> employee_major_count(String corp_name){
		List<Integer> emc = new ArrayList<Integer>();
		emc = sqlSessionTemplate.selectList("corp.employee_major_count", corp_name);
		return emc;
	}

	/**
	 * 회사직원의 user_id
	 */
	@Override
	public List<Career_infoVo> employee_all(String corp_name) {
		List<Career_infoVo> ea = new ArrayList<Career_infoVo>();
		ea = sqlSessionTemplate.selectList("corp.employee_all", corp_name);
		return ea;
	}

	@Override
	public UsersVo select_userInfo(String user_id) {
		UsersVo select_userInfo = new UsersVo();
		select_userInfo = sqlSessionTemplate.selectOne("corp.select_userInfo",user_id);
		return select_userInfo;
	}

	@Override
	public Education_infoVo employee_education(String user_id) {
		Education_infoVo employee_education = new Education_infoVo();
		employee_education = sqlSessionTemplate.selectOne("corp.employee_education", user_id);
		return employee_education;
	}

	/**
	 * 회사코드를 가진 유저 전체리스트
	 */
	@Override
	public List<Career_infoVo> corp_code_user_list(String corp_code) {
		List<Career_infoVo> corp_code_user_list = new ArrayList<Career_infoVo>();
		corp_code_user_list = sqlSessionTemplate.selectList("corp.corp_code_user_list", corp_code);
		return corp_code_user_list;
	}

	/**
	 * 회사코드를 가진 유저 수
	 */
	@Override
	public int corp_code_user_count(String corp_code) {
		int corp_code_user_count = sqlSessionTemplate.selectOne("corp.corp_code_user_count", corp_code);
		return corp_code_user_count;
	}

	/**
	 * 직원 대학교수
	 */
	@Override
	public List<Integer> empl_education_count(String corp_code) {
		List<Integer> empl_education_count =  sqlSessionTemplate.selectList("corp.empl_education_count", corp_code);
		return empl_education_count;
	}

	@Override
	public List<Education_infoVo> empl_university_list(String corp_code) {
		List<Education_infoVo> empl_university_list = new ArrayList<Education_infoVo>();
		empl_university_list = sqlSessionTemplate.selectList("corp.empl_university_list", corp_code);
		return empl_university_list;
	}

	/**
	 * 회사정보로 graphinfo
	 */
	@Override
	public List<ChartVo> graphInfo(String corp_code) {
		return sqlSessionTemplate.selectList("corp.graphInfo", corp_code);
	}

	/**
	 * 회사 직원 리스트
	 */
	@Override
	public List<ChartVo> empl_list(ChartVo param) {
		return sqlSessionTemplate.selectList("corp.empl_list", param);
	}

	/**
	 * 직원 전공 수 (중복 수 증가)
	 */
	@Override
	public List<Integer> major_count(String corp_code) {
		return sqlSessionTemplate.selectList("corp.major_count", corp_code);
	}


	/**
	 * 직책 수 (중복 수 증가)
	 */
	@Override
	public List<Integer> job_position_count(String corp_code) {
		return sqlSessionTemplate.selectList("corp.job_position_count", corp_code);
	}

	
	
	//정권
	
	@Override
	public List<ChartVo> job_position_list(String corp_code) {
		return sqlSessionTemplate.selectList("corp.job_position_list", corp_code);
	}

	@Override
	public List<ChartVo> school_name_list(String corp_code) {
		return sqlSessionTemplate.selectList("corp.school_name_list", corp_code);
	}

	@Override
	public List<ChartVo> major_list(String corp_code) {
		return sqlSessionTemplate.selectList("corp.major_list", corp_code);
	}

	@Override
	public List<ChartVo> ability_list(String corp_code) {
		return sqlSessionTemplate.selectList("corp.ability_list", corp_code);
	}
	
	@Override
	public List<Employee_listVo> select_employAllList(String corp_code) {
		return sqlSessionTemplate.selectList("corp.select_employAllList", corp_code);
	}

	@Override
	public List<Employee_listVo> select_employJobPositionList(Employee_listVo vo) {
		return sqlSessionTemplate.selectList("corp.select_employJobPositionList", vo);
	}

	@Override
	public List<Employee_listVo> select_employSchoolNameList(Employee_listVo vo) {
		return sqlSessionTemplate.selectList("corp.select_employSchoolNameList", vo);
	}

	@Override
	public List<Employee_listVo> select_employMajorList(Employee_listVo vo) {
		return sqlSessionTemplate.selectList("corp.select_employMajorList", vo);
	}

	@Override
	public List<Employee_listVo> select_employAbilityList(Employee_listVo vo) {
		return sqlSessionTemplate.selectList("corp.select_employAbilityList", vo);
	}

	@Override
	public Career_infoVo select_employInfo(Career_infoVo vo) {
		return sqlSessionTemplate.selectOne("corp.select_employInfo", vo);
	}


}
