package kr.or.ddit.save_post.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.save_post.model.Save_postVo;

@Repository("save_postDao")
public class Save_postDaoImpl implements ISave_postDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_savepostData(Save_postVo savepostVo) {
		return sqlSession.insert("savepost.insert_savepostData", savepostVo);
	}

	@Override
	public int delete_savepostData(Save_postVo savepostVo) {
		return sqlSession.delete("savepost.delete_savepostData", savepostVo);
	}

	@Override
	public List<Save_postVo> select_savepostData(String mem_id) {
		return sqlSession.selectList("savepost.select_savepostData", mem_id);
	}

	@Override
	public int savepost_count(String mem_id) {
		return sqlSession.selectOne("savepost.savepost_count", mem_id);
	}

}
