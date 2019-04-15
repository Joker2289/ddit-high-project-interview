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

import kr.or.ddit.post.controller.PostController;
import kr.or.ddit.post.dao.IPostDao;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.hashtagUtil.ReplaceContents;
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
	 * Method 설명 : controller에서 해시태그를 추출하는 방법
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
	
	ReplaceContents replaceContents = new ReplaceContents() {
		@Override
		public String replace(String findToken) {
			
			return "<a href='localhost/timeline'>" + findToken + "</a>";
		}
		@Override
		public String regexp() {
//			/#(\\w*[0-9a-zA-Z]+\\w*[0-9a-zA-Z])
//			return "([A-Za-z]+://[A-Za-z0-9-_]+.[A-Za-z0-9-_:%&~?/.=]+)";
//			return "(?:\\s|\\A)[##]+([A-Za-z0-9가-힣-_]+)";
//			return "(#[^#\\s]+|@[^#\\s]+|@[^@\\s]+)";
//			return "(?:^|\\s)#(\\w*[a-zA-Z가-힣_]+\\w*)";
//			return "#(\\w*[0-9a-zA-Z]+\\w*[0-9a-zA-Z])";
//			return "(/(^|\\s)@(\\w+)";
//			return "(?:^|\\s)(#[\\p{L}0-9a-zA-Z가-힣_-]+)";
			//(?:^|\\s)(#[\\p{L}0-9a-zA-Z가-힣_-]+)
//			return "(?:^|\\s)(#[\\p{L}0-9_-]+)";
//			return "(?:^|\\s|[\\p{Punct}&&[^/]])(#[\\p{L}0-9a-zA-Z가-힣_-]+)";
			return "(?:^|\\s|[\\p{Punct}&&[^/]])(#[\\p{L}0-9-_]+)";
		}
	};
	
	@Test
	public void replaceHashtag2() throws Exception{
		String contents = "<p><span>#정규식 #링크로변환 제발되라 #부탁합니다 제발요...</span></p><p><span>#제발 #정규식씨부레</span></p><p><img src='asd'></p>";
		
		Pattern replacePattern = Pattern.compile("(?:^|\\s|[\\p{Punct}&&[^/]])(#[\\p{L}0-9-_]+)");
		Matcher matcher = replacePattern.matcher(PostController.hashtagToLink(contents, replaceContents));
		
		String afterContents = PostController.hashtagToLink(contents, replaceContents);
		
		//치환된 게시글 내용 인서트
		logger.debug("치환된 게시물 내용 : {}", afterContents);
		
		Pattern extractPattern = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		matcher = extractPattern.matcher(contents);
		
		String hashtag = "";
		
		while(matcher.find()){
			hashtag = hashtag_replace(matcher.group());
			
			if(hashtag != null){
				//해시태그, 해시태그 목록 인서트
				logger.debug("추출된 해시태그 : {}", hashtag);
			}
		}
	}
	
	@Test
	public void tagtolink(){
		String contents = "<p> #정규식 #링크로변환 제발되라 #부탁합니다 제발요...</p><p> #제발 #정규식씨부레</p><p><img src='asd'></p>";
		
		String[] splitContents = contents.split(" ");
		String replaceedWord = "";
		String splitedWord = "";
		
		for(int i=0; i<splitContents.length; i++){
			splitedWord = splitContents[i];
			
			if(splitedWord.indexOf("#") == 0){
				splitedWord = "<a href='localhost/timeline'>" + splitedWord + "</a>";
			}
			replaceedWord += splitedWord+"";
		}
		logger.debug("replacedWord : {}", replaceedWord);
		
	}
	
}
