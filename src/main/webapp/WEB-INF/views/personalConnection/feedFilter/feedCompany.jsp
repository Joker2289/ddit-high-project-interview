<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${fn:length(corporationList) eq 0 }">
		<label style="font-size: 18px;padding-left: 350px;padding-top: 50px;">팔로우한 회사 없음</label>
	</c:when>
	<c:otherwise>
		<c:forEach items="${corporationList}" var="corp">
			<c:set var="profile_addrpath" value="/profile?mem_id=${corp.corp_id }"/> 
			<c:choose>
				 <c:when test="${fn:contains(corp.logo_path, 'http')}">
			      	<c:set var="profile_path" value="${corp.logo_path }"/> 
			      </c:when>
			</c:choose>
			<div style="width: 225px;">
				<div class="corporation">
					<a href="/corp/corporation?corp_id=${corp.corp_id }"><div
						style="width: 120px;height: 59px;background-image:url(${fn:contains(corp.logo_path, 'http') ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;"></div></a>
					<a href="/corp/corporation?corp_id=${corp.corp_id }"><div>
						<label style="font-size: 18px;"><strong>${corp.corp_name}
						</strong></label><br /> <label>${corp.industry_type }</label>
					</div></a>
				</div>
				<div>
					<button class="btn btn-default followingBtn follow" onclick="location.href='/deleteFollow?follow_code=${corp.follow_code}'">
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
	
	if(!$(this).hasClass('Out')){
		
		$(this).html('<i class="fas fa-plus-circle"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else{
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
		
	}
});
</script>