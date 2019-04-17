<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<link href="/css/timeline/comment.css" rel="stylesheet">
<!-- comment -->
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
            <button class="btn-comment-social"><i class="far fa-thumbs-up"></i></button>
            <button class="btn-comment-social"><i class="far fa-comments"></i></button>
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
<!-- /comment -->

<script>
	
	$(".input_comment_contents").summernote({
		placeholder: '댓글달기'
	});
	
	$(".update_comment_contents").summernote({
		
	});
	
	$(".note-toolbar").hide();
	$(".note-resizebar").hide();
	$(".note-status-output").remove();
	$(".note-editor").css({
		border : 0
	});
	$(".note-frame").css({
		border : 0
	});
	
	$(".input_comment_img").on("click", function () {
		$(".note-insert").children()[1].click();
	});
	
	
	//댓글 수정 보류
	var update_comment_code = "";
	$(".btn_updateComment").on("click", function() {
		update_comment_code = $(this).attr('data-code');
		
// 		$.ajax({
// 			type : 'POST',
// 			url : '/getcommentInfo',
// 			data : {"comment_code" : update_comment_code},
// 			success : function(data) {
				
// 				if(data != ""){
					
// 					$("#comment-contents" + update_comment_code).remove();
// 					$("#comment-text" + update_comment_code).append();
					
// 				}
// 			}
// 		});
		
	});
	
	//댓글 삭제
	var delete_comment_code = "";
	$(".btn_deleteComment").on("click", function () {
		delete_comment_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/deletecomment',
			data : {"comment_code" : delete_comment_code},
			success : function(data) {
				
				console.log(data);
				$('#comment-area'+delete_comment_code).remove();
				//css 미적용
				$('#comment-info'+delete_comment_code).append('<div><span>댓글을 삭제했습니다.</span></div>');
				
			}
		});
		
	});
	
	//댓글 신고
	var report_comment_code = "";
	$(".btn_reportComment").on("click", function () {
		report_comment_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/reportcomment',
			data : {"comment_code" : report_comment_code},
			success : function(data) {
				
// 				$('#post'+target_code).remove();
// 				$('#col-post'+target_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>' + writer_name + '님을 언팔로우 했습니다.<br>앞으로 ' + writer_name + '님의 글은 표시되지 않습니다.</h4></div>');
				
			}
		});
		
	});
	
	//댓글 더보기 버튼 숨기기(해당 게시물의 댓글 총 갯수와 조회된 댓글의 수가 같을 때 버튼 숨기기)
	if($('.comment-area').length == $('.commentCnt').val()){
		$(".morecomment").hide();
	}
	
	var commentPageNum = 2;
	var last_comment;
	var comment_ref_code = $(".col-comment").attr('title');
	
	$("#btn_moreComment").on("click", function() {
		last_comment = $('.comment-area:last').attr('data-comment');
		
		$.ajax({
			type : 'POST',
			url : '/appendnextcomment',
			data : {"ref_code" : comment_ref_code, "commentPageNum" : commentPageNum, "last_comment" : last_comment},
			success : function(data) {
				
				if(data != ""){
					$(".comment-printarea").append(data);
				}
			}
		});
		commentPageNum++;
		if($('.comment-area').length == $('.commentCnt').val()){
			$(".morecomment").hide();
		}
	});
	
	
	$(".btn_commentWrite").on("click", function() {
		var comment_count = parseInt($('#txt_comment_count' + comment_ref_code).text());
		var contents = $(".input_comment_contents").val();
		
		$.ajax({
			type : 'POST',
			url : '/writecomment',
			data : {"ref_code" : comment_ref_code, "contents" : contents},
			success : function(data) {
				$(".col-comment").remove();
				
				if(data != ""){
					$("." + comment_ref_code).append(data);
					//댓글 수 + 1
					$('#txt_comment_count' + comment_ref_code).text(comment_count + 1);
				}
			}
		});
	});
	
	

	
	
</script>