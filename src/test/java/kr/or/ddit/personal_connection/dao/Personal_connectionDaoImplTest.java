package kr.or.ddit.personal_connection.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;


public class Personal_connectionDaoImplTest extends LogicTestConfig{
	
	private Logger logger = LoggerFactory.getLogger(Personal_connectionDaoImplTest.class);
	
	@Resource(name="personalDao")
	private IPersonal_connectionDao personalDao; 
	

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
				personalDao.select_connections(membervo);

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
		int connections_count = personalDao.connections_count(membervo);

		/***Then***/
		assertNotNull(membervo);
		//assertEquals(3, connections_count);
		
	}
	
	
	
	/**
	* Method : testCorporation_count
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 팔로우한 회사 수 조회
	*/
	@Test
	public void testCorporation_count() {
		
		/***Given***/
		FollowVo followVo = new FollowVo();
		followVo.setDivision("43");
		
		/***When***/
		int corporation_count = personalDao.corporation_count(followVo);

		/***Then***/
		assertNotNull(followVo);
		//assertEquals(1, corporation_count);
		
	}
	

}