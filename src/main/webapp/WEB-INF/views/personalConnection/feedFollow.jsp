<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/personalConnection/feedFollowing.css" rel="stylesheet">
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
<div class="row" style="margin-top: 47px;">
	<div id="pc_leftmenu" class="col-md-3" style="padding-left: 0px;margin-left: 30px;">
		<div class="row corporationList">
			<c:forEach items="${resultMapList }" var="result">
			<c:set var="profile_addrpath" value="/profile?mem_id=${result.user_id }"/> 
			<c:choose>
				<c:when test="${fn:contains(result.profile_path, 'http')}">
			      <c:set var="profile_path" value="${result.profile_path }"/> 
			   </c:when>
			</c:choose>
			<c:set var="addrimgPath" value="/profile?mem_id=${result.corp_id }"/> 
			<c:choose>
				<c:when test="${fn:contains(result.imgPath, 'http')}">
			      <c:set var="imgPath" value="${result.imgPath }"/> 
			   </c:when>
			</c:choose>
			
				<div style="width: 225px;">
					<div class="corporation">
						<c:choose>
							<c:when test="${not empty result.user_id}" >
								<a href="/profileHome?user_id=${result.user_id }">
								<div style="width: 85px;height: 85px;background-image:url(${fn:contains(result.profile_path, 'http') ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 0px;margin-top: 15px; margin-bottom: 12px;border-radius: 100px;">
								</div>
								</a>
								<c:set var="ref_keyword"  value="${result.user_id }"/>
								<c:set var="division"  value="43"/>
							</c:when>
							
							<c:when test="${not empty result.corp_id}">
								<a href="/corp/corporation?corp_id=${result.corp_id }">
								<div style="width: 120px;height: 59px;background-image:url(${fn:contains(result.imgPath, 'http') ? imgPath : addrimgPath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin-left: 0px;margin-top: 15px; margin-bottom: 12px;">
								</div>
								</a>
								<c:set var="ref_keyword"  value="${result.corp_id }"/>
								<c:set var="division"  value="11"/>
							</c:when>
							
							<c:otherwise>
								<c:set var="ref_keyword"  value="${fn:split(result.title,'#')[0]}"/>
								<c:set var="division"  value="16"/>
							</c:otherwise>
							
						</c:choose>
						
						<div style="text-overflow: ellipsis; display: inline-block; width: 196px; white-space: nowrap; overflow: hidden; <c:if test='${fn:substring(result.title,0,1) eq \"#\"}'>text-align: center; padding: 114px 0 0 0;</c:if>">
							<label style="font-size: 18px;"><strong>${result.title }</strong></label><br/>
							<label>${result.content }</label>
						</div>
					</div>
					<div>
						<button style="color: #0073b1;" class="btn btn-default followingBtn follow Out" onclick="location.href='/insertFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${ref_keyword}&division=${division }'">
							<i class="fas fa-plus"></i> 팔로우
						</button>
					</div>
				</div>
			
			</c:forEach>
		
		</div>
	</div>

</div>
</div>
</div>
</div>

<script type="text/javascript">
$(".follow").on("click", function(){
	/* var followStr = $(this).attr('title'); */
	
if(!$(this).hasClass('Out')){
		
		$(this).html('<i class="fas fa-plus"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else{
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
		
	}
	
	
});


</script>