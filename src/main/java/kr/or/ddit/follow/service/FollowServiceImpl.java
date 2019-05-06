package kr.or.ddit.follow.service;

import java.util.List;
import java.util.Map;

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
	public List<FollowVo> select_followerList(String mem_id) {
		return followDao.select_followerList(mem_id);
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

	@Override
	public int select_followHashtagInfo(FollowVo followVo) {
		return followDao.select_followHashtagInfo(followVo);
	}

	@Override
	public int delete_personalFollow(String follow_code) {
		return followDao.delete_personalFollow(follow_code);
	}

	@Override
	public int insert_feedFollow(FollowVo followVo) {
		return followDao.insert_feedFollow(followVo);
	}
	
	@Override
	public int insert_corpFollow(FollowVo followVo) {
		return followDao.insert_corpFollow(followVo);
	}

	@Override
	public int delete_corpFollow(FollowVo followVo) {
		return followDao.delete_corpFollow(followVo);
	}

	/**
	 * Method : select_followChatList
	 * 작성자 : jin
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 채팅 초대할 유저의 팔로우들(회사,회원)
	 */
	@Override
	public List<Map<String, String>> select_followChatList(String mem_id) {
		return followDao.select_followChatList(mem_id);
	}

	@Override
	public int insert_userFollow(FollowVo followVo) {
		return followDao.insert_userFollow(followVo);
	}

	@Override
	public int delete_userFollow(FollowVo followVo) {
		return followDao.delete_userFollow(followVo);
	}

	/**
	 * Method : select_hashtagFollowList
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 유저가 팔로우한 해쉬태그 리스트 조회
	 */
	@Override
	public List<FollowVo> select_hashtagFollowList(String user_id) {
		return followDao.select_hashtagFollowList(user_id);
	}

	@Override
	public FollowVo select_followLog(FollowVo vo) {
		return followDao.select_followLog(vo);
	}

	@Override
	public List<FollowVo> select_userFollowList(String mem_id) {
		return followDao.select_userFollowList(mem_id);
	}
}
