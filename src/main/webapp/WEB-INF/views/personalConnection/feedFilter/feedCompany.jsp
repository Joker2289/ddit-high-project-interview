<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${corporationList}" var="corp">
	<div style="width: 225px;">
		<div class="corporation">
			<div
				style="width: 120px;height: 59px;background-image:url(${corp.logo_path});background-repeat: no-repeat;background-size: 120px;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;"></div>
			<div>
				<label style="font-size: 18px;"><strong>${corp.corp_name}
				</strong></label><br /> <label>${corp.industry_type }</label>
			</div>
		</div>
		<div>
			<button class="btn btn-default followingBtn follow" onclick="location.href='/deleteFollow?follow_code=${corp.follow_code}'">
				<i class="fas fa-check"></i> 팔로우 중
			</button>
		</div>
	</div>
</c:forEach>
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