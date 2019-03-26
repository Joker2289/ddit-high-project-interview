package kr.or.ddit.users.service;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class usersServiceImplTest extends LogicTestConfig{

	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo userVO = usersService.select_userInfo("joker");
		
		/***Then***/
		assertEquals("박정권", userVO.getUser_name());
	}

}
