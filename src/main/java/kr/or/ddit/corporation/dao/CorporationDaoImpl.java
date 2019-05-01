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

	/**s
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

}
