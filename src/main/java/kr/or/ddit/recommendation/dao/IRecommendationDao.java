package kr.or.ddit.recommendation.dao;

import java.util.List;

import kr.or.ddit.recommendation.model.RecommendationVo;

public interface IRecommendationDao {
	
	/**
	 * Method : insert_recommendation
	 * 작성자 : jin
	 * 변경이력 :
	 * @param recommendationvo
	 * @return
	 * Method 설명 : 추천서 등록
	 */
	int insert_recommendation(RecommendationVo recommendationvo);
	
	/**
	 * Method : select_recommendation
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 추천서 조회
	 */
	List<RecommendationVo> select_recommendation(String user_id);
	
}
