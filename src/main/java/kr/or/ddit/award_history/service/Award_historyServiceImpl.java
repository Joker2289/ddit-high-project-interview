package kr.or.ddit.award_history.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.award_history.dao.IAward_historyDao;
import kr.or.ddit.award_history.model.Award_historyVo;

@Service("award_historyService")
public class Award_historyServiceImpl implements IAward_historyService {

	@Resource(name="award_historyDao")
	private IAward_historyDao award_historyDao;
	
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
		return award_historyDao.insert_award_history(award_historyVo);
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
		return award_historyDao.select_award_history(user_id);
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
		return award_historyDao.select_oneAward_history(award_code);
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
		return award_historyDao.update_award_history(award_historyVo);
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
		return award_historyDao.delete_award_history(award_code);
	}

}
