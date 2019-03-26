package kr.or.ddit.users.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;

public class usersDaoImplTest extends LogicTestConfig{
	
	@Resource(name="usersDao")
	private IUsersDao usersDao;
	
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo userVO = usersDao.select_userInfo("joker");
		
		/***Then***/
		assertEquals("박정권", userVO.getUser_name());
	}
	
	

}
