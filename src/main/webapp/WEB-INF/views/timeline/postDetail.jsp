<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<div class="container">
   <div class="row">
      <div>
         
         <%@ include file="/WEB-INF/views/timeline/timeline_left.jsp" %>
         
         <div class="col-md-6">
           
           <!-- feed -->
           <div class="post-group">
             <!-- post -->
                
              <div id="col-post${post.post_code }" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
              <div class="col-post" id="post${post.post_code }" style="margin-top: 0px;">
               <div class="col-post-body">
                 <a
                   <c:choose>
                     <c:when test="${post.mem_division eq 1 }">href="/profileHome?user_id=${post.mem_id }"</c:when>
                     <c:when test="${post.mem_division eq 2 }">href="/corporation?corp_id=${post.mem_id }"</c:when>
                   </c:choose>>
                   <div class="writer_info" style="float: left;">
                  	 <a style="font-size: 20px;" 
                  	   <c:choose>
                  	     <c:when test="${post.mem_division eq 1 && !post.mem_id eq memberInfo.mem_id}">href="/profileHome?user_id=${post.mem_id }"</c:when>
                  	     <c:when test="${post.mem_division eq 1 && post.mem_id eq memberInfo.mem_id}">href="/profileHome"</c:when>
                  	     <c:when test="${post.mem_division eq 2 }">href="/corporation?corp_id=${post.mem_id }"</c:when>
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
            
               <!-- 댓글수, 좋아요 수 출력 -->
               <div class="post_socialCount">
                 <ul style="padding-left: 10px;">
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_goodcount" title="goodCount ${post.post_code }" style="font-size: 12px;">추천 
                         <span id="txt_good_count${post.post_code }">${post.goodcount }</span>
                       </button>
                    </li>
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_commentcount" id="btn_commentcount${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 
                         <span id="txt_comment_count${post.post_code }">${post.commentcount }</span>
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
                 <button class="btn-social btn_comment" id="btn_comment${post.post_code }" data-code="${post.post_code }" title="${post.post_code }"><span style="font-size: 18px;"><i class="far fa-comments"></i></span></button>
                 <!-- 글 저장 버튼 -->
                 <button class="btn-social btn_save" title="${post.post_code }">
                   <span style="font-size: 18px;">
                     <i id="icon_save${ post.post_code }" class="far fa-bookmark"></i>
                   </span>
                 </button>
               </div>
               
               <!-- comment -->
               <div class="col-comment-area ${post.post_code }" id="post_comment ${post.post_code }">
				 <div class="col-comment" title="${ref_code }">
				 <!-- comment input area -->
				   <div class="comment_inputarea">
				     <div class="comment-profile-img" style="float: left; width: 10%; padding-top: 20px;">
				       <!-- 로그인 한 회원의 프로필 사진 -->
				       <c:choose>
				         <c:when test="${memberInfo.mem_division == '1' }">
				       	  <c:if test="${commentwriter.profile_path == null }">
				       	    <a class="contents_writer_image"><button class="contents_writer_image"style="padding: 5px;"><i class="far fa-user"></i></button></a>
				       	  </c:if>
				       	  <c:if test="${commentwriter.profile_path != null} ">
				       	    <a class="contents_writer_image"><img class="contents_writer_image" src="${commentwriter.profile_path }"></a>
				       	  </c:if>
				         </c:when>
				         <c:when test="${memberInfo.mem_division == '2' }">
				       	  <c:if test="${commentwriter.logo_path == null }">
				       	    <a class="contents_writer_image"><button class="contents_writer_image"><i class="far fa-building"></i></button></a>
				       	  </c:if>
				       	  <c:if test="${commentwriter.logo_path != null} ">
				       	    <a class="contents_writer_image"><img class="contents_writer_image" src="${commentwriter.logo_path}"></a>
				       	  </c:if>
				         </c:when>
				         <c:otherwise><!-- 관리자일 경우 댓글작성 기능 x --></c:otherwise>
				       </c:choose>
				     </div>
				   
				     <div class="comment-area-input" style="padding-top: 20px; position : 50px;">
				       <div class="comment-input-img" style="float: right; width: 8%;">
				     	<button class="input_comment_img"><i class="fas fa-camera"></i></button>
				       </div>    
				       <div class="comment-input-text" style="float: right; width: 80%">
				     	  <!-- 작성 내용 -->
				     	<textarea id="input_comment_contents ${ref_code }" class="input_comment_contents" name="input_comment_contents"></textarea>
				       </div>
				       <form>
				     	<button type="button" class="btn_commentWrite ${ref_code}">올리기</button>
				       </form>
				     </div>
				   </div>
				 <!-- /comment input area -->  
				 <!-- comment print area -->
				   <div class="comment-printarea">
				     <c:forEach items="${commentList }" var="comment">
				       <div id="comment-info${comment.comment_code }">
				         <div class="comment-area ${ref_code }" id="comment-area${comment.comment_code }" data-comment="${comment.comment_code }">
				           <div class="comment-date-info">
				             <c:choose>
				               <c:when test="${comment.resultMinute <= 1 }">
				                 <span>방금 전</span>
				               </c:when>
				               <c:when test="${comment.resultMinute < 60 }">
				                 <span>${comment.resultMinute }분 전</span>
				               </c:when>
				               <c:when test="${comment.resultMinute < 1440 }">
				                 <span>${fn:split((comment.resultMinute/60), '.')[0] }시간 전</span>
				               </c:when>
				               <c:when test="${comment.resultMinute < 43200 }">
				                 <span>${fn:split((comment.resultMinute/1440),'.')[0] }일 전</span>
				               </c:when>
				               <c:when test="${comment.resultMinute < 518400 }">
				                 <span>${fn:split((comment.resultMinute/43200),'.')[0] }달 전</span>
				               </c:when>
				             </c:choose>
				 	  	  <c:if test="${comment.mem_id eq memberInfo.mem_id }">
				               <div class="dropdown" >
				                 <button class="btn_commentControll" type="button" data-code="${comment.comment_code }" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				 	  	        <i class="fas fa-ellipsis-h"></i>
				 	  	      </button>
				 	  		  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				        			<button class="btn_controll-list btn_updateComment" data-code="${comment.comment_code }"><i class="fas fa-edit"></i>&nbsp;<span>댓글 수정</span></button>
				         	    <button class="btn_controll-list btn_deleteComment" data-code="${comment.comment_code }"><i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span></button>
				 	  	      </ul>
				               </div>
				 	  	  </c:if>
				           </div>
				           <div class="comment-profile-img" style="float: left; padding: 5px; width: 10%;">
				             <c:choose>
				               <c:when test="${comment.profile_path != null && comment.logo_path == null }">
				                 <a class="contents_writer_image"><img class="contents_writer_image" src=""></a>
				               </c:when>
				               <c:when test="${comment.profile_path == null && comment.logo_path != null }">
				                 <a class="contents_writer_image"><img class="contents_writer_image" src=""></a>
				               </c:when>
				 	  	    <c:otherwise>
				 	  		  <a class="contents_writer_image"><button class="contents_writer_image"><i class="far fa-user"></i></button></a>
				 	  	    </c:otherwise>
				 	        </c:choose>
				 	        <a></a>
				           </div>
				           <div class="comment-text" id="comment-text${comment.comment_code }">
				   	        <div class="comment-contents" id="comment-conetents${comment.comment_code}">${comment.comment_contents }</div>
				           </div>
				           <div class="comment-input-button">
				             <button class="btn-comment-social btn_commentGood" id="btn_commentGood${comment.comment_code }" data-code="${comment.comment_code }">
				               <i id="icon_commentgood${comment.comment_code }" class="far fa-thumbs-up"></i>
				             </button>
				             <c:if test="${comment.mem_id != memberInfo.mem_id }">
				               <button class="btn-comment-social"><i class="far fa-flag"></i></button>
				             </c:if>
				           </div>
				         </div>
				       </div>
				     </c:forEach>
				   </div>
				   <!-- /comment print area -->
				   <div class="morecomment">
				   	<a><button type="button" id="btn_moreComment" class="btn_moreComment" title="${ref_code }">댓글 더 보기</button></a>
				   	<input id="commentCnt" class="commentCnt" type="hidden" value="${commentCnt }">
				   </div>
				 </div>
               </div>
               <!-- /comment -->
            
              </div>
            </div>

             <!-- ./post -->
           </div>
           <!-- ./feed -->
         </div>
         <%@ include file="/WEB-INF/views/timeline/timeline_right.jsp" %>
     <!-- ./main -->
	     <%@ include file="/WEB-INF/views/timeline/updateModal.jsp" %><!-- 글 수정 모달창 -->
	     <%@ include file="/WEB-INF/views/timeline/reportModal.jsp" %><!-- 글 신고 모달창 -->
      </div>
   </div>
</div>

<script src="/js/timeline.js"></script>
<script src="/js/comment.js"></script>
<script>

	$(document).ready(function() {
	  <c:forEach items="${ saveList }" var="savepost"> 
	     $('#icon_save${savepost.save_post_code}').attr('class', 'fas fa-bookmark');
	  </c:forEach> 
	  
	  <c:forEach items="${ goodList }" var="goodpost"> 
	     $('#icon_good${ goodpost.ref_code}').attr('class', 'fas fa-thumbs-up');   
	  </c:forEach> 
	});

</script>