<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${userList }" var="user">
<c:set var="bg_addrpath" value="/background?mem_id=${user.user_id }"/>
<c:set var="profile_addrpath" value="/profile?mem_id=${user.user_id }"/> 
<c:choose>
   <c:when test="${fn:contains(user.bg_path, 'http')}">
      <c:set var="bg_path" value="${user.bg_path }"/> 
   </c:when>
   <c:when test="${fn:contains(user.profile_path, 'http')}">
      <c:set var="profile_path" value="${user.profile_path }"/> 
   </c:when>
</c:choose>
	<li>
		<div class="whiteBox"><!-- ;background-image:url("http://www.naver.com"); ;background-image:url("/profile?mem_id=jin"); -->
			<a href="/profileHome?user_id=${user.user_id }"><div style="width: 108px; height: 108px;background-image:url(${fn:contains(user.profile_path, 'http') ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 30px;border: 4px solid #E3EEF2;border-radius: 100px;"></div></a>
			<a href="/profileHome?user_id=${user.user_id }"><div><strong>${user.user_name}</strong></div></a>
			<a href="/profileHome?user_id=${user.user_id }"><div style="height: 70px;">${user.introduce}</div></a>
		<div>
			<div><button onclick="location.href='/recommendUser?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${user.user_id}'" style="border-color: #0073b1;border-style: solid;padding-left: 40px;padding-right: 40px;" class="btn btn-default" type="button">1촌 맺기</button> </div>
		</div>
		</div>
		
	</li>
</c:forEach>
