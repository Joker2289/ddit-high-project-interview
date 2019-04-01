<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="col-post" class="scrolling" data-post="${timelinePost }">
	<c:forEach items="${timelinePost }" var="post"></c:forEach>
	<div class="col-post-body">
		<div class="writer_info">
			<h4>
				<a href="#">${post.writer_name }</a>
			</h4>
			<span>${post.post_date }</span>
		</div>
		<div class="post_info">
			<span>${post.post_contents }</span>
		</div>
	</div>
	<div class="col-post-footer">
		<span>게시물 하단(동영상 혹은 공유게시물 출력란)</span>
	</div>
</div>
