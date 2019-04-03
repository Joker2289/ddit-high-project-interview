package kr.or.ddit.personal_connection.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;

@Repository("personalDao")
public class Personal_connectionDaoImpl implements IPersonal_connectionDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<UsersVo> select_connections(MemberVo memberVo) {
		List<UsersVo> personalList =
				sqlSessionTemplate.selectList("personal.select_connections",memberVo);
		return personalList;
	}

	@Override
	public int connections_count(MemberVo memberVo) {
		int connections_count = sqlSessionTemplate.selectOne("personal.connections_count" , memberVo);
		return connections_count;
	}

	@Override
	public List<CorporationVo> select_followCoporation(FollowVo followVo) {
		List<CorporationVo> followCoporation = sqlSessionTemplate.selectList("personal.select_followCoporation" , followVo);
		return followCoporation;
	}

	@Override
	public int coporations_count(FollowVo followVo) {
		int coporations_count = sqlSessionTemplate.selectOne("personal.coporations_count", followVo);
		return coporations_count;
	}

	@Override
	public List<UsersVo> select_followConnections(MemberVo memberVo) {
		List<UsersVo> followConnections = sqlSessionTemplate.selectList("personal.select_followConnections", memberVo);
		return followConnections;
	}

	@Override
	public List<FollowVo> select_followHashTag(MemberVo memberVo) {
		List<FollowVo> select_followHashTag = sqlSessionTemplate.selectList("personal.select_followHashTag", memberVo);
		return select_followHashTag;
	}



}
