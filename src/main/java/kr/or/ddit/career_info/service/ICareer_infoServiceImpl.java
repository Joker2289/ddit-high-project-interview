package kr.or.ddit.career_info.service;

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
}
