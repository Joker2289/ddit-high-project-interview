package kr.or.ddit.save_post.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class Save_postServiceTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(Save_postServiceTest.class);
	
	@Resource(name="savepostService")
	private ISave_postService savepostService;
	
	@Resource(name="postService")
	private IPostService postService;

	@Test
	public void testInsert_savepostData() {
		/***Given***/
		PaginationVo pagination = new PaginationVo();
		pagination.setMem_id("goo8455");
		List<PostVo> postList = postService.select_timelinePost(pagination);
		
		for(PostVo post : postList){
			logger.debug("post code : {}", post.getPost_code());
		}
		
		/***When***/
		
		
		/***Then***/
	}

}
