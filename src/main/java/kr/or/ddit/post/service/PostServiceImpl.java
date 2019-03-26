package kr.or.ddit.post.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post.dao.IPostDao;
import kr.or.ddit.post.model.PostVo;

@Service("postSErvice")
public class PostServiceImpl implements IPostService{
	
	@Resource(name="postDao")
	private IPostDao postDao;
	
	public PostServiceImpl(){
		
	}

	/**
	 * 
	 * Method : select_memberPost
	 * 작성자 : khk
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 특정 userId의 게시물 조회
	 */
	@Override
	public List<PostVo> select_memberPost(String userId) {
		
		List<PostVo> postList = postDao.select_memberPost(userId);
		
		return postList;
	}

}
