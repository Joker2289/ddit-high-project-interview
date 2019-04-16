package kr.or.ddit.good.service;

import java.util.List;

import kr.or.ddit.good.model.GoodVo;

public interface IGoodService {

	/**
	 * Method : insert_goodInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param goodVo
	 * @return
	 * Method 설명 : 좋아요 등록
	 */
	int insert_goodInfo(GoodVo goodVo);
	
	/**
	 * Method : delete_goodInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param good_code
	 * @return
	 * Method 설명 : 좋아요 삭제
	 */
	int delete_goodInfo(GoodVo goodVo);
	
	/**
	 * Method : select_goodInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param goodVo
	 * @return
	 * Method 설명 : 좋아요 정보 조회
	 */
	List<GoodVo> select_goodInfo(String mem_id);
	
	/**
	 * Method : select_goodCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param goodVo
	 * @return
	 * Method 설명 : 게시글 좋아요 갯수
	 */
	int select_goodCount(GoodVo goodVo);
	
	/**
	 * Method : select_pushGoodMember
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param goodVo
	 * @return
	 * Method 설명 : 좋아요 한 회원 조회
	 */
	List<GoodVo> select_pushGoodMember(GoodVo goodVo);
	
	/**
	 * Method : select_pushedGoodPost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 회원이 좋아요 한 글 번호 목록 조회
	 */
	List<GoodVo> select_pushedGoodPost(String mem_id);
}
