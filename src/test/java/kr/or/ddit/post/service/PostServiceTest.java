package kr.or.ddit.post.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.test.LogicTestConfig;

public class PostServiceTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(PostServiceTest.class);

	@Resource(name="postService")
	private IPostService postService;
	
	@Test
	public void testInsert_post() {
		/***Given***/
		PostVo postVo = new PostVo();
		
		/***When***/
		postVo.setPost_contents("테스트 코드로 작성된 타임라인 게시글 2");
		postVo.setMem_id("goo8455");
		
		int insertCnt = postService.insert_post(postVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void testUpdate_post(){
		/***Given***/
		
		/***When***/
		PostVo postVo = new PostVo();
		
		postVo.setPost_code("1");
		postVo.setPost_contents("테스트 코드로 수정된 타임라인 게시글 1");
		
		int updateCnt = postService.update_post(postVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	@Test
	public void testDelete_post(){
		/***Given***/
		
		/***When***/
		int deleteCnt = postService.delete_post("2");
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void testSelect_memberPost(){
		/***Given***/
		
		/***When***/
		List<PostVo> mem_postList = postService.select_memberPost("goo8455");
		for(PostVo post : mem_postList){
			logger.debug("post contents : {} {}", post.getPost_contents(), post.getMem_id());
		}
		
		/***Then***/
		assertTrue(mem_postList.size() > 0);
	}

}
