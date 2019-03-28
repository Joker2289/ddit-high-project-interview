package kr.or.ddit.education_info.service;

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

}
