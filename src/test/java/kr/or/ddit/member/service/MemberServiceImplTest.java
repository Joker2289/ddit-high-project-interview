package kr.or.ddit.member.service;



import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;

public class MemberServiceImplTest extends LogicTestConfig{

	@Resource(name="memberService")
	private IMemberService memberService;
	
	@After
	public void tearDown() {
		memberService.delete_member("test");
	}
	
	/**
	 * 
	 * Method : testSelect_memberAllList
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 전체 Member 리스트 출력 테스트
	 */
	@Test
	public void testSelect_memberAllList() {
		/***Given***/
		
		/***When***/
		List<MemberVo> memList = memberService.select_memberAllList();
		/***Then***/
		assertTrue(1 <= memList.size());
	}
	
	/**
	 * 
	 * Method : testSelect_memberInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 특정 member 검색 테스트
	 */
	@Test
	public void testSelect_memberInfo() {
		/***Given***/
		
		/***When***/
		MemberVo memVO = memberService.select_memberInfo("joker");
		/***Then***/
		assertEquals("1", memVO.getMem_status());
	}
	
	/**
	 * 
	 * Method : testInsert_member
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : member 등록 테스트
	 */
	@Test
	public void testInsert_member() {
		/***Given***/
		MemberVo memVO = new MemberVo();
		memVO.setMem_id("test");
		memVO.setMem_division("1");
		memVO.setPass(KISA_SHA256.encrypt("1234"));
		/***When***/
		int insertCnt = memberService.insert_member(memVO);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	

}
