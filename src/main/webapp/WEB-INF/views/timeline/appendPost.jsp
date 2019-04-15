<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/timeline/writemodal.css" rel="stylesheet">

<c:forEach items="${nextPostList }" var="post">
  <div id="col-post" class="scrolling" data-post="${post.post_code }">
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
<%--   		  <span>${post.post_date }</span><br> --%>
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
              		<i class="fas fa-link"></i>&nbsp;<span>링크 복사</span>
              	</button>
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
     			    		<button class="btn_controll-list" style="padding-right: 70.22px;">
              		<i class="fas fa-link"></i>&nbsp;<span>링크 복사</span>
              	</button>
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
  	  <pre style="background: #ffffff; border-color: #ffffff;">${post.post_contents }</pre>
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
  	  		<button class="btn_commentcount btn_count" style="font-size: 12px;">댓글 ${post.commentcount }</button>
  	  	</li>
  	  </ul>
  	</div>
  	
  	<div class="col-post-social">
  	  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-thumbs-up"></i></span></button>
  	  <button title="${post.post_code }" class="btn-social btn_appendcomment"><span style="font-size: 18px;"><i class="far fa-comments"></i></span></button>
  	  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-share-square"></i></span></button>
  	  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-bookmark"></i></span></button>
  	</div>

  	<!-- comment -->
  	<div class="col-comment-area ${post.post_code }" id="post_comment ${post.post_code }"></div>
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
					$("." + ref_code).append(data);
				}
			}
		});
		flag = true;
	} else {
		flag = false;
		$(".col-comment").remove();
	}
	
});

$(".col-appendcomment").hide();

$(".btn_appendcomment").on("click", function() {
	
	var className = $(this).attr('title');
	
	if (!$("."+className).attr('class').endsWith('On')) {
		$("."+className).show();
		$("."+className).attr('class', 'col-appendcomment '+className+' On');
	}else {
		$("."+className).hide();
		$("."+className).attr('class', 'col-appendcomment '+className);
	}
});

</script>