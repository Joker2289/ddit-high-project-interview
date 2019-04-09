package kr.or.ddit.recommendation.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.recommendation.dao.IRecommendationDao;
import kr.or.ddit.recommendation.model.RecommendationVo;

@Service("recommendationService")
public class RecommendationServiceImpl implements IRecommendationService {

	@Resource(name="recommendationDao")
	private IRecommendationDao recommendation;
	
	/**
	 * Method : insert_recommendation
	 * 작성자 : jin
	 * 변경이력 :
	 * @param recommendationvo
	 * @return
	 * Method 설명 : 추천서 등록
	 */
	@Override
	public int insert_recommendation(RecommendationVo recommendationvo) {
		return recommendation.insert_recommendation(recommendationvo);
	}
	
	/**
	 * Method : select_recommendation
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 추천서 조회
	 */
	@Override
	public List<RecommendationVo> select_recommendation(String user_id) {
		return recommendation.select_recommendation(user_id);
	}

}
