<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="/css/timeline/writemodal.css" rel="stylesheet">
<link href="/css/timeline/comment.css" rel="stylesheet">
<link href="/css/timeline/postGoodMembers.css" rel="stylesheet">

    <div class="row">
    
    	<div class="col-md-6">
    		
    		<div class="post-group">
             <!-- post -->
             <c:forEach items="${corpPost }" var="post">
                
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
	                      <a class="btn_count btn_goodcount" href="javascript:activityClick('${post.post_code}');" title="goodCount ${post.post_code }" style="font-size: 12px;">추천 
	                        <span id="txt_good_count${post.post_code }">
	                          <c:choose>
	                            <c:when test="${post.goodcount eq null }">0</c:when>
	                            <c:otherwise>${post.goodcount }</c:otherwise>
	                          </c:choose>
	                        </span>
	                      </a>
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
	          <!-- ./feed -->
	        </div>
    	
    	</div>

<script>

/* 소개 탭 클릭 */
function insert_intro_page(corp_id){
	
	$.ajax({
		url : "${cp}/corp/insert_intro_page",
		data : {"corp_id" : corp_id },
		success : function(data) {
			$('#content_area').html(data);			
		}
	});
}

/* 채용 탭 클릭 */
function insert_recr_page(corp_id){
	
	$.ajax({
		url : "${cp}/corp/insert_recr_page",
		data : {"corp_id" : corp_id },
		success : function(data) {
			$('#content_area').html(data);
		}
	});
}

/* 직원 탭 클릭 */
function insert_empl_page(corp_id){
	
	$.ajax({
		url : "${cp}/corp/insert_empl_page",
		data : { "corp_id" : corp_id },
		success : function(data) {
			$('#content_area').html(data);
		}
	});
}


</script>	
	