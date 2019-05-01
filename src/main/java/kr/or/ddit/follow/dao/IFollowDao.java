package kr.or.ddit.follow.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IFollowDao {

	/**
	 * Method : insert_follow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 팔로우 정보 삽입
	 */
	int insert_follow(FollowVo followVo);
	
	/**
	 * Method : delete_follow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param follow_code
	 * @return
	 * Method 설명 : 팔로우 정보 삭제
	 */
	int delete_follow(FollowVo followVo);
	
	/**
	 * Method : select_followList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로우 목록 조회
	 */
	List<FollowVo> select_followList(String mem_id);
	
	List<FollowVo> select_followKindList(PaginationVo paginationVo);
	
	/**
	 * 
	 * Method : getFollowingCnt
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로잉 수 조회
	 */
	int getFollowingCnt(String mem_id);
	
	/**
	 * 
	 * Method : getFollowerCnt
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로워 수 조회
	 */
	int getFollowerCnt(String mem_id);
	
	/**
	 * 
	 * Method : select_followerList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로워 리스트 조회
	 */
	List<FollowVo> select_followerList(String mem_id);
	
	/**
	 * 
	 * Method : select_followingList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 팔로잉 리스트 조회
	 */
	List<FollowVo> select_followingList(String mem_id);
	
	/**
	 * Method : select_oneFollow
	 * 작성자 : jin
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 사용자와 상대방과의 팔로우 검색
	 */
	FollowVo select_oneFollow(FollowVo followVo);
	
	/**
	 * Method : select_hashtagFollowCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param ref_keyword
	 * @return
	 * Method 설명 : 해시태그 팔로워 수 조회
	 */
	int select_hashtagFollowCount(String ref_keyword);
	
	/**
	 * Method : select_followHashtagInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 태그 팔로우 유무 체크
	 */
	int select_followHashtagInfo(FollowVo followVo);
	
	/**
	* Method : delete_follow
	* 작성자 : PC09
	* 변경이력 :
	* @param follow_code
	* @return
	* Method 설명 : 연팔로우 기능
	*/
	int delete_personalFollow(String follow_code);
	
	/**
	* Method : insert_feedFollow
	* 작성자 : PC09
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 : 인맥 - 신선한 시각 팔로우
	*/
	int insert_feedFollow(FollowVo followVo);

	/**
	 * Method : inseret_corpFollow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 회사 팔로우
	 */
	int insert_corpFollow(FollowVo followVo);
	
	/**
	 * Method : delete_corpFollow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 회사 언팔로우
	 */
	int delete_corpFollow(FollowVo followVo);
	
	/**
	 * Method : select_followChatList
	 * 작성자 : jin
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 채팅 초대할 유저의 팔로우들(회사,회원)
	 */
	List<Map<String, String>> select_followChatList(String mem_id);
	
}
