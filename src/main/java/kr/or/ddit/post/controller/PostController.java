package kr.or.ddit.post.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.good.service.IGoodService;
import kr.or.ddit.hashtag.service.IHashtagService;
import kr.or.ddit.hashtag_list.model.Hashtag_listVo;
import kr.or.ddit.hashtag_list.service.IHashtag_listService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.post_comment.service.ICommentService;
import kr.or.ddit.save_post.model.Save_postVo;
import kr.or.ddit.save_post.service.ISave_postService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;
import kr.or.ddit.util.hashtagUtil.ReplaceContents;
import kr.or.ddit.util.pagination.PaginationVo;

@Controller
public class PostController {
	
	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name="postService")
	private IPostService postService;
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="corporationService")
	private ICorporationService corporationService;
	
	@Resource(name="personalService")
	private IPersonal_connectionService personal_connectionService; 
	
	@Resource(name="followService")
	private IFollowService followService; 
	
	@Resource(name="save_postService")
	private ISave_postService savepostService;
	
	@Resource(name="commentService")
	private ICommentService commentService;
	
	@Resource(name="hashtagService")
	private IHashtagService hashtagService;
	
	@Resource(name="hashtag_listService")
	private IHashtag_listService taglistService;
	
	@Resource(name="goodService")
	private IGoodService goodService;
	
	@Resource(name="save_postService")
	private ISave_postService save_postService;
	
	@RequestMapping(path={"/timeline"}, method={RequestMethod.GET})
	public String timelineView(Model model, PaginationVo paginationVo, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		logger.debug("asdasdasd {}", memberInfo);
		
		PaginationVo tagCountPageVo = new PaginationVo(1, 10);
		tagCountPageVo.setMem_id(memberInfo.getMem_id());
		tagCountPageVo.setDivision("16");
		
		Save_postVo savepost = new Save_postVo();
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		
		if(savepostCnt == 0){
			model.addAttribute("savepostCnt", "0");
		} else {
			model.addAttribute("savepostCnt", savepostCnt+"");
		}
		
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		
		if(memberInfo.getMem_division().equals("1")){ //일반회원일 경우
			UsersVo userInfo = usersService.select_userInfo(memberInfo.getMem_id());
			
			//인맥 수 출력을 위한 세팅
			int connectionCnt = personal_connectionService.connections_count(memberInfo);
			
			//팔로우 한 해쉬태그 출력을 위한 세팅
			List<FollowVo> followHashtag = followService.select_followKindList(tagCountPageVo);
			
			if(!followHashtag.isEmpty()){
				model.addAttribute("followHashtag", followHashtag);
			} else {
				model.addAttribute("followHashtag","notfollow");
			}
			
			
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("connectionCnt", connectionCnt);
		} else if(memberInfo.getMem_division().equals("2")){ //회사일 경우
			//회사 회원 로그인 시 홈 화면 출력을 위한 세팅
			CorporationVo corpInfo = corporationService.select_corpInfo(memberInfo.getMem_id());
			
			List<FollowVo> followHashtag = followService.select_followKindList(tagCountPageVo);
	         
	         if(!followHashtag.isEmpty()){
	            model.addAttribute("followHashtag", followHashtag);
	         } else {
	            model.addAttribute("followHashtag","notfollow");
	         }
			
			model.addAttribute("corpInfo", corpInfo);
			
		} else { //관리자일 경우
			//관리자 로그인 시 홈 화면 출력을 위한 세팅
			
		}
		
		
		List<PostVo> timelinePost = postService.select_timelinePost(paginationVo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("timelinePost", timelinePost);

		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = save_postService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		return "timeLineTiles";
	}
	
	
	@RequestMapping(path={"/appendpost"}, method=RequestMethod.POST)
	public String appendPost(@RequestParam String pageNum, @RequestParam String lastPost, HttpServletRequest request, Model model, String ref_code){
		
		logger.debug("lastPost asdasd : {}", lastPost);
		logger.debug("pageNum asdasdasd : {}", pageNum);
		logger.debug("ref_code : {}", ref_code);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		logger.debug("mem_id asdasd : {}", memberInfo.getMem_id());
		
		int page = Integer.parseInt(pageNum);
		
		PaginationVo paginationVo = new PaginationVo();
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setPage(page);
		paginationVo.setCriteria_code(lastPost);
		
		List<PostVo> nextPostList = postService.select_nextPost(paginationVo);
		
		model.addAttribute("nextPostList", nextPostList);
		model.addAttribute("memberInfo", memberInfo);
		
		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = save_postService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		return "timeline/appendPost";
	}
	
	@RequestMapping(path={"/morefollowtag"}, method=RequestMethod.POST)
	public String moreFollowTag(Model model, HttpServletRequest request){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		PaginationVo paginationVo = new PaginationVo(1, 1000000);
		String mem_id = memberInfo.getMem_id();
		
		paginationVo.setMem_id(mem_id);
		paginationVo.setDivision("16");
		
		List<FollowVo> allTag = followService.select_followKindList(paginationVo);
		model.addAttribute("alltag", allTag);
		
		if(!allTag.isEmpty()){
			model.addAttribute("alltag", allTag);
		} else {
			model.addAttribute("alltag","notfollow");
		}
		
		return "timeline/moreFollowTag";
	}
	
	
	@RequestMapping(path={"/writepost_timeline"}, method=RequestMethod.POST)
	public String writePost_timeline(Model model, String post_contents, HttpServletRequest request){
		
		MemberVo member = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		String mem_id = member.getMem_id();
		
		PostVo insertPost = new PostVo();
		String writer_name = "";
		
		if(member.getMem_division().equals("1")){
			UsersVo user = usersService.select_userInfo(mem_id);
			writer_name = user.getUser_name();
			
			insertPost.setMem_id(mem_id);
			insertPost.setPost_contents(post_contents);
			insertPost.setWriter_name(writer_name);
			
		} else if(member.getMem_division().equals("2")){
			CorporationVo corp = corporationService.select_corpInfo(mem_id);
			writer_name = corp.getCorp_name();
			
			insertPost.setMem_id(mem_id);
			insertPost.setPost_contents(post_contents);
			insertPost.setWriter_name(writer_name);
			
		} else { //관리자
			
		}
		
		int insertCnt = postService.insert_post(insertPost);
		
		//해시태그 추출 및 등록
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(post_contents);
		
		String hashtag = "";
		
		Hashtag_listVo taglistVo = new Hashtag_listVo();
		String hashtag_name = "";
		
		taglistVo.setDivision("28");
		taglistVo.setRef_code(insertPost.getPost_code());
		
		List<String> tagList = new ArrayList<String>();
		while(m.find()){
			hashtag = hashtag_replace(m.group());
			tagList.add(hashtag);
			
			if(hashtag != null){
				logger.debug("추출된 해시태그 : {}", hashtag);
				taglistVo.setHashtag_name(hashtag);
				
				hashtagService.insert_hashtag(hashtag);
				taglistService.insert_hashtaglist(taglistVo);
			}
		}
		
		//게시물 내용 중 해시태그를 링크로 치환
		String replacedPost_contents = "";
		for(int i=0; i<tagList.size(); i++){
			String[] temp = post_contents.split(tagList.get(i), 2);
			
			if(temp.length == 1){
				replacedPost_contents += "<a href='/timeline'>" + tagList.get(i) + "</a>";
				post_contents = temp[0];
			} else {
				replacedPost_contents += temp[0];
				replacedPost_contents += "<a href='/timeline'>" + tagList.get(i) + "</a>";
				post_contents = temp[1];
			}
			
			if(i == tagList.size() - 1){
				replacedPost_contents += temp[1];
			}
		}
		
		if(!replacedPost_contents.equals("")){
			insertPost.setPost_contents(replacedPost_contents);
			int postInsertCnt =  postService.update_post(insertPost);
		}
		
		
		//등록된 게시물 내용을 치환된 게시물 내용으로 update
		
		logger.debug("치환된 해시태그 : {}", replacedPost_contents);
		
		if(insertCnt == 1){
			logger.debug("으응? : {}", writer_name);
			return "redirect:/timeline";
		} else {
			return "redirect:/timeline";
		}
	}
	
	
	/**
	 * Method : hashtag_replace
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param str
	 * @return
	 * Method 설명 : 해시태그 추출을 위한 메소드
	 */
	public String hashtag_replace(String str){
		str = StringUtils.replace(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
		
		if(str.length() < 1){
			return null;
		}
		return str;
	}
	
	/**
	 * Method : hashtagToURL
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param contents
	 * @param replaceContents
	 * @return
	 * Method 설명 : 해시태그를 link로 변환하는데 사용되는 메소드
	 */
	public static String hashtagToLink(String contents, ReplaceContents replaceContents){
		
		StringBuffer sb = new StringBuffer();
		try {
			Pattern compilePattern = Pattern.compile(replaceContents.regexp(), Pattern.CASE_INSENSITIVE);
			Matcher matcher = compilePattern.matcher(contents);
			
			while(matcher.find()){
				String replaceTag = replaceContents.replace(matcher.group(1).trim());
				matcher.appendReplacement(sb, replaceTag);
			}
			
		} catch (Exception e) {}
		
		return sb.toString();
	}
	
	@RequestMapping(path={"/commentArea"}, method=RequestMethod.POST)
	public String commentArea(String ref_code, Model model, HttpServletRequest request){
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		if(memberInfo.getMem_division() == "1"){
			UsersVo user = (UsersVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", user);
		} else if (memberInfo.getMem_division() == "2"){
			CorporationVo corp = (CorporationVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", corp);
		} else {
			
		}
		
		PaginationVo paginationVo = new PaginationVo();
		
		paginationVo.setDivision("28");
		paginationVo.setRef_code(ref_code);
		
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		int commentCnt = (int) resultMap.get("commentCnt");
		
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("ref_code", ref_code);
		
		return "timeline/postComment";
	}
	
	@RequestMapping(path={"/appendnextcomment"}, method=RequestMethod.POST)
	public String appendnextcomment(String commentPageNum, String ref_code, String last_comment, Model model){
		
		logger.debug("commentPageNum : {}", commentPageNum);
		logger.debug("ref_code : {}", ref_code);
		logger.debug("last_comment : {}", last_comment);
		
		int page = Integer.parseInt(commentPageNum);
		
		PaginationVo paginationVo = new PaginationVo();
		
		paginationVo.setRef_code(ref_code);
		paginationVo.setDivision("28");
		paginationVo.setPage(page);
		paginationVo.setCriteria_code(last_comment);
		
		List<Post_commentVo> nextCommentList = commentService.select_nextComment(paginationVo);
		
		model.addAttribute("nextCommentList", nextCommentList);
		model.addAttribute("ref_code", ref_code);
		
		return "timeline/appendComment";
	}
	
	@RequestMapping(path={"/writecomment"}, method=RequestMethod.POST)
	public String writecomment(String ref_code, String contents, Model model, HttpServletRequest request){
		logger.debug("comment_ref_code : {}", ref_code);
		logger.debug("contents : {}", contents);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		if(memberInfo.getMem_division() == "1"){
			UsersVo user = (UsersVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", user);
		} else if (memberInfo.getMem_division() == "2"){
			CorporationVo corp = (CorporationVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", corp);
		} else {
			
		}
		
		Post_commentVo commentVo = new Post_commentVo();
		PaginationVo paginationVo = new PaginationVo();
		
		commentVo.setMem_id(memberInfo.getMem_id());
		commentVo.setComment_contents(contents);
		commentVo.setRef_code(ref_code);
		commentVo.setDivision("28");
		commentService.insert_comment(commentVo);
		
		paginationVo.setRef_code(ref_code);
		paginationVo.setDivision("28");
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		int commentCnt = (int) resultMap.get("commentCnt");
		
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("ref_code", ref_code);
		
		return "timeline/postComment";
	}
	
	/**
	 * Method : push_postGood
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param ref_code
	 * @param request
	 * @return
	 * Method 설명 : 게시글 좋아요 등록
	 */
	@RequestMapping(path={"/push_postgood"}, method=RequestMethod.POST)
	@ResponseBody
	public String push_postGood(String ref_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		logger.debug("mem_id asdasdasdqwe : {}", memberInfo.getMem_id());
		
		GoodVo goodVo = new GoodVo();
		
		goodVo.setMem_id(memberInfo.getMem_id());
		goodVo.setRef_code(ref_code);
		goodVo.setDivision("28");
		
		goodService.insert_goodInfo(goodVo);
		
		return "complate";
	}
	
	/**
	 * Method : push_postGoodCancel
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param ref_code
	 * @param model
	 * @param request
	 * @return
	 * Method 설명 : 게시글 좋아요 취소
	 */
	@RequestMapping(path={"/push_postgoodcancel"}, method=RequestMethod.POST)
	@ResponseBody
	public String push_postGoodCancel(String ref_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		GoodVo goodVo = new GoodVo();
		
		goodVo.setMem_id(memberInfo.getMem_id());
		goodVo.setRef_code(ref_code);
		goodVo.setDivision("28");
		
		goodService.delete_goodInfo(goodVo);
		
		return "complate";
	}
	
	/**
	 * Method : push_postSave
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param request
	 * @return
	 * Method 설명 : 저장한 글 등록
	 */
	@RequestMapping(path={"/push_postsave"}, method=RequestMethod.POST)
	@ResponseBody
	public String push_postSave(String post_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		Save_postVo saveVo = new Save_postVo();
		
		saveVo.setMem_id(memberInfo.getMem_id());
		saveVo.setSave_post_code(post_code);
		
		save_postService.insert_savepostData(saveVo);
		
		return "complate";
	}
	
	/**
	 * Method : push_postSaveCancel
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param request
	 * @return
	 * Method 설명 : 저장한 글 삭제
	 */
	@RequestMapping(path={"/push_postsavecancel"}, method=RequestMethod.POST)
	@ResponseBody
	public String push_postSaveCancel(String post_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		Save_postVo saveVo = new Save_postVo();
		
		saveVo.setMem_id(memberInfo.getMem_id());
		saveVo.setSave_post_code(post_code);
		
		save_postService.delete_savepostData(saveVo);
		
		return "complate";
	}
	
	@RequestMapping(path={"/deletepost"}, method=RequestMethod.POST)
	@ResponseBody
	public String deletePost(String post_code){
		postService.delete_post(post_code);
		
		return "complate";
	}
	
}
