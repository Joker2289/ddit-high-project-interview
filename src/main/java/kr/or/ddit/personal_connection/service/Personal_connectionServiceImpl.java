package kr.or.ddit.personal_connection.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.dao.IPersonal_connectionDao;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("personalService")
public class Personal_connectionServiceImpl implements IPersonal_connectionService {
	
	@Resource(name="personalDao")
	private IPersonal_connectionDao personalDao;

	@Override
	public List<UsersVo> select_connections(MemberVo memberVo) {
		return personalDao.select_connections(memberVo);
	}

	@Override
	public int connections_count(MemberVo memberVo) {
		return personalDao.connections_count(memberVo);
	}

	@Override
	public List<CorporationVo> select_followCoporation(FollowVo followVo) {
		return personalDao.select_followCoporation(followVo);
	}

	@Override
	public int coporations_count(FollowVo followVo) {
		return personalDao.coporations_count(followVo);
	}

	@Override
	public List<UsersVo> select_followConnections(MemberVo memberVo) {
		return personalDao.select_followConnections(memberVo);
	}

	@Override
	public List<FollowVo> select_followHashTag(MemberVo memberVo) {
		return personalDao.select_followHashTag(memberVo);
	}

	@Override
	public List<UsersVo> select_connectionReceiveList(String receive_id) {
		return personalDao.select_connectionReceiveList(receive_id);
	}

	@Override
	public List<UsersVo> select_connectionSendList(String user_id) {
		return personalDao.select_connectionSendList(user_id);
	}

	@Override
	public int update_connectionReceiveApply(Personal_connectionVo personalVo) {
		return personalDao.update_connectionReceiveApply(personalVo);
	}

	@Override
	public int delete_connectionCancel(Personal_connectionVo personalVo) {
		return personalDao.delete_connectionCancel(personalVo);
	}

	@Override
	public int allFollowCnt(FollowVo followVo) {
		return personalDao.allFollowCnt(followVo);
	}

	@Override
	public List<UsersVo> schoolFriendsSearch(String user_id) {
		return personalDao.schoolFriendsSearch(user_id);
	}

	@Override
	public List<CorporationVo> feedFollowCorporation(String mem_id) {
		return personalDao.feedFollowCorporation(mem_id);
	}

	@Override
	public List<UsersVo> feedFollowUser(String mem_id) {
		return personalDao.feedFollowUser(mem_id);
	}

	@Override
	public List<HashtagVo> feedFollowHashTag(String mem_id) {
		return personalDao.feedFollowHashTag(mem_id);
	}

	@Override
	public List<UsersVo> recommendUsers(PaginationVo paginationVo) {
		return personalDao.recommendUsers(paginationVo);
	}

	
}
