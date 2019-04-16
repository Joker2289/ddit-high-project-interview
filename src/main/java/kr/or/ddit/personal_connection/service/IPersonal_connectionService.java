package kr.or.ddit.personal_connection.service;

import java.util.List;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IPersonal_connectionService {
	
	
	
	/**
	* Method : select_connections
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 일촌 리스트 출력
	*/
	List<UsersVo> select_connections(MemberVo memberVo);
	
	
	
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
	* Method : filterSearchLocal
	* 작성자 : PC09
	* 변경이력 :
	* @param user_id
	* @return
	* Method 설명 : 필터검색-지역
	*/
	List<UsersVo> filterSearchLocal(String user_id);
	
	
	

}
