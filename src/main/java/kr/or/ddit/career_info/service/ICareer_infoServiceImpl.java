package kr.or.ddit.career_info.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.dao.ICareer_infoDao;
import kr.or.ddit.career_info.model.Career_infoVo;

@Service("career_infoService")
public class ICareer_infoServiceImpl implements ICareer_infoService{
	
	@Resource(name="career_infoDao")
	private ICareer_infoDao careerDao;

	@Override
	public int insert_career_info(Career_infoVo vo) {
		return careerDao.insert_career_info(vo);
	}

	/**
	 * Method : select_careerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	@Override
	public List<Career_infoVo> select_careerInfo(String user_id) {
		return careerDao.select_careerInfo(user_id);
	}
}
