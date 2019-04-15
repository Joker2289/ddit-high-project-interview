<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<div class="panel-body">
  <a href="#"><h4>팔로우한 해시태그</h4></a>
  <ul>
  	<c:choose>
	  <c:when test="${alltag eq 'notfollow'}">
	  	<li>팔로우한 태그가 없다요.</li>
	  	<li>해시태그를 팔로우 해보세요!</li>
	  </c:when>
	  <c:otherwise>
	  	<c:forEach items="${alltag }" var="hashtags">
	  	  <li><a href="/timeline">${alltag.ref_keyword }</a></li>
	  	</c:forEach>
	  </c:otherwise>
  	</c:choose>
  </ul>
</div>