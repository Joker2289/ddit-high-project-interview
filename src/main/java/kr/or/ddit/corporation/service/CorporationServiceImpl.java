package kr.or.ddit.corporation.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.corporation.dao.ICorporationDao;
import kr.or.ddit.corporation.model.CorporationVo;

@Service("corporationService")
public class CorporationServiceImpl implements ICorporationService{

	@Resource(name="corporationDao")
	private ICorporationDao corporationDao;
	
	@Override
	public CorporationVo select_corpInfo(String corp_id) {
		return corporationDao.select_corpInfo(corp_id);
	}

}
