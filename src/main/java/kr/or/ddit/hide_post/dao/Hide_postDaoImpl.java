package kr.or.ddit.hide_post.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.hide_post.model.Hide_postVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Repository("hide_postDao")
public class Hide_postDaoImpl implements IHide_postDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_hidepostInfo(Hide_postVo hideVo) {
		return sqlSession.insert("hide_post.insert_hidepostInfo", hideVo);
	}

	@Override
	public int delete_hidepostInfo(String hide_code) {
		return sqlSession.delete("hide_post.delete_hidepostInfo", hide_code);
	}

	@Override
	public List<PostVo> select_hidepostList(PaginationVo paginationVo) {
		return sqlSession.selectList("hide_post.select_hidepostList", paginationVo);
	}

	@Override
	public List<PostVo> select_nextHidepost(PaginationVo paginationVo) {
		return sqlSession.selectList("hide_post.select_nextHidepost", paginationVo);
	}

}
