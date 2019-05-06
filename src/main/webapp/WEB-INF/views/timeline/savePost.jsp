<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<link href="/css/timeline/comment.css" rel="stylesheet">
<div class="container">
   <div class="row">
      <div>
         
         <%@ include file="/WEB-INF/views/timeline/timeline_left.jsp" %>
         
         <div class="col-md-6">
           <div class="input-group">
             <div  style="width: 555px; height: 100px; padding: 10px; padding-top: 35px; background: #fff; border-radius: 5px; box-shadow: 0 6px 12 rgba(0,0,0,.175);">
               <h3 style="margin-top: 0px; font-weight: bold; color: #8D9191;">저장한 글</h3>
             </div>
           </div><hr>
           
           <div class="post-group">
             <!-- post -->
             <c:forEach items="${savePost }" var="post">
                
              <div id="col-post${post.post_code }" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
              <div class="col-post" id="post${post.post_code }">
               <div class="col-post-body">
                 <a
                   <c:choose>
                     <c:when test="${post.mem_division eq 1 }">href="/profileHome?user_id=${post.mem_id }"</c:when>
                     <c:when test="${post.mem_division eq 2 }">href="/corp/corporation?corp_id=${post.mem_id }"</c:when>
                   </c:choose>>
                   <div class="writer_info" style="display: inline-block;">
                     <a 
                       <c:choose>
                         <c:when test="${post.mem_division eq '1' && post.mem_id eq SESSION_MEMBERVO.mem_id}">href='/profileHome'</c:when>
                         <c:when test="${post.mem_division eq '1' && post.mem_id != SESSION_MEMBERVO.mem_id}">href='/profileHome?user_id=${post.mem_id }'</c:when>
                         <c:when test="${post.mem_division eq '2'}">href='/corp/corporation?corp_id=${post.mem_id }'</c:when>
                       </c:choose>
                     >
                       <!-- 작성자 사진 -->
                       <c:choose>
                       
                         <c:when test="${post.mem_division eq '1'}">
	                       <img src="${ cp }/view/imageView?mem_id=${post.mem_id }&division=pf" class="writer_profile">
                         </c:when>
                         
                         <c:when test="${post.mem_division eq '2'}">
                         
                           <c:choose>
                           
                             <c:when test="${fn:contains(post.profile_path, 'http') }">
                               <img src="${post.profile_path }" class="writer_profile_corp">
                             </c:when>
                             
                             <c:otherwise>
                               <img src="${ cp }/view/imageView?mem_id=${post.mem_id }&division=pf" class="writer_profile_corp">
                             </c:otherwise>
                           </c:choose>
                           
                         </c:when>
                         
                       </c:choose>
                     </a>
                  	 <a style="font-size: 20px;" 
                  	   <c:choose>
                  	     <c:when test="${post.mem_division eq 1 && !post.mem_id eq memberInfo.mem_id}">href="/profileHome?user_id=${post.mem_id }"</c:when>
                  	     <c:when test="${post.mem_division eq 1 && post.mem_id eq memberInfo.mem_id}">href="/profileHome"</c:when>
                  	     <c:when test="${post.mem_division eq 2 }">href="/corp/corporation?corp_id=${post.mem_id }"</c:when>
                  	   </c:choose>>${post.writer_name }</a>
                     <c:choose>
                       <c:when test="${post.resultMinute <= 1 }">
                         <span>방금 전</span>
                       </c:when>
                       <c:when test="${post.resultMinute < 60 }">
                           <span>${post.resultMinute }분 전</span>
                         </c:when>
                         <c:when test="${post.resultMinute < 1440 }">
                           <span>${fn:split((post.resultMinute/60), '.')[0] }시간 전</span>
                         </c:when>
                         <c:when test="${post.resultMinute < 43200 }">
                           <span>${fn:split((post.resultMinute/1440),'.')[0] }일 전</span>
                         </c:when>
                         <c:when test="${post.resultMinute < 518400 }">
                           <span>${fn:split((post.resultMinute/43200),'.')[0] }달 전</span>
                         </c:when>
                     </c:choose>
                   </div>
                 </a>
                 <!-- 게시물 관리버튼(dropdown) -->
                  <div class="dropdown" style="float: right;">
                   <button class="btn_postControll" data-code="${post.post_code }" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;">
                      <i class="fas fa-ellipsis-h"></i>
                   </button>
                   <c:choose>
                     <c:when test="${post.mem_id eq memberInfo.mem_id }">
                     <ul class="dropdown-menu manage_mypost" role="menu" aria-labelledby="dLabel">
                            <button id="btn_modifyPost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_modifyPost">
                              <i class="fas fa-edit"></i>&nbsp;<span>글 수정</span>
                           </button>
                            <button id="btn_deletePost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_deletePost">
                              <i class="far fa-trash-alt"></i>&nbsp;<span>글 삭제</span>
                          </button>
                            <button id="btn_blockComment${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_blockComment">
                              <i class="fas fa-comment-slash"></i>&nbsp;<span>댓글 차단</span>
                           </button>
                       </ul>
                     </c:when>
                     <c:otherwise>
                       <ul class="dropdown-menu manege_post" role="menu" aria-labelledby="dLabel">
                            <button id="btn_hidePost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_hidePost" style="padding-right: 65.69px;">
                              <i class="far fa-eye-slash">&nbsp;</i><span>글 숨기기</span>
                           </button>
                            <button id="btn_unfollowWriter${post.post_code }" data-writer="${post.mem_id }" data-name="${post.writer_name }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_unfollow" style="padding-right: 24.33px;">
                              <i class="fas fa-ban"></i>&nbsp;<span>${post.writer_name }&nbsp;언 팔로우</span>
                          </button>
                            <button id="btn_reportPost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_reportPost" style="padding-right: 84.22px;">
                              <i class="far fa-flag"></i>&nbsp;<span>글 신고</span>
                           </button>
                       </ul>
                     </c:otherwise>  
                   </c:choose>
                  </div>
                 
               </div>
               <div class="post_info">
                 <pre class="post_contents" style="background: #ffffff; border-color: #ffffff; margin-left: 9px;">${post.post_contents }</pre>
               </div>
            
               <div class="col-post-footer">
                 <span></span>
               </div>
               
               <!-- 댓글수, 좋아요 수 출력 -->
               <div class="post_socialCount">
                 <ul style="padding-left: 10px;">
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_goodcount" title="goodCount ${post.post_code }" style="font-size: 12px;">추천 
                         <span id="txt_good_count${post.post_code }">
                           <c:choose>
                             <c:when test="${post.goodcount eq null }">0</c:when>
                             <c:otherwise>${post.goodcount }</c:otherwise>
                           </c:choose>
                         </span>
                       </button>
                    </li>
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_commentcount" id="btn_commentcount${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 
                         <span id="txt_comment_count${post.post_code }">
                           <c:choose>
                         	 <c:when test="${post.commentcount eq null }">0</c:when>
                         	 <c:otherwise>${post.commentcount }</c:otherwise>
                           </c:choose>
                         </span>
                       </button>
                    </li>
                 </ul>
               </div>
               <div class="col-post-social">
                 <!-- 좋아요 버튼 -->
                 <button class="btn-social btn_good" style="margin-left: 10px; margin-top: 2px;" title="${post.post_code }">
                   <span style="font-size: 18px;">
                     <i id="icon_good${post.post_code }" class="far fa-thumbs-up"></i>
                   </span>
                 </button>
                 <!-- 댓글 출력 버튼 -->
                 <button class="btn-social btn_comment" data-toggle="collapse" data-target="#comment_area${post.post_code }" aria-expanded="false" aria-controls="collapseExample" onclick="post_commentList('${post.post_code }');">
                 	<span style="font-size: 18px;"><i class="far fa-comments"></i></span>
                 </button>
                 <!-- 글 저장 버튼 -->
                 <button class="btn-social btn_save" title="${post.post_code }">
                   <span style="font-size: 18px;">
                     <i id="icon_save${ post.post_code }" class="far fa-bookmark"></i>
                   </span>
                 </button>
               </div>
               
               <!-- comment -->
               <div class="collapse" id="comment_area${ post.post_code }">
				  <div class="well" id="comment_content${ post.post_code }"></div>
			   </div>
               <!-- /comment -->
            
              </div>
            </div>

             </c:forEach>
             <!-- ./post -->
           </div>
           </div>
           <!-- ./feed -->
         <%@ include file="/WEB-INF/views/timeline/timeline_right.jsp" %>
     <!-- ./main -->
	     <%@ include file="/WEB-INF/views/timeline/writeModal.jsp" %><!-- 글 작성 모달창 -->
	     <%@ include file="/WEB-INF/views/timeline/updateModal.jsp" %><!-- 글 수정 모달창 -->
	     <%@ include file="/WEB-INF/views/timeline/reportModal.jsp" %><!-- 글 수정 모달창 -->
      </div>
   </div>
</div>


<script src="/js/timeline.js"></script>
<script type="text/javascript">
	
	//댓글 버튼 클릭
	function post_commentList(post_code){
		$.ajax({
			url : "/commentArea",
			data : {"ref_code" : post_code },
			success : function(data) {
				
				$('#comment_content'+post_code).html(data);
			}
		});
	}
   
   var pageNum = 2;
   var lastPost;
   
   //스크롤 이벤트 발생 시
   $(window).scroll(function () {
      
      var currentTop = $(window).scrollTop();
      
      if($(window).scrollTop() > 50){
         $("#col-add").stop().animate({top: (currentTop-20) + "px"}, 250);
         $("#col-info").stop().animate({top: (currentTop-20) + "px"}, 250);
      } else {
         $("#col-add").stop().animate({top: 0 + "px"}, 250);
         $("#col-info").stop().animate({top: 0 + "px"}, 250);
      }
      
      lastPost = $(".scrolling:last").attr("data-post");

      if($(window).scrollTop() >= $(document).height() - $(window).height() - 1){
         
         $.ajax({
            type : 'POST',
            url : '/nextsavepost',
            data : {"lastPost" : lastPost, "pageNum" : pageNum},
            success : function(data) {
               
               pageNum++;
               
               if(data != ""){
                  $(".col-md-6").append(data);
               }
            }
         });
      }
   });
   
   $(document).ready(function() {
	    <c:forEach items="${ saveList }" var="savepost"> 
	       $('#icon_save${savepost.save_post_code}').attr('class', 'fas fa-bookmark');   
	    </c:forEach> 
	    
	    <c:forEach items="${ goodList }" var="goodpost"> 
	       $('#icon_good${ goodpost.ref_code}').attr('class', 'fas fa-thumbs-up');   
	    </c:forEach> 
  });
   
	//////////////////////////// newList
	// newList 슬라이드
	newList_slide = setInterval("fn_newSlide()", 4000);
	
	// newList 마우스오버 - 슬라이드 멈춤.
	$("#div_newList").on("mouseover", function(){
		newSlide_flag = false;
	});
	$("#div_newList").on("mouseout", function(){
		newSlide_flag = true;
	});		
	
	// newList 슬라이드 버튼 클릭.
	$(".fa-circle").on("click", function(){
//		alert($(this).index());
		$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "far fa-circle");
		$(this).attr("class", "fas fa-circle");	
		
		// 이동할 칸 수. (move_page)
		var move_page = ($(this).index()) - (newList_num-1);
		
		// newList_num 변경.
		newList_num = ($(this).index())+1;
		
		// 슬라이드 이동.
		$("#content_newList").stop(true, true);
		var moveX = parseInt($("#content_newList").css("margin-left"));
		
		if( moveX > -3000 ){
			$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
		}
	});
	
	// 채용공고 클릭.
	$(".recr").on("click", function(){
//		alert($(this).data("code"));
		window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=timeline';
	});
	
	//////////////////////////// newList	  



////////////////////////////newList

// div_newList 마우스오버 시 false - 슬라이드 멈춤.
var newSlide_flag = true;	

// 자동 슬라이드
var newSlide_width = 290;
var newList_num = 1;

function fn_newSlide(){
	if(newSlide_flag == false){
		return;
	}
	
	if(newList_num > 6){
//		clearInterval(slide_switch);
		$("#content_newList").css("margin-left", "0px");
		newList_num = 0;
	}
	
	newList_num++;
	
	$("#content_newList").stop(true, true);
	var moveX = parseInt($("#content_newList").css("margin-left"));
	
	if( moveX > -2000 ){
		// 버튼 class 바꾸기.
		if(newList_num == 1){
			$(".fa-circle:eq(6)").attr("class", "far fa-circle");
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
		}else{
			$(".fa-circle:eq("+ (newList_num-2) +")").attr("class", "far fa-circle");
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
		}
		
		$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
	}
}	

//////////////////////////// newList	
   
</script>