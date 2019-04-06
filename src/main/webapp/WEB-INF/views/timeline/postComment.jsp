<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- comment -->
<div class="col-comment ${commentList.ref_code }" style="height: 100px; padding: 5px;">
<!-- comment input area -->
  <div class="comment_inputarea">
    <div class="comment-profile-img" style="float: left; padding: 5px; width: 10%;">
  	  <img src="${SESSION_MEMBERVO.profile_path }" style="border-radius: 100px;">이미지
    </div>
  
    <div class="comment-area-input" style="float:right; border: 1px solid #e1e3e8; border-radius: 30px; height: 30px; padding: 5px; width: 90%;">
      <div class="comment-input-text" style="float: left; width: 80%;">
    	  <form>
    	    <input type="text" placeholder="댓글달기" name="comment_contents" style="border: 0px solid #fff; width: 100%; outline: 0;">
    	  </form>
      </div>
      <div class="comment-input-img" style="float: right;">
    	<button style="border: 0px solid #fff; background: #fff; outline: 0;"><i class="fas fa-camera"></i></button>
      </div>
    </div>
  </div>
<!-- /comment input area -->  
  
  <!-- comment print area -->
  <c:forEach items="${commentList }" var="comment">
    <div class="comment-area" style="float:right; border: 1px solid #e1e3e8; border-radius: 30px; height: 30px; padding: 5px; width: 90%;">
      <div class="comment-profile-img" style="float: left; padding: 5px; width: 10%;">
	    <img src="" style="border-radius: 100px;">이미지
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
	<!-- /comment print area -->
</div>
<!-- /comment -->