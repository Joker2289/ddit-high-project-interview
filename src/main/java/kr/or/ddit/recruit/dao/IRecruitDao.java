package kr.or.ddit.recruit.dao;

import java.util.List;

import kr.or.ddit.recruit.model.RecruitVo;

public interface IRecruitDao {

	/**
	 * 
	 * Method : insertRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param rVo
	 * @return
	 * Method 설명 : 채용공고 등록.
	 */
	int insertRecr(RecruitVo rVo);

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고 삭제.
	 */
	int deleteForTest(String recruit_code);

	/**
	 * 
	 * Method : getRecrCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고 수 조회.
	 */
	int getRecrCnt();

	/**
	 * 
	 * Method : getAllRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고 조회.
	 */
	List<RecruitVo> getAllRecr();

	/**
	 * 
	 * Method : getRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 특정 채용공고 조회.
	 */
	RecruitVo getRecr(String recruit_code);

	/**
	 * 
	 * Method : getLastViewRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저가 마지막으로 조회한 채용공고 조회.
	 */
	RecruitVo getLastViewRecr(String user_id);

	/**
	 * 
	 * Method : getRecrByLocal
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param job_local
	 * @return
	 * Method 설명 : 특정 업무지역으로 채용공고 목록 조회.
	 */
	List<RecruitVo> getRecrByLocal(String job_local);

	/**
	 * 
	 * Method : getRecrByType
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param type
	 * @return
	 * Method 설명 : 특정 업무분야로 채용공고 목록 조회.
	 */
	List<RecruitVo> getRecrByType(String type);

	
	/**
	 * 
	 * Method : getRecrCorpId
	 * 작성자 : PC18
	 * 변경이력 :
	 * @param corp_id
	 * @return
	 * Method 설명 : 특정 회사 채용공고 조회.
	 */
	List<RecruitVo> getRecrListCorp_id(String corp_id);

	/**
	 * 
	 * Method : updateRecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param rVo
	 * @return
	 * Method 설명 : 채용공고 수정.
	 */
	int updateRecr(RecruitVo rVo);

	/**
	 * 
	 * Method : searchRecrListByCorp_name
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_word
	 * @return
	 * Method 설명 : 특정 회사 이름으로 검색한 채용공고 목록 조회.
	 */
	List<RecruitVo> searchRecrListByCorp_name(String search_word);

	/**
	 * 
	 * Method : getNewList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 신규 채용공고 목록 조회.
	 */
	List<RecruitVo> getNewList();

	/**
	 * 
	 * Method : searchRecrListByJob_local
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param search_local
	 * @return
	 * Method 설명 : 특정 지역으로 검색한 채용공고 목록 조회.
	 */
	List<RecruitVo> searchRecrListByJob_local(String search_local);

	/**
	 * 
	 * Method : getAllRecrDesc
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 날짜 역순으로 전체 채용공고 조회.
	 */
	List<RecruitVo> getAllRecrDesc();

	/**
	 * 
	 * Method : getPersonalCorpId
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 유저의 일촌의 경력에 있는 회사 목록 조회.
	 */
	List<String> getPersonalCorpId(String mem_id);

	/**
	 * 
	 * Method : getPersonalUserId
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param string
	 * @return
	 * Method 설명 : 특정 채용공고의 회사에 경력이 있는 일촌 목록 조회.
	 */
	List<String> getPersonalUserId(String param);
	
	
	
	
}













