package kr.or.ddit.post_comment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post_comment.dao.ICommentDao;
import kr.or.ddit.post_comment.model.Post_commentVo;

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
	public List<Post_commentVo> select_commentList(Post_commentVo post_commentVo) {
		return commentDao.select_commentList(post_commentVo);
	}

	@Override
	public int select_commentCount(Post_commentVo commentVo) {
		return commentDao.select_commentCount(commentVo);
	}

}
