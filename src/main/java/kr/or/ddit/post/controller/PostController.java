package kr.or.ddit.post.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.follow.model.FollowVo;
import kr.or.ddit.follow.service.IFollowService;
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.good.service.IGoodService;
import kr.or.ddit.hashtag.service.IHashtagService;
import kr.or.ddit.hashtag_list.model.Hashtag_listVo;
import kr.or.ddit.hashtag_list.service.IHashtag_listService;
import kr.or.ddit.hide_post.model.Hide_postVo;
import kr.or.ddit.hide_post.service.IHide_postService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post_comment.model.Post_commentVo;
import kr.or.ddit.post_comment.service.ICommentService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.report.model.ReportVo;
import kr.or.ddit.report.service.IReportService;
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
	
	@Resource(name="reportService")
	private IReportService reportService;
	
	@Resource(name="hide_postService")
	private IHide_postService hide_postService;
	
	@Resource(name="alarmService")
	private IAlarmService alarmService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@RequestMapping(path={"/timeline"}, method={RequestMethod.GET})
	public String timelineView(Model model, PaginationVo paginationVo, HttpServletRequest request) throws ParseException{
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		PaginationVo tagCountPageVo = new PaginationVo(1, 10);
		tagCountPageVo.setMem_id(memberInfo.getMem_id());
		tagCountPageVo.setDivision("16");
		
		//저장글 갯수 
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		model.addAttribute("savepostCnt", savepostCnt);

		
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
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		
		/////////////////////////////// newList
		
		// 광고 부분 -> 신규 채용공고 (newList)
		List<RecruitVo> newList = recrService.getNewList();
		
		// newList size : 7. index 6 -> index 0에 add.
		newList.add(0, newList.get(6));
		
		List<String> newImgList = new ArrayList<>();
		List<String> newIdList = new ArrayList<>();
		List<String> newNmList = new ArrayList<>();
		List<String> newTimeList = new ArrayList<>();
		
		for(int i=0; i < newList.size(); i++){
			RecruitVo rVo = newList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			newImgList.add(cVo.getLogo_path());
			newNmList.add(cVo.getCorp_name());
			newIdList.add(cVo.getCorp_id());
			
			String start_date = rVo.getStart_date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				newTimeList.add("방금");
			}else if(time_diff < 60){
				newTimeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				newTimeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				newTimeList.add(time_diff/(60*24) + "일");
			}else{
				newTimeList.add(time_diff/(60*24*30) + "달");
			}				
		}		
		
		model.addAttribute("newList", newList);
		model.addAttribute("newImgList", newImgList);
		model.addAttribute("newIdList", newIdList);
		model.addAttribute("newNmList", newNmList);
		model.addAttribute("newTimeList", newTimeList);
		
		/////////////////////////////// newList		
		
		return "timeLineTiles";
	}
	
	
	@RequestMapping(path={"/appendpost"}, method=RequestMethod.POST)
	public String appendPost(@RequestParam String pageNum, @RequestParam String lastPost, HttpServletRequest request, Model model, String ref_code){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

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
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
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
		
		String param_hashtag = "";
		//게시물 내용 중 해시태그를 링크로 치환
		String replacedPost_contents = "";
		for(int i=0; i<tagList.size(); i++){
			String[] temp = post_contents.split(tagList.get(i), 2);
			
			if(temp.length == 1){
				
				param_hashtag = tagList.get(i).split("#")[1];
				logger.debug("param_hashtag : {}", param_hashtag);
				
				replacedPost_contents += "<a class='hashtag' href='/hashtagpost?hashtag_name=" + param_hashtag + "'>" + tagList.get(i) + "</a>";	
				post_contents = temp[0];
			} else {
				replacedPost_contents += temp[0];
				
				param_hashtag = tagList.get(i).split("#")[1];
				logger.debug("param_hashtag : {}", param_hashtag);
				
				replacedPost_contents += "<a class='hashtag' href='/hashtagpost?hashtag_name=" + param_hashtag + "'>" + tagList.get(i) + "</a>";
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
	
	@RequestMapping(path={"/commentArea"})
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
		
		PaginationVo paginationVo = new PaginationVo(1, 5);
		
		paginationVo.setDivision("28");
		paginationVo.setRef_code(ref_code);
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		int commentCnt = (int) resultMap.get("commentCnt");
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("ref_code", ref_code);
		model.addAttribute("page_num", paginationVo.getPage());
		
		return "timeline/postComment";
	}
	
	@RequestMapping(path={"/addcomment"})
	public String addComment(int page_num, String ref_code, Model model, HttpServletRequest request){
		
		page_num++;
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		PaginationVo paginationVo = new PaginationVo(1, page_num * 5);
		paginationVo.setDivision("28");
		paginationVo.setRef_code(ref_code);
		paginationVo.setMem_id(memberInfo.getMem_id());

		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		int commentCnt = (int) resultMap.get("commentCnt");
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", page_num);
		model.addAttribute("ref_code", ref_code);
		
		return "timeline/postComment";
	}
	
	@RequestMapping(path={"/writecomment"}, method=RequestMethod.POST)
	public String writecomment(String ref_code, String comment_contents, int page_num, Model model, HttpServletRequest request){
		logger.debug("comment_ref_code : {}", ref_code);
		logger.debug("contents : {}", comment_contents);
		logger.debug("page_num", page_num);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		PostVo postInfo = postService.select_postInfo(ref_code);
		
		if(memberInfo.getMem_division() == "1"){
			UsersVo user = (UsersVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", user);
		} else if (memberInfo.getMem_division() == "2"){
			CorporationVo corp = (CorporationVo) request.getSession().getAttribute("SESSION_DETAILVO");
			model.addAttribute("commentwriter", corp);
		}
		
		Post_commentVo commentVo = new Post_commentVo();
		
		commentVo.setMem_id(memberInfo.getMem_id());
		commentVo.setComment_contents(comment_contents);
		commentVo.setRef_code(ref_code);
		commentVo.setDivision("28");
		commentService.insert_comment(commentVo);
		
		PaginationVo paginationVo = new PaginationVo(1, page_num * 5);
		paginationVo.setMem_id(postInfo.getMem_id());
		paginationVo.setRef_code(ref_code);
		paginationVo.setDivision("28");
		
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		
		int commentCnt = (int) resultMap.get("commentCnt");
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("ref_code", ref_code);
		model.addAttribute("page_num", page_num);
		
		//댓글 작성 -> 알림 등록
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setMem_id(postInfo.getMem_id());
		alarmInfo.setRef_code(ref_code);
		alarmInfo.setAlarm_check("0");
		alarmInfo.setDivision("28");
		alarmInfo.setSend_id(memberInfo.getMem_id());
		alarmInfo.setAlarm_separate("02");
		
		if(!memberInfo.getMem_id().equals(postInfo.getMem_id())){
			alarmService.insert_alarmInfo(alarmInfo);
		}
		
		return "timeline/postComment";
	}
	
	
	
	/**
	 * Method : deleteComment
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param comment_code
	 * @return
	 * Method 설명 : 댓글 삭제
	 */
	@RequestMapping(path={"/deletecomment"})
	public String deleteComment(String comment_code, String ref_code, int page_num, HttpServletRequest request, Model model){
		
		commentService.delete_comment(comment_code);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		PaginationVo paginationVo = new PaginationVo(1, page_num * 5);
		paginationVo.setDivision("28");
		paginationVo.setRef_code(ref_code);
		paginationVo.setMem_id(memberInfo.getMem_id());
		
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		int commentCnt = (int) resultMap.get("commentCnt");
		
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		
		model.addAttribute("ref_code", ref_code);
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("page_num", page_num);
		
		
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
		
		//글 추천 -> 알림 등록
		PostVo postInfo = postService.select_postInfo(ref_code);
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setMem_id(postInfo.getMem_id());
		alarmInfo.setRef_code(ref_code);
		alarmInfo.setDivision("28");
		alarmInfo.setSend_id(memberInfo.getMem_id());
		alarmInfo.setAlarm_separate("01");
		alarmInfo.setAlarm_check("0");
		
		if(!memberInfo.getMem_id().equals(postInfo.getMem_id())){
			alarmService.insert_alarmInfo(alarmInfo);
		}
		
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
		
		String good_code = goodService.search_goodcode(goodVo);
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setRef_code(good_code);
		alarmInfo.setSend_id(memberInfo.getMem_id());
		
		//좋아요 취소 -> 알림 정보 삭제
		
		alarmService.delete_goodalarm(alarmInfo);
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
	public String push_postSave(String post_code, HttpServletRequest request, Model model){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		Save_postVo saveVo = new Save_postVo();
		
		saveVo.setMem_id(memberInfo.getMem_id());
		saveVo.setSave_post_code(post_code);
		
		savepostService.insert_savepostData(saveVo);
		
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		
		return savepostCnt+"";
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
		
		savepostService.delete_savepostData(saveVo);
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		
		return savepostCnt+"";
	}
	
	@RequestMapping(path={"/deletepost"}, method=RequestMethod.POST)
	@ResponseBody
	public String deletePost(String post_code){
		postService.delete_post(post_code);
		
		return "complate";
	}
	
	/**
	 * Method : getPostInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param model
	 * @param request
	 * @return
	 * Method 설명 : 특정 게시물 내용 조회
	 */
	@RequestMapping(path={"/getpostinfo"}, method=RequestMethod.POST)
	@ResponseBody
	public String getPostInfo(String post_code){
		
		PostVo postInfo = postService.select_postInfo(post_code);
		String contents = postInfo.getPost_contents();
		
		return contents;
	}
	
	/**
	 * Method : updatePost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param post_contents
	 * @param request
	 * @param model
	 * @return
	 * Method 설명 : 게시물 수정
	 */
	@RequestMapping(path={"/updatepost"}, method=RequestMethod.POST)
	public String updatePost(String post_code, String post_contents, HttpServletRequest request, Model model){
		
		PostVo updatePost = new PostVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		
		
		updatePost.setPost_contents(post_contents);
		updatePost.setPost_code(post_code);
		
		postService.update_post(updatePost);
		
		
		//수정된 게시글의 해시태그 추출
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(post_contents);
		
		String hashtag = "";
		
		Hashtag_listVo taglistVo = new Hashtag_listVo();
		String hashtag_name = "";
		
		taglistVo.setDivision("28");
		taglistVo.setRef_code(post_code);
		
		taglistService.delete_hashtaglist(taglistVo); // 해당 글에 등록된 hashtag를 초기화(모두삭제)
		
		List<String> tagList = new ArrayList<String>();
		
		while(m.find()){
			hashtag = hashtag_replace(m.group());
			tagList.add(hashtag);
			
			List<Hashtag_listVo> beforList = taglistService.select_hashtaglist(taglistVo);
			
			
			if(hashtag != null){
				logger.debug("추출된 해시태그 : {}", hashtag);
				taglistVo.setHashtag_name(hashtag);
				
				hashtagService.insert_hashtag(hashtag);
				taglistService.insert_hashtaglist(taglistVo);
			}
		}
		
		String param_hashtag = "";
		String replacedPost_contents = "";
		for(int i=0; i<tagList.size(); i++){
			String[] temp = post_contents.split(tagList.get(i), 2);
			
			if(temp.length == 1){
				
				param_hashtag = tagList.get(i).split("#")[1];
				logger.debug("param_hashtag : {}", param_hashtag);
				
				replacedPost_contents += "<a class='hashtag' href='/hashtagpost?hashtag_name=" + param_hashtag + "'>" + tagList.get(i) + "</a>";	
				post_contents = temp[0];
			} else {
				replacedPost_contents += temp[0];
				
				param_hashtag = tagList.get(i).split("#")[1];
				logger.debug("param_hashtag : {}", param_hashtag);
				
				replacedPost_contents += "<a class='hashtag' href='/hashtagpost?hashtag_name=" + param_hashtag + "'>" + tagList.get(i) + "</a>";
				post_contents = temp[1];
			}
			
			if(i == tagList.size() - 1){
				replacedPost_contents += temp[1];
			}
		}
		
		if(!replacedPost_contents.equals("")){
			updatePost.setPost_contents(replacedPost_contents);
			int postInsertCnt =  postService.update_post(updatePost);
		}
		
		return "redirect:/timeline";
	}
	
	/**
	 * Method : unfolow
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param target_id
	 * @param request
	 * @return
	 * Method 설명 : 언팔로우
	 */
	@RequestMapping(path={"/unfollow"}, method=RequestMethod.POST)
	@ResponseBody
	public String unfolow(String target_id, HttpServletRequest request){
		
		FollowVo followInfo = new FollowVo();
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setRef_keyword(target_id);
		
		followService.delete_follow(followInfo);
		
		return "complate";
	}
	
	/**
	 * Method : postReport
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param request
	 * @return
	 * Method 설명 : 게시글 신고
	 */
	@RequestMapping(path={"/postreport"}, method=RequestMethod.POST)
	@ResponseBody
	public String postReport(String post_code, String report_contents, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		ReportVo report = new ReportVo();
		report.setDivision("28");
		report.setRef_code(post_code);
		report.setMem_id(memberInfo.getMem_id());
		report.setReport_contents(report_contents);
		
		reportService.insert_reportInfo(report);
		
		return "complate";
	}
	
	/**
	 * Method : commentReport
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param comment_code
	 * @param request
	 * @return 
	 * Method 설명 : 댓글 신고
	 */
	@RequestMapping(path={"/commentreport"}, method=RequestMethod.POST)
	@ResponseBody
	public String commentReport(String comment_code, String report_contents, HttpServletRequest request){
		//댓글 신고기능 구현 예정
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		ReportVo report = new ReportVo();
		report.setDivision("29");
		report.setRef_code(comment_code);
		report.setMem_id(memberInfo.getMem_id());
		report.setReport_contents(report_contents);
		
		reportService.insert_reportInfo(report);
		
		return "complate";
	}
	
	@RequestMapping(path={"/push_commentgood"}, method=RequestMethod.POST)
	@ResponseBody
	public String commentGood(String comment_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		Post_commentVo commentInfo = commentService.select_commentInfo(comment_code);
		
		GoodVo goodInfo = new GoodVo();
		goodInfo.setDivision("29");
		goodInfo.setMem_id(memberInfo.getMem_id());
		goodInfo.setRef_code(comment_code);
		
		goodService.insert_goodInfo(goodInfo);
		
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setRef_code(comment_code);
		alarmInfo.setSend_id(memberInfo.getMem_id());
		alarmInfo.setDivision("29");
		alarmInfo.setAlarm_separate("03");
		alarmInfo.setAlarm_check("0");
		
		if(!memberInfo.getMem_id().equals(commentInfo.getMem_id())){
			alarmService.insert_alarmInfo(alarmInfo);
		}
		
		
		return "complate";
	}
	
	@RequestMapping(path={"/push_commentgoodcancel"}, method=RequestMethod.POST)
	@ResponseBody
	public String commentGoodCancel(String ref_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		GoodVo goodInfo = new GoodVo();
		goodInfo.setMem_id(memberInfo.getMem_id());
		goodInfo.setRef_code(ref_code);
		goodInfo.setDivision("29");
		
		String good_code = goodService.search_goodcode(goodInfo);
		
		AlarmVo alarmInfo = new AlarmVo();
		alarmInfo.setRef_code(good_code);
		alarmInfo.setSend_id(memberInfo.getMem_id());
		
		//좋아요 취소 -> 알림 정보 삭제
		alarmService.delete_goodalarm(alarmInfo);
		goodService.delete_goodInfo(goodInfo);
		
		return "complate";
	}
	
	
	/**
	 * Method : hidePost
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param post_code
	 * @param request
	 * @return
	 * Method 설명 : 글 숨기기
	 */
	@RequestMapping(path={"/hidepost"}, method=RequestMethod.POST)
	@ResponseBody
	public String hidePost(String post_code, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		Hide_postVo hideVo = new Hide_postVo();
		hideVo.setMem_id(memberInfo.getMem_id());
		hideVo.setPost_code(post_code);
		
		hide_postService.insert_hidepostInfo(hideVo);
		
		return "complate";
	}
	
	/**
	 * Method : getCommentInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param comment_code
	 * @return
	 * Method 설명 : 특정 댓글 내용 조회
	 */
	@RequestMapping(path={"/getcommentInfo"}, method=RequestMethod.POST)
	@ResponseBody
	public String getCommentInfo(String comment_code){
		
		Post_commentVo commentInfo = commentService.select_commentInfo(comment_code);
		String comment_contents = commentInfo.getComment_contents();
		
		return comment_contents;
	}
	
	@RequestMapping(path={"/savepost"}, method=RequestMethod.GET)
	   public String savePost(Model model, HttpServletRequest request){
	      
	      PaginationVo paginationVo = new PaginationVo();
	      
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
	      
	      
	      List<PostVo> savePost = postService.select_savePost(paginationVo);
	      model.addAttribute("memberInfo", memberInfo);
	      model.addAttribute("savePost", savePost);

	      List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
	      model.addAttribute("goodList", goodList);
	      
	      List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
	      
	      
	      model.addAttribute("saveList", saveList);
	      
	      return "savePostTiles";
	   }
	
	@RequestMapping(path={"/nextsavepost"}, method=RequestMethod.POST)
	public String nextSavePost(String pageNum, String lastPost, String ref_code, Model model, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		int page = Integer.parseInt(pageNum);
		
		PaginationVo paginationVo = new PaginationVo();
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setPage(page);
		paginationVo.setCriteria_code(lastPost);
		
		List<PostVo> nextSavePost = postService.select_nextSavePost(paginationVo);
		
		model.addAttribute("nextSavePost", nextSavePost);
		model.addAttribute("memberInfo", memberInfo);
		
		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		return "timeline/nextSavePost";
	}
	
	@RequestMapping(path={"/hashtagpost"}, method=RequestMethod.GET)
	public String hashtagPost(Model model, HttpServletRequest request, String hashtag_name){
		
		PaginationVo paginationVo = new PaginationVo();
		
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
		paginationVo.setHashtag_name("#" + hashtag_name);
		
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
		
		List<PostVo> hashtagPost = postService.select_hashtagPost(paginationVo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("hashtagPost", hashtagPost);

		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		int tagFollowerCount = followService.select_hashtagFollowCount("#" + hashtag_name);
		model.addAttribute("tagFollowerCount", tagFollowerCount);
		
		FollowVo followtag = new FollowVo();
		followtag.setMem_id(memberInfo.getMem_id());
		followtag.setRef_keyword("#"+hashtag_name);
		
		int followStatus = followService.select_followHashtagInfo(followtag);
		model.addAttribute("followStatus", followStatus);
		
		model.addAttribute("hashtag_name", hashtag_name);
		
		return "hashtagPostTiles";
	}
	
	@RequestMapping(path={"/nexthashtagpost"}, method=RequestMethod.POST)
	@ResponseBody
	public String nextHashtagPost(String pageNum, String lastPost, String ref_code, Model model, HttpServletRequest request){
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");

		int page = Integer.parseInt(pageNum);
		
		PaginationVo paginationVo = new PaginationVo();
		paginationVo.setMem_id(memberInfo.getMem_id());
		paginationVo.setPage(page);
		paginationVo.setCriteria_code(lastPost);
		
		List<PostVo> nextHashtagPost = postService.select_nextHashtagPost(paginationVo);
		
		model.addAttribute("nextHashtagPost", nextHashtagPost);
		model.addAttribute("memberInfo", memberInfo);
		
		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		return "timeline/nextHashtagPost";
	}
	
	@RequestMapping(path={"/unfollow_hashtag"}, method=RequestMethod.POST)
	@ResponseBody
	public String unfollow_hashtag(String hashtag_name, HttpServletRequest request){
		
		logger.debug("hashtag_name qqqqqqqqq : {}", hashtag_name);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		FollowVo followInfo = new FollowVo();
		
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setRef_keyword("#"+hashtag_name);
		followInfo.setDivision("16");
		
		
		followService.delete_follow(followInfo);
		int followerCnt = followService.select_hashtagFollowCount("#"+hashtag_name);
		
		return followerCnt + "";
	}
	
	@RequestMapping(path={"/follow_hashtag"}, method=RequestMethod.POST)
	@ResponseBody
	public String follow_hashtag(String hashtag_name, HttpServletRequest request){
		
		logger.debug("hashtag_name qqqqqqqqq : {}", hashtag_name);
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		FollowVo followInfo = new FollowVo();
		
		followInfo.setMem_id(memberInfo.getMem_id());
		followInfo.setRef_keyword("#"+hashtag_name);
		followInfo.setDivision("16");
		
		followService.insert_follow(followInfo);
		int followerCnt = followService.select_hashtagFollowCount("#"+hashtag_name);
		
		
		return followerCnt + "";
	}
	
	@RequestMapping(path="/postdetail")
	public String postDetailFromAlarm(String post_code, String ref_code, String mem_id, Model model, HttpServletRequest request) throws ParseException{
		
		MemberVo memberInfo = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
		
		PaginationVo tagCountPageVo = new PaginationVo(1, 10);
		tagCountPageVo.setMem_id(memberInfo.getMem_id());
		tagCountPageVo.setDivision("16");
		
		//저장글 갯수 
		int savepostCnt = savepostService.savepost_count(memberInfo.getMem_id());
		model.addAttribute("savepostCnt", savepostCnt);
		
		PaginationVo paginationVo = new PaginationVo(1, 999999);
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
		PostVo postInfo = postService.select_postInfo(post_code);
		model.addAttribute("post", postInfo);
		
		paginationVo.setDivision("28");
		paginationVo.setRef_code(ref_code);
		paginationVo.setMem_id(postInfo.getMem_id());
		
		Map<String, Object> resultMap = commentService.select_commentList(paginationVo);
		
		List<Post_commentVo> commentList = (List<Post_commentVo>) resultMap.get("commentList");
		int commentCnt = (int) resultMap.get("commentCnt");
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentCnt", commentCnt);
		
		model.addAttribute("memberInfo", memberInfo);

		List<GoodVo> goodList = goodService.select_pushedGoodPost(memberInfo.getMem_id());
		model.addAttribute("goodList", goodList);
		
		List<Save_postVo> saveList = savepostService.select_savepostData(memberInfo.getMem_id());
		model.addAttribute("saveList", saveList);
		
		/////////////////////////////// newList
				
		// 광고 부분 -> 신규 채용공고 (newList)
		List<RecruitVo> newList = recrService.getNewList();
		
		// newList size : 7. index 6 -> index 0에 add.
		newList.add(0, newList.get(6));
		
		List<String> newImgList = new ArrayList<>();
		List<String> newNmList = new ArrayList<>();
		List<String> newTimeList = new ArrayList<>();
		
		for(int i=0; i < newList.size(); i++){
			RecruitVo rVo = newList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			newImgList.add(cVo.getLogo_path());
			newNmList.add(cVo.getCorp_name());
			
			String start_date = rVo.getStart_date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				newTimeList.add("방금");
			}else if(time_diff < 60){
				newTimeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				newTimeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				newTimeList.add(time_diff/(60*24) + "일");
			}else{
				newTimeList.add(time_diff/(60*24*30) + "달");
			}				
		}		
		
		model.addAttribute("newList", newList);
		model.addAttribute("newImgList", newImgList);
		model.addAttribute("newNmList", newNmList);
		model.addAttribute("newTimeList", newTimeList);
		
		/////////////////////////////// newList
		
		return "postDetailTiles";
	}
	
	@RequestMapping(path={"/recommendpost"}, method=RequestMethod.POST)
	public String recommendPost(String param){
		
		return "timeline/recommendPost";
	}
	
}
