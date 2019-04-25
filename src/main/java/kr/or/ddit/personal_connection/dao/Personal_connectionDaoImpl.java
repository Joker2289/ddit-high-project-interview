package kr.or.ddit.personal_connection.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.pagination.PaginationVo;

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
	public List<UsersVo> select_connectionsName(MemberVo memberVo) {
		List<UsersVo> personalList = sqlSessionTemplate.selectList("personal.select_connectionsName", memberVo);
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
	
	@Override
	public List<UsersVo> select_followConnectionsEtc(MemberVo memberVo) {
		List<UsersVo> select_followConnectionsEtc = sqlSessionTemplate.selectList("personal.select_followConnectionsEtc", memberVo);
		return select_followConnectionsEtc;
	}

	@Override
	public List<UsersVo> select_connectionReceiveList(String receive_id) {
		List<UsersVo> selectconnectionReceive = sqlSessionTemplate.selectList("personal.select_connectionReceiveList", receive_id);
		return selectconnectionReceive;
	}

	@Override
	public List<UsersVo> select_connectionSendList(String user_id) {
		List<UsersVo> connectionSendList = sqlSessionTemplate.selectList("personal.select_connectionSendList", user_id);
		return connectionSendList;
	}

	@Override
	public int update_connectionReceiveApply(Personal_connectionVo personalVo) {
		int connectionReceiveApply = sqlSessionTemplate.update("personal.update_connectionReceiveApply", personalVo);
		return connectionReceiveApply;
	}

	@Override
	public int delete_connectionCancel(Personal_connectionVo personalVo) {
		int connectionCancel = sqlSessionTemplate.delete("personal.delete_connectionCancel", personalVo);
		return connectionCancel;
	}

	@Override
	public int allFollowCnt(FollowVo followVo) {
		int allFollowCnt = sqlSessionTemplate.selectOne("personal.allFollowCnt", followVo);
		return allFollowCnt;
	}

	@Override
	public List<UsersVo> schoolFriendsSearch(String user_id) {
		List<UsersVo> schoolSearch = sqlSessionTemplate.selectList("personal.schoolFriendsSearch", user_id);
		return schoolSearch;
	}

	@Override
	public List<CorporationVo> feedFollowCorporation(String mem_id) {
		List<CorporationVo> Corporation = sqlSessionTemplate.selectList("personal.feedFollowCorporation", mem_id);
		return Corporation;
	}

	@Override
	public List<UsersVo> feedFollowUser(String mem_id) {
		List<UsersVo> User = sqlSessionTemplate.selectList("personal.feedFollowUser", mem_id);
		return User;
	}

	@Override
	public List<HashtagVo> feedFollowHashTag(String mem_id) {
		List<HashtagVo> HashTag = sqlSessionTemplate.selectList("personal.feedFollowHashTag", mem_id);
		return HashTag;
	}

	@Override
	public List<UsersVo> recommendUsers(PaginationVo paginationVo) {
		List<UsersVo> UserList = sqlSessionTemplate.selectList("personal.recommendUsers", paginationVo);
		return UserList;
	}
	
	@Override
	public List<CorporationVo> recommendCorpor(PaginationVo paginationVo) {
		List<CorporationVo> corporList = sqlSessionTemplate.selectList("personal.recommendCorpor", paginationVo);
		return corporList;
	}

	@Override
	public List<UsersVo> filterSearchLocal(String user_id) {
		List<UsersVo> localList = sqlSessionTemplate.selectList("personal.filterSearchLocal", user_id);
		return localList;
	}

	@Override
	public List<Career_infoVo> filterSearchPastCorpor(String user_id) {
		List<Career_infoVo> PastCorporList = sqlSessionTemplate.selectList("personal.filterSearchPastCorpor", user_id);
		return PastCorporList;
	}

	@Override
	public List<Career_infoVo> filterSearchPresentCorpor(String user_id) {
		List<Career_infoVo> PresentCorporList = sqlSessionTemplate.selectList("personal.filterSearchPresentCorpor", user_id);
		return PresentCorporList;
	}

	@Override
	public List<Career_infoVo> filtersearchjobPosition(String user_id) {
		List<Career_infoVo> jobPositionList = sqlSessionTemplate.selectList("personal.filtersearchjobPosition", user_id);
		return jobPositionList;
	}

	@Override
	public List<Education_infoVo> filterSearchSchool(String user_id) {
		List<Education_infoVo> SchoolList = sqlSessionTemplate.selectList("personal.filterSearchSchool", user_id);
		return SchoolList;
	}
	
	/**
	 * Method : select_oneConnections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 나와 상대방의 일촌 확인
	 */
	@Override
	public Personal_connectionVo select_oneConnections(Personal_connectionVo personalVo) {
		return sqlSessionTemplate.selectOne("personal.select_oneConnections", personalVo);
	}
	
	/**
	 * Method : insert_connections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 일촌 신청
	 */
	@Override
	public int insert_connections(Personal_connectionVo personalVo) {
		return sqlSessionTemplate.insert("personal.insert_connections", personalVo);
	}

	/**
	 * Method : delete_connections
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 일촌 삭제
	 */
	@Override
	public int delete_connections(Personal_connectionVo personalVo) {
		return sqlSessionTemplate.delete("personal.delete_connections", personalVo);
	}

	/**
	 * Method : select_oneConnectionsWait
	 * 작성자 : jin
	 * 변경이력 :
	 * @param personalVo
	 * @return
	 * Method 설명 : 나와 상대방의 일촌 수락대기중
	 */
	@Override
	public Personal_connectionVo select_oneConnectionsWait(Personal_connectionVo personalVo) {
		return sqlSessionTemplate.selectOne("personal.select_oneConnectionsWait", personalVo);
	}

	@Override
	public int insert_followCorporation(FollowVo followVo) {
		int insert_followCorpor = sqlSessionTemplate.insert("personal.insert_followCorporation", followVo);
		return insert_followCorpor;
	}


}
