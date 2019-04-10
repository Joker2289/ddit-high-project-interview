package kr.or.ddit.hide_post.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.hide_post.model.Hide_postVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class Hide_postServiceTest extends LogicTestConfig {

	private Logger logger = LoggerFactory.getLogger(Hide_postServiceTest.class);
	
	@Resource(name="hide_postService")
	private IHide_postService hideService;
	
	@Resource(name="postService")
	private IPostService postService;
	
	@Test
	public void testInsert_hidepostInfo() {
		/***Given***/
		Hide_postVo hideVo = new Hide_postVo();
		
		/***When***/
		hideVo.setMem_id("goo8455");
		hideVo.setPost_code("186");
		
		int intsertCnt = hideService.insert_hidepostInfo(hideVo);
		
		/***Then***/
		assertEquals(1, intsertCnt);
	}
	
	@Test
	public void testDelete_hidepostInfo(){
		/***Given***/
		
		/***When***/
		int deleteCnt = hideService.delete_hidepostInfo("3");
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void testSelect_hidepostList(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo(1, 10);
		
		/***When***/
		paginationVo.setMem_id("goo8455");
		
		List<PostVo> hidepostList = hideService.select_hidepostList(paginationVo);
		for(PostVo hidePost : hidepostList){
			logger.debug("hidePost post_code : {}", hidePost.getPost_code());
		}
		
		
		/***Then***/
		assertTrue(hidepostList.size() > 0);
	}
	
	@Test
	public void testSelect_nextHidepost(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo();
		
		/***When***/
		paginationVo.setMem_id("goo8455");
		paginationVo.setCriteria_code("300");
		
		List<PostVo> hidepostList = hideService.select_nextHidepost(paginationVo);
		for(PostVo hidePost : hidepostList){
			logger.debug("hidePost post_code : {}", hidePost.getPost_code());
		}
		
		/***Then***/
		assertTrue(hidepostList.size() > 0);
	}

}
