<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
<div class="row">
<div>
<div class="row">

	<div class="col-md-8" style="padding-left: 0px;margin-left: 30px;">
		<div class="whiteBox" style="width: 796px;padding-left: 15px;padding-bottom: 15px;padding-top: 10px;">
			<label style="font-size: 21px;">1촌 신청 관리</label>
			<div class="row" style="padding-top: 10px;">
				<a href="/connectionReceiveApply" style="font-size: 15px;padding-left: 15px;">받은 일촌 신청</a>
				<a href="/connectionSendApply" style="font-size: 15px; padding-left: 28px;">보낸 일촌 신청</a>
				<hr style="border: solid 0.5px #cccccc;margin-top: 10px;margin-bottom: 10px;width: 770px;margin-left: 12px;">
			</div>
			<div style="font-size: 17px;padding-left: 2px;">
				<c:choose>
					<c:when test="${fn:length(connectionReceiveList) eq 0}" >
						새로운 1촌 신청 없음
					</c:when>
					<c:otherwise>
						<c:forEach items="${connectionReceiveList }" var="receive">
						<c:set var="profile_addrpath" value="/profile?mem_id=${receive.user_id }"/>
						<c:choose>
							<c:when test="${fn:contains(receive.profile_path, 'http')}">
								<c:set var="profile_path" value="${receive.profile_path }"/>
							</c:when>
						</c:choose>
						<div style="display: flex;padding-top: 7px;padding-bottom: 7px;">
						 	<a href="/profileHome?user_id=${receive.user_id }"><div style="width: 59px;height: 59px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center; margin-right: 10px;">
						 	</div></a>
						 	<div style="width: 580px;">
						 		<a href="/profileHome?user_id=${receive.user_id }"><div style="margin-bottom: 5px;margin-top: 5px;">
						 			${receive.user_name}
						 		</div></a>
						 		<a href="/profileHome?user_id=${receive.user_id }"><div>
						 			${receive.introduce}
						 		</div></a>
						 	</div>
						 	<div>
						 		<button class="btn btn-default" style="border-style: hidden;margin-top: 0px;"
						 		onclick="location.href='/receiveApply?user_id=${receive.user_id}&receive_id=${SESSION_MEMBERVO.mem_id}'">승낙</button>
								<button class="btn btn-default" style="border-style: hidden;margin-top: 0px;"
								onclick="location.href='/receiveCancel?user_id=${receive.user_id}&receive_id=${SESSION_MEMBERVO.mem_id}'">취소</button>
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
</div>