package kr.or.ddit.good.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.users.model.UsersVo;

@Repository("goodDao")
public class GoodDaoImpl implements IGoodDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_goodInfo(GoodVo goodVo) {
		return sqlSession.insert("good.insert_goodInfo", goodVo);
	}

	@Override
	public int delete_goodInfo(GoodVo goodVo) {
		return sqlSession.delete("good.delete_goodInfo", goodVo);
	}

	@Override
	public List<GoodVo> select_goodInfo(String mem_id) {
		return sqlSession.selectList("good.select_goodInfo", mem_id);
	}

	@Override
	public int select_goodCount(GoodVo goodVo) {
		return sqlSession.selectOne("good.select_goodCount", goodVo);
	}

	@Override
	public List<UsersVo> select_pushGoodMember(GoodVo goodVo) {
		return sqlSession.selectList("good.select_pushGoodMember", goodVo);
	}

	@Override
	public List<GoodVo> select_pushedGoodPost(String mem_id) {
		return sqlSession.selectList("good.select_pushedGoodPost", mem_id);
	}

}
