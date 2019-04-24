<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="col-md-6">
	<div class="panel panel-default">
		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>

		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>

		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>

		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>

		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>

		<div class="panel-body">
			<span class="span-text"><a>게시글 영역</a></span>
		</div>
	</div>
</div>


<%-- <div class="col-md-6">
	<!-- feed -->
           <div class="post-group">
             <!-- post -->
             <c:forEach items="${ timelinePost }" var="post">
                
              <div id="col-post${ post.post_code }" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
              <div class="col-post" id="post${post.post_code }">
               <div class="col-post-body">
                 <a href="#" >
                  <div class="writer_info" style="float: left;">
                    <a style="font-size: 20px;" href="#">${ post.writer_name }</a>
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
</div> --%>












<script>
	
</script>


