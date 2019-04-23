package kr.or.ddit.personal_connection.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.follow.dao.IFollowDao;
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
	
	@Resource(name="followDao")
	private IFollowDao followDao;

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
	public List<UsersVo> select_followConnectionsEtc(MemberVo memberVo) {
		return personalDao.select_followConnectionsEtc(memberVo);
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
		int result =  personalDao.update_connectionReceiveApply(personalVo);
		if(result == 1) {
			FollowVo followVo = new FollowVo();
			followVo.setDivision("43");
			followVo.setMem_id(personalVo.getUser_id());
			followVo.setRef_keyword(personalVo.getReceive_id());
			followDao.insert_follow(followVo);
			
			followVo.setMem_id(personalVo.getReceive_id());
			followVo.setRef_keyword(personalVo.getUser_id());
			followDao.insert_follow(followVo);
		}
		
		return result;
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
	
	@Override
	public List<CorporationVo> recommendCorpor(PaginationVo paginationVo) {
		return personalDao.recommendCorpor(paginationVo);
	}

	@Override
	public List<UsersVo> filterSearchLocal(String user_id) {
		return personalDao.filterSearchLocal(user_id);
	}

	@Override
	public List<Career_infoVo> filterSearchPastCorpor(String user_id) {
		return personalDao.filterSearchPastCorpor(user_id);
	}

	@Override
	public List<Career_infoVo> filterSearchPresentCorpor(String user_id) {
		return personalDao.filterSearchPresentCorpor(user_id);
	}

	@Override
	public List<Career_infoVo> filtersearchjobPosition(String user_id) {
		return personalDao.filtersearchjobPosition(user_id);
	}

	@Override
	public List<Education_infoVo> filterSearchSchool(String user_id) {
		return personalDao.filterSearchSchool(user_id);
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
		return personalDao.select_oneConnections(personalVo);
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
		return personalDao.insert_connections(personalVo);
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
		int result = personalDao.delete_connections(personalVo);
		
		if(result == 1) {
			FollowVo followVo = new FollowVo();
			followVo.setDivision("43");
			followVo.setMem_id(personalVo.getUser_id());
			followVo.setRef_keyword(personalVo.getReceive_id());
			followDao.delete_follow(followVo);
		}
		
		return result;
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
		return personalDao.select_oneConnectionsWait(personalVo);
	}

	@Override
	public int insert_followCorporation(FollowVo followVo) {
		return personalDao.insert_followCorporation(followVo);
	}


	
}
