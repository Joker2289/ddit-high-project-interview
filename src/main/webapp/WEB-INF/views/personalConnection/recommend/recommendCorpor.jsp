<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${corporList }" var="corpor">
<c:set var="profile_addrpath" value="/profile?mem_id=${corpor.corp_id }"/>
<c:choose>
	<c:when test="${fn:contains(corpor.logo_path, 'http')}">
		<c:set var="logo_path" value="${corpor.logo_path }" />
	</c:when>
</c:choose>
	<li>
		<div class="whiteBox">
			<a href="/corp/corporation?corp_id=${corpor.corp_id }"><div
				style="width: 120px;height:78px;background-image:url(${not empty logo_path ? logo_path : profile_addrpath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin: 15px 0 12px 22px;"></div></a>
			<div style="white-space: nowrap;overflow: hidden;width: 165px;text-overflow: ellipsis;padding-left: 5px;padding-right: 5px;"><strong>${corpor.corp_name}</strong></div>
			<div style="height: 70px;padding-left: 5px;padding-right: 5px;">${corpor.industry_type}</div>
		<div>
			<div><button onclick="location.href='/followCorpor?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${corpor.corp_id }'" style="border-color: #0073b1;border-style: solid;padding-left: 40px;padding-right: 40px;font-size: 16px;" class="btn btn-default" type="button">팔로우</button></div>
		</div>
		</div>
	</li>
</c:forEach>
