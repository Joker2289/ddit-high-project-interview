package kr.or.ddit.users.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class UsersDaoImplTest extends LogicTestConfig{

	@Resource(name="usersDao")
	private IUsersDao usersDao;
	
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo uVo = usersDao.select_userInfo("brown");

		/***Then***/
		assertNotNull(uVo);
	}

}
