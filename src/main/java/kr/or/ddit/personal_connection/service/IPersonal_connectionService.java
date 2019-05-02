package kr.or.ddit.personal_connection.service;

import java.util.List;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporate_review.model.Corporate_reviewVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.salary_info.model.Salary_infoVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IPersonal_connectionService {
	
	
	
	/**
	* Method : select_connections
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 일촌 리스트 출력 - 최신순
	*/
	List<UsersVo> select_connections(MemberVo memberVo);
	
	
	
	/**
	 * Method : select_connections
	 * 작성자 : PC09
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 일촌 리스트 출력 - 이름순
	 */
	List<UsersVo> select_connectionsName(MemberVo memberVo);
	
	
	
	/**
	* Method : connections_count
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 팔로우한 일촌 수 조회
	*/
	int connections_count(MemberVo memberVo);
	
	
	
	/**
	* Method : select_followCoporation
	* 작성자 : PC09
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 :팔로우한 회사 리스트 출력
	*/
	List<CorporationVo> select_followCoporation(FollowVo followVo);
	
	
	
	/**
	* Method : coporations_count
	* 작성자 : PC09
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 : 팔로우한 회사 수 조회
	*/
	int coporations_count(FollowVo followVo);
	
	
	
	/**
	* Method : select_followConnections
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 팔로우한 일촌 리스트 조회
	*/
	List<UsersVo> select_followConnections(MemberVo memberVo);
	
	
	
	/**
	* Method : select_followHashTag
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 팔로우한 해시태그 리스트 조회
	*/
	List<FollowVo> select_followHashTag(MemberVo memberVo);
	
	
	
	/**
	* Method : select_followConnectionsOutside
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 팔로우한 인백 밖 리스트 조회
	*/
	List<UsersVo> select_followConnectionsEtc(MemberVo memberVo);
	
	
	
	/**
	* Method : select_connectionReceive
	* 작성자 : PC09
	* 변경이력 :
	* @param receive_id
	* @return
	* Method 설명 : 받은 일촌 신청 리스트 조회
	*/
	List<UsersVo> select_connectionReceiveList(String receive_id);
	
	
	
	/**
	* Method : select_connectionSendList
	* 작성자 : PC09
	* 변경이력 :
	* @param user_id
	* @return
	* Method 설명 : 보낸 일촌 신청 리스트 조회
	*/
	List<UsersVo> select_connectionSendList(String user_id);
	
	
	
	/**
	* Method : update_connectionReceiveApply
	* 작성자 : PC09
	* 변경이력 :
	* @param personalVo
	* @return
	* Method 설명 : 받은 일촌 신청 수락
	*/
	int update_connectionReceiveApply(Personal_connectionVo personalVo);
	
	
	
	/**
	* Method : delete_connectionCancel
	* 작성자 : PC09
	* 변경이력 :
	* @param personalVo
	* @return
	* Method 설명 : 받은/보낸 일촌 신청 거절(취소)
	*/
	int delete_connectionCancel(Personal_connectionVo personalVo);
	
	
	
	/**
	* Method : allFollowCnt
	* 작성자 : PC09
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 : 전체(회사,해시태그,인맥,인맥밖) 팔로우한 수 조회
	*/
	int allFollowCnt(FollowVo followVo);
	
	
	
	/**
	* Method : schoolSearch
	* 작성자 : PC09
	* 변경이력 :
	* @param user_id
	* @return
	* Method 설명 : 아는 동문 찾기
	*/
	List<UsersVo> schoolFriendsSearch(String user_id);
	
	
	
	/**
	* Method : feedFollowCorporation
	* 작성자 : PC09
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 회사
	*/
	List<CorporationVo> feedFollowCorporation(String mem_id);
	
	
	
	/**
	* Method : feedFollowUser
	* 작성자 : PC09
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 유저
	*/
	List<UsersVo> feedFollowUser(String mem_id);
	
	
	
	/**
	* Method : feedFollowHashTag
	* 작성자 : PC09
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 해시태그
	*/
	List<HashtagVo> feedFollowHashTag(String mem_id);
	
	
	
	/**
	* Method : recommendUsers
	* 작성자 : PC09
	* 변경이력 :
	* @param user_id
	* @return
	* Method 설명 : 회원님을 위한 맞춤 추천 - 사람(users)
	*/
	List<UsersVo> recommendUsers(PaginationVo paginationVo);
	
	
	
	/**
	* Method : recommendCorpor
	* 작성자 : PC09
	* 변경이력 :
	* @param paginationVo
	* @return
	* Method 설명 : 회원님을 위한 맞춤 추천 - 회사(corporation)
	*/
	List<CorporationVo> recommendCorpor(PaginationVo paginationVo);
	
	
	
	/**
	* Method : filterSearchLocal
	* 작성자 : PC09
	* 변경이력 :
	* @param user_id
	* @return
	* Method 설명 : 필터검색-지역
	*/
	List<UsersVo> filterSearchLocal(String user_id);
	
	
	
	/**
	 * Method : filterSearchPastCorpor
	 * 작성자 : user
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 필터로 검색 - 전 직장 검색
	 */
	List<Career_infoVo> filterSearchPastCorpor(String user_id);
	
	
	
	/**
	 * Method : filterSearchPresentCorpor
	 * 작성자 : user
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 필터로 검색 - 현 직장 검색
	 */
	List<Career_infoVo> filterSearchPresentCorpor(String user_id);
	
	
	
	/**
	 * Method : filtersearchjobPosition
	 * 작성자 : user
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 필터로 검색 - 직군 검색
	 */
	List<Career_infoVo> filtersearchjobPosition(String user_id);
	
	
	
	/**
	 * Method : filterSearchSchool
	 * 작성자 : user
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 필터로 검색 - 학교 검색
	 */
	List<Education_infoVo> filterSearchSchool(String user_id);
	
	/**
	 * Method : select_oneConnections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 나와 상대방의 일촌 확인
	 */
	Personal_connectionVo select_oneConnections(Personal_connectionVo personalVo);
	
	/**
	 * Method : select_oneConnectionsWait
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 나와 상대방의 일촌 수락대기중
	 */
	Personal_connectionVo select_oneConnectionsWait(Personal_connectionVo personalVo);
	
	/**
	 * Method : insert_connections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 일촌 신청
	 */
	int insert_connections(Personal_connectionVo personalVo);
	
	/**
	 * Method : delete_connections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 일촌 삭제
	 */
	int delete_connections(Personal_connectionVo personalVo);
	
	
	
	/**
	* Method : insert_followCorporation
	* 작성자 : PC09
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 : 회사 팔로우
	*/
	int insert_followCorporation(FollowVo followVo);
	
	
	
	/**
	* Method : insert_companyReview
	* 작성자 : PC09
	* 변경이력 :
	* @param reviewVo
	* @return
	* Method 설명 : companyReview - 기업 리뷰 작성
	*/
	int insert_companyReview(Corporate_reviewVo reviewVo);
	
	
	
	/**
	* Method : select_companyReview
	* 작성자 : PC09
	* 변경이력 :
	* @param corp_id
	* @return
	* Method 설명 : companyReview - 기업 리뷰 리스트 출력
	*/
	List<Corporate_reviewVo> select_companyReview(PaginationVo paginationVo);



	/**
	 * Method : delete_connections_waiting
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 수락 대기중인 일촌신청 삭제
	 */
	int delete_connections_waiting(Personal_connectionVo personalVo);
	
	
	
	/**
	* Method : insert_companySalary
	* 작성자 : PC09
	* 변경이력 :
	* @param salaryVo
	* @return
	* Method 설명 : companyReview - 연봉 정보 작성
	*/
	int insert_companySalary(Salary_infoVo salaryVo);
	
	
	
	/**
	* Method : select_companySalary
	* 작성자 : PC09
	* 변경이력 :
	* @param paginationVo
	* @return
	* Method 설명 : companySalary - 기업 연봉 리스트 출력
	*/
	List<Salary_infoVo> select_companySalary(String corp_id);
	
	
	

}
