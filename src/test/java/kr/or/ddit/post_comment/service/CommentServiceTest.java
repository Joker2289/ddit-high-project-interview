package kr.or.ddit.post_comment.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.pagination.PaginationVo;

public class CommentServiceTest extends LogicTestConfig {
	
	private Logger logger = LoggerFactory.getLogger(CommentServiceTest.class);
	
	@Resource(name="commentService")
	private ICommentService commentService;

	@Test
	public void testInsert_comment() {
		/***Given***/
		Post_commentVo commentVo = new Post_commentVo();
		
		/***When***/
		commentVo.setMem_id("goo8455");
		commentVo.setComment_contents("테스트 코드에서 작성된 댓긇 입니다.");
		commentVo.setDivision("28");
		commentVo.setRef_code("121");
		
		int insertCnt = commentService.insert_comment(commentVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void testUpdate_comment(){
		/***Given***/
		Post_commentVo commentVo = new Post_commentVo();
		
		/***When***/
		commentVo.setComment_code("1");
		commentVo.setComment_contents("테스트 코드에서 수정된 댓글 입니다.");
		
		int updateCnt = commentService.update_comment(commentVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	@Test
	public void testDelete_comment(){
		/***Given***/
		
		/***When***/
		int deleteCnt = commentService.delete_comment("1");
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void testSelect_commentList(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo();
		
		/***When***/
		paginationVo.setRef_code("172");
		paginationVo.setDivision("28");
		
		List<Post_commentVo> commentList = commentService.select_commentList(paginationVo);
		
		for(int i=0; i<commentList.size(); i++){
			logger.debug("comment content : {}, {}",commentList.get(i).getComment_code() ,commentList.get(i).getComment_contents());
		}
		
		/***Then***/
		assertTrue(commentList.size() > 0);
	}
	
	@Test
	public void testSelect_nextComment(){
		/***Given***/
		PaginationVo paginationVo = new PaginationVo();
		
		/***When***/
		paginationVo.setRef_code("172");
		paginationVo.setDivision("28");
		paginationVo.setCriteria_code("10000");
		
		List<Post_commentVo> nextCommentList = commentService.select_nextComment(paginationVo);
		
		/***Then***/
		assertTrue(nextCommentList.size() > 0);
	}

}
