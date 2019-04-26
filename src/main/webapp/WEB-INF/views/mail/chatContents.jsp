<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="chatRoomTitleBox">
	<div>
		<label>${chatContentsVoList[0].chat_name }</label>
		<label style="color:rgba(0,0,0,.6);"><c:if test="${not empty chatContentsVoList[0].memCount}">메일 상대 ${chatContentsVoList[0].memCount }명 </c:if></label>
	</div>
	<button class="btn btn-link">
		<i class="fas fa-ellipsis-h"></i>
	</button>
</div>
<div class="chatContentBox">
	<c:forEach items="${chatContentsVoList }" var="chatContentsVo">
	<fmt:formatDate value="${chatContentsVo.write_date}" pattern="a KK:mm" var="write_date"/>
		<c:set var="profile_addrpath" value="/profile?mem_id=${chatContentsVo.mem_id }"/>
		<c:if test="${fn:contains(chatContentsVo.profile_path, 'http')}">
			<c:set var="profile_path" value="${chatContentsVo.profile_path }"/> 
		</c:if>
		<a href="/profileHome<c:if test="${chatContentsVo.mem_id != SESSION_MEMBERVO.mem_id}">?user_id=${chatContentsVo.mem_id }</c:if>" style="width: 474px; min-height: 66px; display: flex; margin-bottom: 10px;">
			<div style="margin-right: 20px; background-image: url(${not empty profile_path ? profile_path : profile_addrpath}); width: 40px; height: 40px; border-radius: 40px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
			<div>
				<div>
					<label style="font-size: 15px; font-weight: bold;">${chatContentsVo.name}</label>
					<label style="color: rgba(0,0,0,.6); font-size: 13px;">${write_date}</label>
				</div>
				<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;width: 400px;">
					${chatContentsVo.chat_content}
				</div>
			</div>
		</a>
	</c:forEach>
</div>