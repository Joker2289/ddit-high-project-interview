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
					<c:when test="${fn:length(connectionSendList) eq 0}">
						보낸 일촌 신청 없음
					</c:when>
					<c:otherwise>
						<c:forEach items="${connectionSendList }" var="send">
						<div style="display: flex;">
							<div style="width: 59px;height: 59px;background-image:url(/profile?mem_id=${send.user_id});background-repeat: no-repeat;background-size: cover;background-position: center; margin-right: 10px;">
							</div>
							<div style="width: 580px;">
								<div style="margin-bottom: 5px;margin-top: 5px;">
									${send.user_name }
								</div>
								<div>
									${send.introduce }
									<%-- ${send.addr1} --%>
								</div>
							</div>
								<button class="btn btn-default" style="border-style: hidden;margin-top: 20px;" onclick="location.href='/sendCancel?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${send.user_id}'">취소</button>
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