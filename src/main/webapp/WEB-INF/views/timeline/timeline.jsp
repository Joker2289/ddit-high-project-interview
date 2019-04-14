<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<div class="container">
   <div class="row">
      <div>
	      <div id="col-info" class="col-md-3">
			
	        <div class="panel panel-default" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
	          <div class="panel-body">
	            <div class="col-user-bgimg">
	            	<c:choose>
	            	  <c:when test="${memberInfo.mem_division == '1' }"><!-- 일반회원일 경우 -->
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.bg_path == null }">
	            	      <span><a href="#"><img src=""></a></span>
	            	      <pre style="background: #fff; border-color: #fff;"><a href="#"><span>일촌 수<span style="float: right;">${connectionCnt }명</span></span></a></pre>
	            	      <pre style="background: #fff; border-color: #fff;"><a href="#"><span>저장한 글<span style="float: right;">${savepostCnt }개</span></span></a></pre>
	            	    </c:if>
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.bg_path != null }">
	            	      <span><a href="#"><img src="${sessionScope.SESSION_DETAILVO.bg_path }"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:when test="${memberInfo.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
	            	  	<c:if test="${sessionScope.SESSION_DETAILVO.bg_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.bg_path != null }">
	            	    	<span><a href="#">${sessionScope.SESSION_DETAILVO.bg_path }</a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:otherwise>
	            	  	<span>관리자 화면용 image(background)</span>
	            	  </c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="col-user-profileimg">
	            	<c:choose>
	            	  <c:when test="${memberInfo.mem_division == '1' }"><!-- 일반회원일 경우 -->
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.profile_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.profile_path != null }">
	            	    	<span><a href="#"><img src="${sessionScope.SESSION_DETAILVO.profile_path }"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:when test="${memberInfo.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
	            	  	<c:if test="${sessionScope.SESSION_DETAILVO.logo_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.SESSION_DETAILVO.logo_path != null }">
	            	    	<span><a href="#">${sessionScope.SESSION_DETAILVO.logo_path }</a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:otherwise>
	            	  	<span>관리자 화면용 image(profile)</span>
	            	  </c:otherwise>
	            	</c:choose>
	            </div>
	          </div>
	        </div>
	        <!-- ./profile brief -->
	
	        <!-- friend requests -->
	        <div class="panel panel-default" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
	          <div class="panel-body">
	            <h4>팔로우한 해시태그</h4>
	            <ul>
	              <c:choose>
	                <c:when test="${followHashtag eq 'notfollow'}">
                   	  <li>팔로우한 태그가 읎스요.</li>
                   	  <li>해시태그를 팔로우 해보세요!</li>
                    </c:when>
                    <c:otherwise>
	                  <c:forEach items="${followHashtag }" var="hashtags">
                        <li>
                          <a href="#">${hashtags.ref_keyword }</a>
                        </li>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>     
	            </ul>
	          </div>
	        </div>
	        <!-- ./friend requests -->
	      </div>
	      
	      <div class="col-md-6">
	        <div class="input-group" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
	          <button id="btn-write_modal" class="btn-write_modal"  style="height: 73.6px; margin-top: -7px;"><span class="span-text"><a><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></span></button>
	          <button id="btn-upload-img" class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-images"></i></a></span></button>
	          <button id="btn-upload-video" class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-play-circle"></i></a></span></button>
	          <button id="btn-upload-document" class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-file-alt"></i></a></span></button>
	        </div><hr>
	        
	        <!-- feed -->
	        <div class="post-group">
	          <!-- post -->
	          <c:forEach items="${timelinePost }" var="post">
		          
		        <div id="col-post" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
				  <div class="col-post">
					<div class="col-post-body">
					  <a href="#" >
						<div class="writer_info" style="float: left;">
						  <a style="font-size: 20px;" href="#">${post.writer_name }</a>
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
					    <button class="btn_postControll" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;">
					    	<i class="fas fa-ellipsis-h"></i>
					    </button>
					    <c:choose>
					      <c:when test="${post.mem_id eq memberInfo.mem_id }">
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				      	    	<button class="btn_controll-list">
					            	<i class="fas fa-edit"></i>&nbsp;<span>글 수정</span>
					            </button>
				      	    	<button class="btn_controll-list">
					            	<i class="far fa-trash-alt"></i>&nbsp;<span>글 삭제</span>
					        	</button>
				      	    	<button class="btn_controll-list">
					            	<i class="fas fa-comment-slash"></i>&nbsp;<span>댓글 차단</span>
					            </button>
					        </ul>
					      </c:when>
					      <c:otherwise>
				        	<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				      	    	<button class="btn_controll-list" style="padding-right: 65.69px;">
					            	<i class="far fa-eye-slash">&nbsp;</i><span>글 숨기기</span>
					            </button>
				      	    	<button class="btn_controll-list" style="padding-right: 24.33px;">
					            	<i class="fas fa-ban"></i>&nbsp;<span>${post.writer_name }&nbsp;언 팔로우</span>
					        	</button>
				      	    	<button class="btn_controll-list" style="padding-right: 84.22px;">
					            	<i class="far fa-flag"></i>&nbsp;<span>글 신고</span>
					            </button>
					        </ul>
					      </c:otherwise>  
					    </c:choose>
				      </div>
					  
					</div>
					<div class="post_info">
					  <pre class="post_contents" style="background: #ffffff; border-color: #ffffff;">${post.post_contents }</pre>
					</div>
				
					<div class="col-post-footer">
					  <span></span>
					</div>
					
					<!-- 댓글수, 좋아요 수 출력 -->
					<div class="post_socialCount">
					  <ul style="padding-left: 10px;">
					  	<li style="list-style: none; float: left;">
					  		<button class="btn_goodcount btn_count" style="font-size: 12px;">추천 ${post.goodcount }</button>
					  	</li>
					  	<li style="list-style: none; float: left;">
					  		<button class="btn_commentcount btn_count" id="btn_commentcount ${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 ${post.commentcount }</button>
					  	</li>
					  </ul>
					</div>
					
					<div class="col-post-social">
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-thumbs-up"></i></span></button>
					  <button class="btn-social btn_comment" title="${post.post_code }">
					  	<span style="font-size: 18px;"><i class="far fa-comments"></i></span>
					  </button>
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-share-square"></i></span></button>
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-bookmark"></i></span></button>
					</div>
					
					<!-- comment -->
					<div class="col-comment-area ${post.post_code }" id="post_comment ${post.post_code }"></div>
					<!-- /comment -->
				
				  </div>
				</div>

	          </c:forEach>
	          <!-- ./post -->
	        </div>
	        <!-- ./feed -->
	      </div>
	      <div id="col-add" class="col-md-3">
	      <!-- add friend -->
	        <div class="panel panel-default">
	          <div class="panel-body">
	            <a id="scroll-top" href="#"><h4>광고란</h4></a>
	            <ul>
	              <li>
	                <a href="#">앙 광고띠</a> 
	              </li>
	            </ul>
	          </div>
	        </div>
	        <!-- ./add friend -->
	      </div>
	  <!-- ./main -->
		<%@ include file="/WEB-INF/views/timeline/writeModal.jsp" %><!-- 모달창 -->
      </div>
   </div>
