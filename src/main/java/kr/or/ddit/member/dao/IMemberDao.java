package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.model.MemberVo;

public interface IMemberDao {
	
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
}
