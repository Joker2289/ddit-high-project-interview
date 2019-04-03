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

	@Override
	public int insert_users(UsersVo vo) {
		return usersDao.insert_users(vo);
	}

	@Override
	public int update_userInfo(UsersVo vo) {
		return usersDao.update_userInfo(vo);
	}

	/**
	 * Method : select_introduce
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 간단프로필 (학력이나 경력사항)
	 */
	@Override
	public String select_introduce(String user_id) {
		return usersDao.select_introduce(user_id);
	}

}
