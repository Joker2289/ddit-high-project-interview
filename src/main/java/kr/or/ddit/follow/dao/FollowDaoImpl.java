package kr.or.ddit.follow.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.follow.model.FollowVo;

@Repository("followDao")
public class FollowDaoImpl implements IFollowDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_follow(FollowVo followVo) {
		return sqlSession.insert("follow.insert_follow", followVo);
	}

	@Override
	public int delete_follow(String follow_code) {
		return sqlSession.delete("follow.delete_follow", follow_code);
	}

	@Override
	public List<FollowVo> select_followList(String mem_id) {
		return sqlSession.selectList("follow.select_followList", mem_id); 
	}

	@Override
	public List<FollowVo> select_followKindList(FollowVo followVo) {
		return sqlSession.selectList("follow.select_followKindList", followVo);
	}
	
}
