package kr.or.ddit.save_post.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.save_post.model.Save_postVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class Save_postServiceTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(Save_postServiceTest.class);
	
	@Resource(name="save_postService")
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
		
		Save_postVo savepostVo = new Save_postVo();
		savepostVo.setMem_id("goo8455");
		savepostVo.setSave_post_code("76");
		
		/***When***/
		int intsertCnt = savepostService.insert_savepostData(savepostVo);
		
		
		/***Then***/
		assertEquals(1, intsertCnt);
	}
	
	@Test
	public void testSelectsavepostData(){
		/***Given***/
		
		/***When***/
		List<Save_postVo> savepostList = savepostService.select_savepostData("goo8455");
		for(int i=0; i<savepostList.size(); i++){
			logger.debug("savepostInfo : {}", postService.select_postInfo(savepostList.get(i).getSave_post_code())); 
		}
		
		/***Then***/
		assertNotNull(savepostList);
	}
	
	@Test
	public void testDelete_saveData(){
		/***Given***/
		
		/***When***/
		int deleteCnt = savepostService.delete_savepostData("1");
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}

}
