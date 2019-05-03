package kr.or.ddit.corporation.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.graph.GraphVo;

public interface ICorporationDao {
	
	/**
	 * 
	 * Method : select_corpInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param corp_id
	 * @return
	 * Method 설명 : 특정 회사 정보 조회
	 */
	CorporationVo select_corpInfo(String corp_id);

	/**
	 * 
	 * Method : getCorp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 회사이름으로 특정 회사 조회.
	 */
	CorporationVo getCorp(String corp_name);
	
	/**
	 * 
	 * Method : insert_corp
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param cVo
	 * @return
	 * Method 설명 : 회사 등록.
	 */
	int insert_corp(CorporationVo cVo);

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param corp_name
	 * @return
	 * Method 설명 : 테스트 코드를 위한 회사 삭제.
	 */
	int deleteForTest(String corp_name);

	/**
	 * 
	 * Method : select_allCorps
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 회사 목록 조회.
	 */
	List<CorporationVo> select_allCorps();

	/**
	 * 
	 * Method : getCorpCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 회사 수 조회.
	 */
	int getCorpCnt();
	
	/**
	 * 
	 * Method : searchCorp
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 회사 검색
	 */
	List<CorporationVo> searchCorp(String keyword);
	
	/**
	 * 
	 * Method : update_corpInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 기업 정보 수정
	 */
	int update_corpInfo(CorporationVo vo);
	
	/**
	 * 직원 전공 
	 * @param corp_name
	 * @return
	 */
	List<Education_infoVo> employee_major(String corp_name);
	
	/**
	 * 직원 전공 수
	 * @param corp_name
	 * @return
	 */
	List<Integer> employee_major_count(String corp_name);
	
	/**
	 * 회사 전체직원의 user_id
	 * @param corp_name
	 * @return
	 */
	List<Career_infoVo> employee_all(String corp_name);

	/**
	 * 회사전체직원의 user_id로 usersVo가져오기
	 * @param user_id
	 * @return
	 */
	UsersVo select_userInfo(String user_id);

	/**
	 * 회사전체직원의 user_id로 education_infoVo 가져오기
	 * @param user_id
	 * @return
	 */
	Education_infoVo employee_education(String user_id);

	/**
	 * 회사코드를 가진 유저 전체 리스트
	 * @param corp_code
	 * @return
	 */
	List<Career_infoVo> corp_code_user_list(String corp_code);

	/**
	 * 회사 코드를 가진 유저 수
	 * @param corp_code
	 * @return
	 */
	int corp_code_user_count(String corp_code);

	/**
	 * 직원 대학 수 합
	 * @param corp_code
	 * @return
	 */
	List<Integer> empl_education_count(String corp_code);

	/**
	 * 직원 학교,전공 리스트
	 * @param corp_code
	 * @return
	 */
	List<Education_infoVo> empl_university_list(String corp_code);

	/**
	 * 회사 정보로 grpahinfo
	 * @param corp_code
	 * @return
	 */
	List<GraphVo> graphInfo(String corp_code);

	/**
	 * 회사 직원 리스트
	 * @param param
	 * @return
	 */
	List<GraphVo> empl_list(GraphVo param);

	/**
	 * 회사 전공 (중복 수 증가)
	 * @param corp_code
	 * @return
	 */
	List<Integer> major_count(String corp_code);

	/**
	 * 회사 전공 리스트(중복제외)
	 * @param corp_code
	 * @return
	 */
	List<Education_infoVo> major_list(String corp_code);

	/**
	 * 직책 수 (중복 수 증가)
	 * @param corp_code
	 * @return
	 */
	List<Integer> job_position_count(String corp_code);

	/**
	 * 직책 리스트 (중복 제외)
	 * @param corp_code
	 * @return
	 */
	List<Career_infoVo> job_position_list(String corp_code);


	
}






