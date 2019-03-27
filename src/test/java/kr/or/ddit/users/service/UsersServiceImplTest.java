package kr.or.ddit.users.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;

public class UsersServiceImplTest extends LogicTestConfig{

	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@After
	public void tearDown() {
		memberService.delete_member("test");
	}
	
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo uVo = usersService.select_userInfo("brown");

		/***Then***/
		assertNotNull(uVo);
	}
	
	/**
	 * 
	 * Method : testInsert_users
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 유저 등록 테스트
	 */
	@Test
	public void testInsert_users() {
		/***Given***/
		MemberVo mVo = new MemberVo();
		mVo.setMem_id("test");
		mVo.setMem_division("1");
		mVo.setPass(KISA_SHA256.encrypt("1234"));
		memberService.insert_member(mVo);
		
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("test");
		/***When***/
		int insertCnt = usersService.insert_users(uVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	/**
	 * 
	 * Method : testUpdate_userInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 유저 수정 테스트
	 */
	@Test
	public void testUpdate_userInfo() {
		/***Given***/
		MemberVo mVo = new MemberVo();
		mVo.setMem_id("test");
		mVo.setMem_division("1");
		mVo.setPass(KISA_SHA256.encrypt("1234"));
		memberService.insert_member(mVo);
		
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("test");
		usersService.insert_users(uVo);
		
		/***When***/
		uVo.setEmail("test");
		int updateCnt = usersService.update_userInfo(uVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	

}
