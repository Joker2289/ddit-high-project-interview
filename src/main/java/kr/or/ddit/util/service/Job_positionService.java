package kr.or.ddit.util.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.util.dao.IJob_positionDao;
import kr.or.ddit.util.model.Job_positionVo;

@Service("job_positionService")
public class Job_positionService implements IJob_positionService{

	@Resource(name="job_positionDao")
	private IJob_positionDao jpDao;
	
	@Override
	public List<Job_positionVo> searchPosition(String keyword) {
		return jpDao.searchPosition(keyword);
	}

}
