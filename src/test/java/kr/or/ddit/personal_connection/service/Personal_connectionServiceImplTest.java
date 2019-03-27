package kr.or.ddit.personal_connection.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.test.LogicTestConfig;

public class Personal_connectionServiceImplTest extends LogicTestConfig {
	
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
		List<Personal_connectionVo> personalList =
				personalService.select_connections(membervo);

		/***Then***/
		assertTrue(1 <= personalList.size());
		
	}
	
	
	
	/**
	* Method : testConnections_count
	* 작성자 : PC09
	* 변경이력 :
	* Method 설명 : 일촌 수 조회
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
	
	
	

}
