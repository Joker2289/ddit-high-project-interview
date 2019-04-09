<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- comment print -->
  <c:forEach items="${nextCommentList }" var="comment">
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
<!-- /comment print -->