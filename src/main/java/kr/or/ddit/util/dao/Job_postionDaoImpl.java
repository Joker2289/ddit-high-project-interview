package kr.or.ddit.util.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.util.model.Job_positionVo;

@Repository("job_positionDao")
public class Job_postionDaoImpl implements IJob_positionDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Job_positionVo> searchPosition(String keyword) {
		return sqlSession.selectList("job_position.searchPosition", keyword);
	}

}
