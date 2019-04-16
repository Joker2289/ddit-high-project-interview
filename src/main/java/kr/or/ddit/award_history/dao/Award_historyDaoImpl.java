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
	
	/**
	 * Method : select_oneAward_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 수상경력 조회
	 */
	@Override
	public Award_historyVo select_oneAward_history(String award_code) {
		return sqlSessionTemplate.selectOne("award_history.select_oneAward_history", award_code);
	}
	
	/**
	 * Method : update_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_historyVo
	 * @return
	 * Method 설명 : 사용자의 수상경력 업데이트
	 */
	@Override
	public int update_award_history(Award_historyVo award_historyVo) {
		return sqlSessionTemplate.update("award_history.update_award_history", award_historyVo);
	}
	
	/**
	 * Method : delete_award_history
	 * 작성자 : jin
	 * 변경이력 :
	 * @param award_code
	 * @return
	 * Method 설명 : 사용자의 수상경력 삭제
	 */
	@Override
	public int delete_award_history(String award_code) {
		return sqlSessionTemplate.delete("award_history.delete_award_history", award_code);
	}

}
