package kr.or.ddit.follow.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.follow.dao.IFollowDao;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("followService")
public class FollowServiceImpl implements IFollowService {
	
	@Resource(name="followDao")
	private IFollowDao followDao;

	@Override
	public int insert_follow(FollowVo followVo) {
		return followDao.insert_follow(followVo);
	}

	@Override
	public int delete_follow(FollowVo followVo) {
		return followDao.delete_follow(followVo);
	}

	@Override
	public List<FollowVo> select_followList(String mem_id) {
		return followDao.select_followList(mem_id); 
	}

	@Override
	public List<FollowVo> select_followKindList(PaginationVo paginationVo) {
		return followDao.select_followKindList(paginationVo);
	}
	
}
