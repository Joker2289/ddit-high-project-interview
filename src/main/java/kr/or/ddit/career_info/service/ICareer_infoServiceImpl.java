package kr.or.ddit.career_info.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.dao.ICarrer_infoDao;
import kr.or.ddit.career_info.model.Career_infoVo;

@Service("carrer_infoService")
public class ICarrer_infoServiceImpl implements ICarrer_infoService{
	
	@Resource(name="carrer_infoDao")
	private ICarrer_infoDao carrerDao;

	@Override
	public int insert_carrer_info(Career_infoVo vo) {
		return carrerDao.insert_carrer_info(vo);
	}
}
