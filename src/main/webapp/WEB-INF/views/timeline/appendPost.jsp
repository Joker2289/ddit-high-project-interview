<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <link href="/css/timeline/writemodal.css" rel="stylesheet"> -->

<c:forEach items="${nextPostList }" var="post">
  <div id="col-post${post.post_code }" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
	  <div class="col-post ${post.post_code }">
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
		  		<button class="btn_count btn_goodcount" title="goodCount ${post.post_code }" style="font-size: 12px;">추천 
		  		  <span id="txt_good_count${post.post_code }">${post.goodcount }</span>
		  		</button>
		  	</li>
		  	<li style="list-style: none; float: left;">
		  		<button class="btn_count btn_commentcount" id="btn_commentcount ${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 
		  		  <span id="txt_comment_count${post.post_code }">${post.commentcount }</span>
		  		</button>
		  	</li>
		  </ul>
		</div>
		<div class="col-post-social">
		  <!-- 좋아요 버튼 -->
		  <button class="btn-social btn_good" title="${post.post_code }">
		    <span style="font-size: 18px;">
		      <i id="icon_good${post.post_code }"
		          <c:if test="${not empty goodList}"> 
		            <c:forEach items="${goodList }" var="goodpost">
		              <c:choose>
		                <c:when test="${goodpost.ref_code == post.post_code }">class="fas fa-thumbs-up"</c:when>
		                <c:otherwise>class="far fa-thumbs-up"</c:otherwise>
		              </c:choose>
		            </c:forEach>
		          </c:if>
		          <c:if test="${empty goodList}">class="far fa-thumbs-up"</c:if>>
		      </i>
		    </span>
		  </button>
		  <!-- 댓글 출력 버튼 -->
		  <button class="btn-social btn_appendcomment" title="${post.post_code }"><span style="font-size: 18px;"><i class="far fa-comments"></i></span></button>
		  <!-- 글 저장 버튼 -->
		  <button class="btn-social btn_save" title="${post.post_code }">
		    <span style="font-size: 18px;">
		      <i id="icon_save${post.post_code }"
		        <c:if test="${not empty saveList}">
		          <c:forEach items="${saveList }" var="savepost">
		            <c:choose>
		              <c:when test="${savepost.save_post_code == post.post_code }">class="fas fa-bookmark"</c:when>
		              <c:otherwise>class="far fa-bookmark"</c:otherwise>
		            </c:choose>
		            </c:forEach>
		        </c:if>
		        <c:if test="${empty saveList}">class="far fa-bookmark"</c:if>>
		      </i>
		    </span>
		  </button>
		</div>
		
		<!-- comment -->
		<div class="col-comment-area ${post.post_code }" id="post_comment${post.post_code }"></div>
		<!-- /comment -->
	
	  </div>
	</div>
</c:forEach>

<script>
	//게시글 댓글 버튼 클릭 시 댓글 영역 출력
	var flag = false;
	$(".btn_appendcomment").on("click", function() {
		
		var ref_code = $(this).attr('title');
		console.log(ref_code);
		
		if (flag == false) {
			$.ajax({
				type : 'POST',
				url : '/commentArea',
				data : {"ref_code" : ref_code},
				success : function(data) {
					
					if(data != ""){
						$('#post_comment' + ref_code).append(data);
					}
				}
			});
			flag = true;
		} else {
			flag = false;
			$(".col-comment").remove();
		}
		
	});


	var good_ref_code = "";
	
	$(".btn_good").on("click", function() {
		
		good_ref_code = $(this).attr('title');
		
		var good_count = parseInt($('#txt_good_count' + good_ref_code).text());
		
		if($('#icon_good' + good_ref_code).attr("class") == "far fa-thumbs-up"){
			
			$.ajax({
				type : 'POST',
				url : '/push_postgood',
				data : {"ref_code" : good_ref_code},
				success : function(data) {
					$('#icon_good' + good_ref_code).attr("class", "fas fa-thumbs-up");
					// 추천 수 + 1
					$('#txt_good_count' + good_ref_code).text(good_count + 1);
					
				}
			});
			
		} else {
			
			$.ajax({
				type : 'POST',
				url : '/push_postgoodcancel',
				data : {"ref_code" : good_ref_code},
				success : function(data) {
					$('#icon_good' + good_ref_code).attr("class", "far fa-thumbs-up");
					//추천 수 - 1
					$('#txt_good_count' + good_ref_code).text(good_count - 1);
				}
			});
		}
	});

	var savepost_code = "";
	$(".btn_save").on("click", function() {
		savepost_code = $(this).attr('title');
		var save_count = parseInt($('.txt_save_count').text());
		
		if($('#icon_save' + savepost_code).attr("class") == "far fa-bookmark"){
			$.ajax({
				type : 'POST',
				url : '/push_postsave',
				data : {"post_code" : savepost_code},
				success : function(data) {
					$('#icon_save' + savepost_code).attr("class", "fas fa-bookmark");
					// 추천 수 + 1
					$('.txt_save_count').text(save_count + 1);
				}
			});
		} else {
			$.ajax({
				type : 'POST',
				url : '/push_postsavecancel',
				data : {"post_code" : savepost_code},
				success : function(data) {
					$('#icon_save' + savepost_code).attr("class", "far fa-bookmark");
					//추천 수 - 1
					$('.txt_save_count').text(save_count - 1);
				}
			});
		}
		
	});
	

	

</script>