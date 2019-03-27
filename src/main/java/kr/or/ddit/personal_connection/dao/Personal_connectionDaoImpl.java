package kr.or.ddit.personal_connection.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;
import kr.or.ddit.users.model.UsersVo;

@Repository("personalDao")
public class Personal_connectionDaoImpl implements IPersonal_connectionDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<UsersVo> select_connections(MemberVo memberVo) {
		List<UsersVo> personalList =
				sqlSessionTemplate.selectList("personal.select_connections",memberVo);
		return personalList;
	}

	@Override
	public int connections_count(MemberVo memberVo) {
		int connections_count = sqlSessionTemplate.selectOne("personal.connections_count" , memberVo);
		return connections_count;
	}


}
