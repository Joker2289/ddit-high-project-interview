package kr.or.ddit.users.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.users.dao.IUsersDao;
import kr.or.ddit.users.model.UsersVo;

@Service("usersService")
public class UsersServiceImpl implements IUsersService{
	
	@Resource(name="usersDao")
	private IUsersDao usersDao;
	
	@Override
	public UsersVo select_userInfo(String user_id) {
		return usersDao.select_userInfo(user_id);
	}
}
