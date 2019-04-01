package kr.or.ddit.personal_connection.service;

import java.util.List;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;

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
	
	

}
