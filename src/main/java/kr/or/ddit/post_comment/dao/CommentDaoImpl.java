package kr.or.ddit.post_comment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Repository("commentDao")
public class CommentDaoImpl implements ICommentDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_comment(Post_commentVo post_commentVo) {
		return sqlSession.insert("comment.insert_comment", post_commentVo);
	}

	@Override
	public int update_comment(Post_commentVo post_commentVo) {
		return sqlSession.update("comment.update_comment", post_commentVo);
	}

	@Override
	public int delete_comment(String comment_code) {
		return sqlSession.delete("comment.delete_comment", comment_code);
	}

	@Override
	public List<Post_commentVo> select_commentList(PaginationVo paginationVo) {
		return sqlSession.selectList("comment.select_commentList", paginationVo);
	}
	
	@Override
	public List<Post_commentVo> select_nextComment(PaginationVo paginationVo) {
		return sqlSession.selectList("comment.select_nextComment", paginationVo);
	}

	@Override
	public int select_commentCount(Post_commentVo commentVo) {
		return sqlSession.selectOne("comment.select_commentCount", commentVo);
	}

}
