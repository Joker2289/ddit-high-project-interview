package kr.or.ddit.post_comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post_comment.dao.ICommentDao;
import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("commentService")
public class CommentServiceImpl implements ICommentService {

	@Resource(name="commentDao")
	ICommentDao commentDao;
	
	@Override
	public int insert_comment(Post_commentVo post_commentVo) {
		return commentDao.insert_comment(post_commentVo);
	}

	@Override
	public int update_comment(Post_commentVo post_commentVo) {
		return commentDao.update_comment(post_commentVo);
	}

	@Override
	public int delete_comment(String comment_code) {
		return commentDao.delete_comment(comment_code);
	}

	@Override
	public Map<String, Object> select_commentList(PaginationVo paginationVo) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Post_commentVo> commentList = commentDao.select_commentList(paginationVo);
		int commentCnt = commentDao.select_moreCommentCount(paginationVo);

		resultMap.put("commentList", commentList);
		resultMap.put("commentCnt", commentCnt);
		
		return resultMap;
	}
	
	@Override
	public List<Post_commentVo> select_nextComment(PaginationVo paginationVo) {
		return commentDao.select_nextComment(paginationVo);
	}

	@Override
	public int select_commentCount(Post_commentVo commentVo) {
		return commentDao.select_commentCount(commentVo);
	}

	@Override
	public int select_moreCommentCount(PaginationVo paginationVo) {
		return commentDao.select_moreCommentCount(paginationVo);
	}

	@Override
	public Post_commentVo select_commentInfo(String comment_code) {
		return commentDao.select_commentInfo(comment_code);
	}

}
