package kr.or.ddit.recommendation.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.recommendation.model.RecommendationVo;

@Repository("recommendationDao")
public class RecommendationDaoImpl implements IRecommendationDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		return sqlSessionTemplate.insert("recommendation.insert_recommendation", recommendationvo);
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
		return sqlSessionTemplate.selectList("recommendation.select_recommendation", user_id);
	}

}
