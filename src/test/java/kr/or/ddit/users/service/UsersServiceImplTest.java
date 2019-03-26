package kr.or.ddit.users.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class UsersServiceImplTest extends LogicTestConfig{

	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo uVo = usersService.select_userInfo("brown");

		/***Then***/
		assertNotNull(uVo);
	}

}
