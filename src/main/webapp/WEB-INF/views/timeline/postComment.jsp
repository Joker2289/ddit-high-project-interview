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
          <div>
            <div class="comment-profile-img">
              <c:choose>
                <c:when test="${comment.mem_division == 1 && comment.profile_path != null }">
                  <a class="contents_writer_image"><img class="contents_writer_image" src="${ cp }/view/imageView?mem_id=${comment.mem_id }&division=pf"></a>
                </c:when>
                <c:when test="${comment.mem_division == 2 && comment.profile_path != null }">
                  <a class="contents_writer_image"><img class="contents_writer_image" src="${comment.profile_path }"></a>
                </c:when>
	  	        <c:otherwise>
	  	  	    <a class="contents_writer_image"><button class="contents_writer_image"><i class="far fa-user"></i></button></a>
	  	        </c:otherwise>
	          </c:choose>
            </div>
            <div class="comment-writer">
              <span style="font-weight: bold;">${comment.writer_name }</span>
            </div>
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
                <div class="dropdown comment_controll">
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
          </div>
          <div class="comment-text" id="comment-text${comment.comment_code }" style="display: inline-block; width:80%;">
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
<!-- /comment -->

<script src="/js/comment.js"></script>
