package kr.or.ddit.users.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.users.model.UsersVo;

@Repository("usersDao")
public class UsersDaoImpl implements IUsersDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public UsersVo select_userInfo(String user_id) {
		UsersVo uVo = sqlSessionTemplate.selectOne("users.select_userInfo", user_id);
		
		return uVo;
	}

	@Override
	public int insert_users(UsersVo vo) {
		return sqlSessionTemplate.insert("users.insert_users", vo);
	}

	@Override
	public int update_userInfo(UsersVo vo) {
		return sqlSessionTemplate.update("users.update_userInfo", vo);
	}
	

}
