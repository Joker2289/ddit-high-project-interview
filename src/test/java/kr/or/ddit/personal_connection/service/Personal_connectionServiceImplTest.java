package kr.or.ddit.personal_connection.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.hashtag.model.HashtagVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class Personal_connectionServiceImplTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(Personal_connectionServiceImplTest.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService;

	
	/**
	* Method : testSelect_connections
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 :일촌 리스트 조회
	*/
	@Test
	public void testSelect_connections() {
		
		/***Given***/
		MemberVo membervo = new MemberVo();
		membervo.setMem_id("lhh");
		
		/***When***/
		List<UsersVo> personalList =
				personalService.select_connections(membervo);

		/***Then***/
		for(UsersVo usersvoList : personalList) {
			logger.debug("usersvoList  {}" , usersvoList);
		}
		assertTrue(1 <= personalList.size());
		
	}
	
	
	
	/**
	* Method : testConnections_count
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 일촌 수 조회
	*/
	@Test
	public void testConnections_count() {
		
		/***Given***/
		MemberVo membervo = new MemberVo();
		membervo.setMem_id("lhh");
		
		/***When***/
		int connections_count = personalService.connections_count(membervo);

		/***Then***/
		assertNotNull(membervo);
		//assertEquals(3, connections_count);
		
	}
	
	
	
	/**
	* Method : testCoporations_count
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 회사 수 조회
	*/
	@Test
	public void testCoporations_count() {
		
		/***Given***/
		FollowVo followVo = new FollowVo();
		followVo.setDivision("11");
		followVo.setMem_id("lhh");
		
		/***When***/
		int count = personalService.coporations_count(followVo);

		/***Then***/
		assertNotNull(followVo);
		assertEquals(7, count);
		
	}
	
	
	
	/**
	* Method : testSelect_followCoporation
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 회사 리스트 조회
	*/
	@Test
	public void testSelect_followCoporation() {
		
		/***Given***/
		FollowVo followVo = new FollowVo();
		followVo.setMem_id("lhh");
		followVo.setDivision("11");
		
		/***When***/
		List<CorporationVo> corporationList =
				personalService.select_followCoporation(followVo);
		for(CorporationVo list : corporationList) {
			logger.debug("list** {}" , list);
		}

		/***Then***/
		assertNotNull(corporationList);
		
	}
	
	
	
	/**
	* Method : testSelect_followConnections
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 일촌 리스트 조회
	*/
	@Test
	public void testSelect_followConnections() {
		
		/***Given***/
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("lhh");
		
		/***When***/
		List<UsersVo> connectionList =
				personalService.select_followConnections(memberVo);
		for(UsersVo usersVo : connectionList) {
			logger.debug("usersVo** {}" , usersVo);
		}

		/***Then***/
		assertNotNull(connectionList);
		
	}
	
	
	
	/**
	* Method : testSelect_followHashTag
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 해시태그 리스트 조회
	*/
	@Test
	public void testSelect_followHashTag() {
		
		/***Given***/
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("lhh");
		
		/***When***/
		List<FollowVo> hashTagList =
				personalService.select_followHashTag(memberVo);
		for(FollowVo hashTag : hashTagList) {
			logger.debug("hashTag** {}" , hashTag);
		}

		/***Then***/
		assertNotNull(hashTagList);
		
	}
	
	
	
	/**
	* Method : testSelect_connectionReceive
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 받은 일촌 신청 리스트 조회
	*/
	@Test
	public void testSelect_connectionReceiveList() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String receive_id = usersVo.getUser_id();
		
		/***When***/
		List<UsersVo> receiveLsit = 
				personalService.select_connectionReceiveList(receive_id);
		for(UsersVo list : receiveLsit) {
			logger.debug("list++ {}" , list);
		}

		/***Then***/
		assertNotNull(receiveLsit);
		
	}
	
	
	
	/**
	* Method : testSelect_connectionSendList
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 보낸 일촌 신청 리스트 조회
	*/
	@Test
	public void testSelect_connectionSendList() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String user_id = usersVo.getUser_id();
		
		/***When***/
		List<UsersVo> sendList = personalService.select_connectionSendList(user_id);
		for(UsersVo list : sendList) {
			logger.debug("list+++ {}" , list);
		}

		/***Then***/
		assertNotNull(sendList);
		
	}
	
	
	
	/**
	* Method : testUpdate_connectionReceiveApply
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 받은 일촌 신청 수락
	*/
	@Test
	public void testUpdate_connectionReceiveApply() {
		
		/***Given***/
		Personal_connectionVo personalVo = new Personal_connectionVo();
		personalVo.setReceive_id("brown");
		personalVo.setUser_id("kim");
		
		/***When***/
		int update = personalService.update_connectionReceiveApply(personalVo);

		/***Then***/
		assertEquals(update, 0);
		
	}
	
	
	
	/**
	* Method : testDelete_connectionCancel
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 받은/보낸 일촌 신청 거절(취소)
	*/
	//@Test
	public void testDelete_connectionCancel() {
		
		/***Given***/
		Personal_connectionVo personalVo = new Personal_connectionVo();
		personalVo.setReceive_id("brown");
		personalVo.setUser_id("lhh");
		
		/***When***/
		int delete = personalService.delete_connectionCancel(personalVo);

		/***Then***/
		assertEquals(delete, 1);
		
	}
	
	
	
	/**
	* Method : testAllFollowCount
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 전체(회사,해시태그,인맥,인맥밖) 팔로우한 수 조회
	*/
	@Test
	public void testAllFollowCount() {
		
		/***Given***/
		FollowVo followVo = new FollowVo();
		followVo.setMem_id("lhh");
		
		/***When***/
		int allFollowCount = personalService.allFollowCnt(followVo);

		/***Then***/
		assertNotNull(followVo);
		assertEquals(17, allFollowCount);
		
	}
	
	
	
	/**
	* Method : testSchoolFriendsSearch
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 아는 동문 찾기
	*/
	@Test
	public void testSchoolFriendsSearch() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String user_id = usersVo.getUser_id();
		
		/***When***/
		List<UsersVo> friendList = personalService.schoolFriendsSearch(user_id);
		for(UsersVo list : friendList) {
			logger.debug("list&& {}" , list);
		}

		/***Then***/
		assertNotNull(friendList);
		
	}
	
	
	
	/**
	* Method : testFeedFollowCorporation
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 회사
	*/
	@Test
	public void testFeedFollowCorporation() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String mem_id = usersVo.getUser_id();
		
		/***When***/
		List<CorporationVo> followList = personalService.feedFollowCorporation(mem_id);
		for(CorporationVo list : followList) {
			logger.debug("list!! {}" , list);
		}

		/***Then***/
		assertNotNull(followList);
		
	}
	
	
	
	/**
	* Method : testFeedFollowUser
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 유저
	*/
	@Test
	public void testFeedFollowUser() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String mem_id = usersVo.getUser_id();
		
		/***When***/
		List<UsersVo> userList = personalService.feedFollowUser(mem_id);
		for(UsersVo list :userList) {
			logger.debug("list!! {}" , list);
		}

		/***Then***/
		assertNotNull(userList);
		
	}
	
	
	
	/**
	* Method : testFeedFollowHashTag
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 인맥 - 회사 - 신선한 시각 필로우에 출력되는 해시태그
	*/
	@Test
	public void testFeedFollowHashTag() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String mem_id = usersVo.getUser_id();
		
		/***When***/
		List<HashtagVo> hashTagList = personalService.feedFollowHashTag(mem_id);
		for(HashtagVo list : hashTagList) {
			logger.debug("list!! {}", list);
		}

		/***Then***/
		assertNotNull(hashTagList);
		
	}
	
	
	
	/**
	* Method : testRecommendUsers
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 회원님을 위한 맞춤 추천 - 사람(users)
	*/
	@Test
	public void testRecommendUsers() {
		
		/***Given***/
		UsersVo usersVo = new UsersVo();
		usersVo.setUser_id("lhh");
		
		String user_id = usersVo.getUser_id();
		
		/***When***/
		List<UsersVo> recommendUserList = personalService.recommendUsers(user_id);
		for(UsersVo list : recommendUserList) {
			logger.debug("recommendList, {}" , list);
		}

		/***Then***/
		assertNotNull(recommendUserList);
		
	}

	

}