</div>

<script type="text/javascript">
	
	//작성 모달창 푸쉬
	function pushModal() {
		$("div.writemodal").modal();
	}
	
	$(document).ready(function() {
		
		$('#summernote').summernote({
			placeholder: '소식을 업데이트 해주세요!',
	        tabsize: 2,
	        height: 440,
	        maxheight: 600,
	        width: 555,
	        maxwidth: 555
		});
		
		
		//summernote 툴바 숨기기
		$(".note-toolbar").hide();
		$(".note-resizebar").hide();
		$(".note-status-output").hide();
		
		var flag = false;
		var ref_code;
		
		//게시글 댓글 버튼 클릭 시 댓글 영역 출력
		$(".btn_comment").on("click", function() {
			
			ref_code = $(this).attr('title');
			
			if (flag == false) {
				$.ajax({
					type : 'POST',
					url : '/commentArea',
					data : {"ref_code" : ref_code},
					success : function(data) {
						
						if(data != ""){
							$("." + ref_code).append(data);
						}
					}
				});
				flag = true;
			} 
			else {
				flag = false;
				$(".col-comment").remove();
			}
			
		});
		
	});
	
	$(function () {
		
		var contents = "";
		
		$("#btn-write_modal").on("click", function () {
			pushModal();
			qwe();
			
			$("#btn_write_upload").on("click", function() {
				
				$("#frm_writePost").submit();
				
			})
			
		});
		
		$("#btn-upload-img").on("click", function () {
			pushModal();
			$(".note-insert").children()[1].click();
		});
		
		$("#btn-upload-video").on("click", function () {
			pushModal();
			$(".note-insert").children()[2].click();
		});
		
		$("#btn-upload-document").on("click", function () {
			pushModal();
		});
		
	});
	
	
	//현재 스크롤 위치에서 화면 최상단으로 이동
	$("#scroll-top").on("click", function() {
		$(window).scrollTop() = $(window).height();
	});
	
	
	var pageNum = 2;
	var lastPost;
	
	//스크롤 이벤트 발생 시
	$(window).scroll(function () {
		
// 		console.log($(window).scrollTop());
// 		console.log($(document).height() - $(window).height());
		
		var currentTop = $(window).scrollTop();
		
		if($(window).scrollTop() > 50){
			$("#col-add").stop().animate({top: (currentTop-20) + "px"}, 250);
			$("#col-info").stop().animate({top: (currentTop-20) + "px"}, 250);
		} else {
			$("#col-add").stop().animate({top: 0 + "px"}, 250);
			$("#col-info").stop().animate({top: 0 + "px"}, 250);
		}
		
		lastPost = $(".scrolling:last").attr("data-post");

		if($(window).scrollTop() >= $(document).height() - $(window).height()-1){
			
			$.ajax({
				type : 'POST',
				url : '/appendpost',
//				headers : {"Content-Type" : "application/json"},
// 				dataType : 'json',
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
	
</script>