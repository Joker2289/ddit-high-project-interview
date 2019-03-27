package kr.or.ddit.personal_connection.dao;

import java.util.List;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;

public interface IPersonal_connectionDao {
	
	
	
	/**
	* Method : select_connections
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 일촌 리스트 출력
	*/
	List<Personal_connectionVo> select_connections(MemberVo memberVo);
	
	
	/**
	* Method : connections_count
	* 작성자 : PC09
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 일촌 수 조회
	*/
	int connections_count(MemberVo memberVo);

}
