package kr.or.ddit.award_history.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.award_history.model.Award_historyVo;

@Repository("award_historyDao")
public class Award_historyDaoImpl implements IAward_historyDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_historyVo
	 * @return
	 * Method 설명 : 수상경력 등록
	 */
	@Override
	public int insert_award_history(Award_historyVo award_historyVo) {
		return sqlSessionTemplate.insert("award_history.insert_award_history", award_historyVo);
	}
	
	/**
	 * Method : select_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 수상경력 조회
	 */
	@Override
	public List<Award_historyVo> select_award_history(String user_id) {
		return sqlSessionTemplate.selectList("award_history.select_award_history", user_id);
	}

}
