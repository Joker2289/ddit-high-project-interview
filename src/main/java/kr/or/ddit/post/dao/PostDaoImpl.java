package kr.or.ddit.post.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.post.model.PostVo;

@Repository("postDao")
public class PostDaoImpl implements IPostDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
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

		List<PostVo> postList = sqlSessionTemplate.selectList("post.select_memberPost");
		return postList;
	}

}
