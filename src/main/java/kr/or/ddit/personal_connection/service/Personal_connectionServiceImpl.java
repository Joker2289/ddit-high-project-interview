package kr.or.ddit.personal_connection.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.dao.IPersonal_connectionDao;
import kr.or.ddit.users.model.UsersVo;

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

	
}
