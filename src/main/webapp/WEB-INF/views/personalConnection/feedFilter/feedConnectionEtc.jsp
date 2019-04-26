<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${fn:length(connectionsEtcList) eq 0 }">
		<label style="font-size: 18px;padding-left: 350px;padding-top: 50px;">팔로우한 인맥 밖 없음</label>
	</c:when>
	<c:otherwise>
		<c:forEach items="${connectionsEtcList}" var="etc">
		<c:set var="profile_addrpath" value="/profile?mem_id=${user.user_id }"/> 
		<c:choose>
			 <c:when test="${fn:contains(user.profile_path, 'http')}">
		      	<c:set var="profile_path" value="${user.profile_path }"/> 
		      </c:when>
		</c:choose>
		
			<div style="width: 225px;">
				<div class="corporation" style="padding-left : 15px;">
					<a href="/profileHome?user_id=${etc.user_id }"><div
						style="width: 85px;height: 85px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;border-radius: 100px;border: 2px solid #E3EEF2;">
					</div></a>
					<a href="/profileHome?user_id=${etc.user_id }"><div>
						<label style="font-size: 17px;"><strong>${etc.user_name}
						</strong></label><br/> <label>${etc.introduce}</label>
					</div></a>
				</div>
				<div>
					<button class="btn btn-default followingBtn follow" onclick="location.href='/deleteFollow?follow_code=${etc.follow_code}'">
						<i class="fas fa-check"></i> 팔로우 중
					</button>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>


<script type="text/javascript">
$(".follow").on("click", function(){
	var followStr = $(this).attr('title');
	
	if(!$(this).hasClass('Out')) {
		$(this).html('<i class="fas fa-plus-circle"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else {
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
	}
});
</script>