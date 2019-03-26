package kr.or.ddit.post.dao;

import java.util.List;

import kr.or.ddit.post.model.PostVo;

public interface IPostDao {

	/**
	 * 
	 * Method : select_memberPost
	 * 작성자 : khk
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 특정 userId의 게시물 조회
	 */
	List<PostVo> select_memberPost(String userId);

}
