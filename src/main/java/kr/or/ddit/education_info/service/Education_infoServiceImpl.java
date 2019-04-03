package kr.or.ddit.education_info.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.education_info.dao.IEducation_infoDao;
import kr.or.ddit.education_info.model.Education_infoVo;

@Service("education_infoService")
public class Education_infoServiceImpl implements IEducation_infoService{

	@Resource(name="education_infoDao")
	private IEducation_infoDao educationDao;
	
	@Override
	public int insert_education_info(Education_infoVo vo) {
		return educationDao.insert_education_info(vo);
	}

	/**
	 * Method : select_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 학력 조회
	 */ 
	@Override
	public List<Education_infoVo> select_educationInfo(String user_id) {
		return educationDao.select_educationInfo(user_id);
	}

}
