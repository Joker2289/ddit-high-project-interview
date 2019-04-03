package kr.or.ddit.users.service;

import kr.or.ddit.users.model.UsersVo;

public interface IUsersService {

	/**
	 * 
	 * Method : select_userInfo
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 회원정보 조회.
	 */
	UsersVo select_userInfo(String user_id);
	
	/**
	 * 
	 * Method : insert_users
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 유저 등록
	 */
	int insert_users(UsersVo vo);
	
	/**
	 * 
	 * Method : update_userInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 유저 수정
	 */
	int update_userInfo(UsersVo vo);
	
	/**
	 * Method : select_introduce
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 간단프로필 (학력이나 경력사항)
	 */
	String select_introduce(String user_id);
}
