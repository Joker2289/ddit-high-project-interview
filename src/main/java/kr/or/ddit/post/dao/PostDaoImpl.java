package kr.or.ddit.post.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Repository("postDao")
public class PostDaoImpl implements IPostDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_post(PostVo postVo) {
		return sqlSession.insert("post.insert_post",postVo);
	}

	@Override
	public int update_post(PostVo postVo) {
		return sqlSession.update("post.update_post",postVo);
	}

	@Override
	public int delete_post(String post_code) {
		return sqlSession.delete("post.delete_post", post_code);
	}

	@Override
	public List<PostVo> select_memberPost(String writer_name) {
		return sqlSession.selectList("post.select_memberPost", writer_name);
	}

	@Override
	public List<PostVo> select_timelinePost(PaginationVo paginationVo) {
		return sqlSession.selectList("post.select_timelinePost", paginationVo);
	}

	@Override
	public PostVo select_postInfo(String post_code) {
		return sqlSession.selectOne("post.select_postInfo", post_code);
	}

	@Override
	public List<PostVo> select_nextPost(PaginationVo paginationVo) {
		return sqlSession.selectList("post.select_nextPost", paginationVo);
	}

}
