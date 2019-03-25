package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.model.MemberVo;

public interface IMemberService {
	
	/**
	 * 
	 * Method : insert_member
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : Member 등록
	 */
	int insert_member(MemberVo vo);
	
	/**
	 * 
	 * Method : select_memberAllList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 Member 리스트 출력
	 */
	List<MemberVo> select_memberAllList();
	
	
	/**
	 * 
	 * Method : select_memberInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 멤버 정보검색
	 */
	MemberVo select_memberInfo(String mem_id);
	
	/**
	 * 
	 * Method : delete_member
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 회원탈퇴
	 */
	int delete_member(String mem_id);
}
