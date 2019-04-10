package kr.or.ddit.post.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import kr.or.ddit.post.dao.IPostDao;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class PostServiceTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(PostServiceTest.class);

	@Resource(name="postService")
	private IPostService postService;
	
	@Resource(name="postDao")
	private IPostDao postDao;
	
	@Test
	public void testInsert_post() {
		/***Given***/
		PostVo postVo = new PostVo();
		
		/***When***/
		postVo.setPost_contents("테스트 코드로 작성된 타임라인 게시글 111");
		postVo.setMem_id("goo8455");
		postVo.setWriter_name("장구현");
		
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
		int deleteCnt = postService.delete_post("3");
		
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
	
	@Test
	public void testSelect_timelinePost(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo(1, 10);
		paginationVo.setMem_id("goo8455");
		
		/***When***/
		List<PostVo> timelinePosts = postService.select_timelinePost(paginationVo);
		for(PostVo post : timelinePosts){
			logger.debug("post info {} {} {}", post.getWriter_name(), post.getPost_contents(), post.getPost_date());
		}
		
		/***Then***/
		assertTrue(timelinePosts.size() > 0);
	}
	
	@Test
	public void testSelect_nextPost(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo();
		paginationVo.setMem_id("goo8455");
		paginationVo.setPage(2);
		paginationVo.setCriteria_code("70");
		
		/***When***/
		List<PostVo> nextPage = postService.select_nextPost(paginationVo);
		
		for(PostVo posts : nextPage){
			logger.debug("post info : {}", posts.getPost_code());
		}
		
		/***Then***/
		assertTrue(nextPage.size() > 0);
	}

	
	/**
	 * Method : testHashtag
	 * 작성자 : goo84
	 * 변경이력 :
	 * Method 설명 : controller에서 해시태그를 처리하는 방법
	 */
	@Test
	public void testHashtag(){
		
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		String newHashtag = "#개발자 ㅁㄴㅇㅁㄴㅇ #웹개발 #집에가고싶다 #진도가너무안나간다";
		Matcher m = p.matcher(newHashtag);
		
		String hashtag = "";
		
		while(m.find()){
			hashtag = hashtag_replace(m.group());
			
			if(hashtag != null){
				logger.debug("추출된 해시태그 : {}", hashtag);
			}
		}
		
	}
	
	public String hashtag_replace(String str){
		
		str = StringUtils.replace(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
		
		if(str.length() < 1){
			return null;
		}
		
		return str;
	}
}
