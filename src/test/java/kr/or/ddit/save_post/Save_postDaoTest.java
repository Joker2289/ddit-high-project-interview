package kr.or.ddit.save_post;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.save_post.dao.ISave_postDao;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class Save_postDaoTest extends LogicTestConfig {

	private Logger logger = LoggerFactory.getLogger(Save_postDaoTest.class);
	
	@Resource(name="save_postDao")
	private ISave_postDao save_postDao;
	
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
