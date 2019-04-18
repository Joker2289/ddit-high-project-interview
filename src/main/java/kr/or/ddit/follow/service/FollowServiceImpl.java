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

	@Override
	public int getFollowingCnt(String mem_id) {
		return followDao.getFollowingCnt(mem_id);
	}

	@Override
	public int getFollowerCnt(String mem_id) {
		return followDao.getFollowerCnt(mem_id);
	}
	
	@Override
	public List<FollowVo> select_followingList(String mem_id) {
		return followDao.select_followingList(mem_id);
	}
	
	/**
	 * Method : select_oneFollow
	 * 작성자 : jin
	 * 변경이력 :
	 * @param followVo
	 * @return
	 * Method 설명 : 사용자와 상대방과의 팔로우 검색
	 */
	@Override
	public FollowVo select_oneFollow(FollowVo followVo) {
		return followDao.select_oneFollow(followVo);
	}

	@Override
	public int select_hashtagFollowCount(String ref_keyword) {
		return followDao.select_hashtagFollowCount(ref_keyword);
	}

}
