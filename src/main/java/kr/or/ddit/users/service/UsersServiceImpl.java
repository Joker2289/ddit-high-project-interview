package kr.or.ddit.users.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.users.dao.IUsersDao;
import kr.or.ddit.users.model.UsersVo;

@Service("usersService")
public class UsersServiceImpl implements IUsersService{
	
	@Resource(name="usersDao")
	private IUsersDao usersDao;

	/**
	 * 
	 * Method : select_userInfo
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 회원정보 조회.
	 */
	@Override
	public UsersVo select_userInfo(String user_id) {
		UsersVo uVo = usersDao.select_userInfo(user_id);
		
		return uVo;
	}

}
