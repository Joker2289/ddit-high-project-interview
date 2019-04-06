<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- comment print -->
<c:forEach items="${appendcommentList }" var="appendcomment">
  <div class="comment-area" style="float:right; border: 1px solid #e1e3e8; border-radius: 30px; height: 30px; padding: 5px; width: 90%;">
    <div class="comment-text">
	    <input style="border: 0px solid #fff; width: 100%; outline: 0; padding-top: 5px; padding-bottom: 5px;">
    </div>
    <div class="comment-input-button" style="padding-top: 5px; padding-bottom: 5px;">
      <button style="border: 0px solid #fff; background: #fff; outline: 0;"><i class="far fa-thumbs-up"></i></button>
      <button style="border: 0px solid #fff; background: #fff; outline: 0;"><i class="far fa-comments"></i></button>
    </div>
  </div>
</c:forEach>
<!-- /comment print -->