<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- comment -->
<div class="col-comment" >
<!-- comment input area -->
  <div class="comment_inputarea"  style="min-height: 40px;">
    <div class="comment-profile-img" style="float: left; padding: 5px; width: 7%; display: inline-block;">
      <!-- 로그인 한 회원의 프로필 사진 -->
      <c:choose>
        <c:when test="${memberInfo.mem_division == '1' }">
      	  <c:if test="${commentwriter.profile_path == null }">
      	    <a class="contents_writer_image"><button class="contents_writer_image"><i class="far fa-user"></i></button></a>
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
  
    <div class="comment-area-input">
      <div class="comment-input-text">
    	  <form>
    	    <!-- 작성 내용 -->
    	    <textarea id="input_comment_contents ${ref_code }" class="input_comment_contents" placeholder="댓글달기" name="input_comment_contents"></textarea>
    	  </form>
      </div>
      
      <div class="comment-input-img" style="float: right;">
    	<button class="input_comment_img"><i class="fas fa-camera"></i></button>
      </div>
    </div>
  </div>
<!-- /comment input area -->  
  
  <!-- comment print area -->
  <div class="comment-printarea">
    <c:forEach items="${commentList }" var="comment">
      <div class="comment-area ${ref_code }" data-comment="${comment.comment_code }">
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
        </div>
        <div class="comment-text">
  	      <div style="border: 0px solid #fff; width: 100%; outline: 0; padding-top: 5px; padding-bottom: 5px;">${comment.comment_contents }</div>
        </div>
        <div class="comment-input-button" style="padding-top: 5px; padding-bottom: 5px;">
          <button style="border: 0px solid #fff; background: #fff; outline: 0;"><i class="far fa-thumbs-up"></i></button>
          <button style="border: 0px solid #fff; background: #fff; outline: 0;"><i class="far fa-comments"></i></button>
        </div>
      </div>
    </c:forEach>
  </div>
  <!-- /comment print area -->
  <div class="morecomment">
  	<a><button type="button" id="btn_moreComment" class="btn_moreComment" title="${ref_code }" style="border: 0px solid #fff; background: #fff; padding: 10px; outline: 0;">댓글 더 보기</button></a>
  	<input id="commentCnt ${ref_code }" type="hidden" value="${commentCnt }">
  </div>
</div>
<!-- /comment -->

<script>

	$(".input_comment_contents").summernote();
	
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
	
	
	console.log("commentCnt : " + $("#commentCnt").val());
	
	//댓글 더보기 버튼 숨기기(해당 게시물의 댓글 총 갯수와 조회된 댓글의 수가 같을 때 버튼 숨기기)
	if($(".comment-area").length = $("#commentCnt").val()){
		$(".morecomment").hide();
	}
	
	var commentPageNum = 2;
	var last_comment;
	var comment_ref_code = $("#btn_moreComment").attr('title');
	
	
	$("#btn_moreComment").on("click", function() {
		last_comment = $('.comment-area:last').attr('data-comment');
		
		$.ajax({
			type : 'POST',
			url : '/appendnextcomment',
			data : {"ref_code" : comment_ref_code, "commentPageNum" : commentPageNum, "last_comment" : last_comment},
			success : function(data) {
				console.log(data);
				
				if(data != ""){
					$(".comment-printarea").append(data);
				}
				
			}
		});
		commentPageNum++;
	});
	
	console.log("current comment : " + $(".comment-area").length);
	
</script>