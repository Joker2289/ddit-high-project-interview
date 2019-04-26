<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/personalConnection/feedFollowing.css" rel="stylesheet">
<script >

$(document).ready(function() {
	$(".feedDropdown").on("click",function(){
		
		var str = $(this).attr('title');
		console.log(str);
		
		$.ajax({
            type : "POST",
            url : "/feed",
            dataType : "HTML",
            data : {"str" : str},
            success : function(result) {
            	
               $(".corporationList").empty();
               $(".corporationList").append(result);
               
            } 
         }); 
		
		switch (str) {
		  case "connections" : str = "필터 : 1촌";
		               break;
		  case "connectionEtc" : str = "필터 : 인맥 밖";
		               break;
		  case "company" : str = "필터 : 회사";
		               break;
		  case "hashTag" : str = "필터 : 해시태그";	
		               break;
		}
		$("#feedName").text(str);
	});
	
	$(".follow").on("click", function(){
		var followStr = $(this).attr('title');
		
		if(!$(this).hasClass('Out')){
			
			/* $.ajax({
	            type : "POST",
	               url : "/followOut",
// 	               dataType : "HTML",
	               data : {"followStr" : followStr},
	            success : function() { */
	            	
	            	$(this).html('<i class="fas fa-plus-circle"></i> 팔로우');
	    			$(this).attr('class','btn btn-default followingBtn follow Out');
	               
	            /* } 
	         }); */ 
		}else{
			/* $.ajax({
	            type : "POST",
	               url : "/follow",
	               dataType : "json",
	               data : {"followStr" : followStr},
	            success : function(result) { */
	            	/* $(this).attr('title',result); */
	            	$(this).html('<i class="fas fa-check"></i> 팔로우 중');
	    			$(this).attr('class','btn btn-default followingBtn follow');
	               
	            /* } 
	         }); */ 
			
		}
	});
	
});
	
</script>
<nav class="navbar navbar-inverse navbar-fixed-top feedTop" style="margin-top: -20px;">
	<div class="container" style="padding-top: 8px;">
		<div class="feedDiv">
			<a href="/feedFollow" >신선한 시각 팔로우</a>
		</div>
		<div class="feedDiv">
			<a href="/feedFollowing">(${allFollowCount})명 팔로우 중</a>
		</div>
	</div>
 </nav>

<div class="container">
<div class="row">
<div>
<div class="row">

	<div id="pc_leftmenu" class="col-md-3" style="padding-left: 0px;margin-left: 30px;">
		<div class="whiteBox feedFollowingTop" style="display: flex;padding-bottom: 4px;">
			<label id="feedName" style="width: 300px;">필터 : 회사</label>
			<div class="dropdown">
				<button class="btn btn-default" id="dLabel" style="margin-left: 765px; border-style: hidden;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-align-right"></i>
				</button>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="top: 36px;left: 513px;width: 297px;height: 272px;margin-top: 0px;">
			     <li role="presentation" style="padding-bottom: 10px;padding-top: 10px;"><a class="feedDropdown" role="menuitem" tabindex="-1" title="connections">1촌<br/>팔로우하시는 1촌</a></li>
			     <li role="presentation" style="padding-bottom: 10px;padding-top: 10px;"><a class="feedDropdown" role="menuitem" tabindex="-1" title="connectionEtc">인맥 밖<br/>1촌이 아니면서 회원님을 팔로우하는 사람</a></li>
			     <li role="presentation" style="padding-bottom: 10px;padding-top: 10px;"><a class="feedDropdown" role="menuitem" tabindex="-1" title="company">회사<br/>팔로우하시는 회사</a></li>
			     <li role="presentation" style="padding-bottom: 10px;padding-top: 10px;"><a class="feedDropdown" role="menuitem" tabindex="-1" title="hashTag">해시태그<br/>팔로우하시는 해시태그</a></li>
			    </ul>
			</div>
		</div>
		<div class="row corporationList">
			<c:choose>
				<c:when test="${fn:length(corporationList) eq 0 }">
					<label style="font-size: 18px;padding-left: 350px;padding-top: 50px;">팔로우한 회사 없음</label>
				</c:when>
				<c:otherwise>
					<c:forEach items="${corporationList}" var="corp">
						<div style="width: 225px;">
							<div class="corporation">
								<a href="/corporation?corp_id=${corp.corp_id }"><div
								style="width: 120px;height: 59px;background-image:url(${corp.logo_path});background-repeat: no-repeat;background-size: 120px;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;">
								</div></a>
								<div>
									<a href="/corporation?corp_id=${corp.corp_id }"><label style="font-size: 18px;"><strong>${corp.corp_name}</strong></label><br/></a>
									<a href="/corporation?corp_id=${corp.corp_id }"><label>${corp.industry_type }</label></a>
								</div>
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
		</div>
	</div>
	
</div>
</div>
</div>
</div>