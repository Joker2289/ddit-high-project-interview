<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${userChatroomsMap }" var="userChatroom">
<c:set var="profile_addrpath" value="/profile?mem_id=${userChatroom.mem_id }"/>
	<c:if test="${fn:contains(userChatroom.profile_path, 'http')}">
		<c:set var="profile_path" value="${userChatroom.profile_path }"/> 
	</c:if>
	
<fmt:formatDate value="${userChatroom.write_date}" pattern="MM월 dd일" var="write_date"/>
<a class="chatRooms chatRoomBox" role="${userChatroom.CHAT_CODE}">
	<div class="profileImageBox">
		<div style="background-image: url(${not empty profile_path ? profile_path : profile_addrpath});"></div>
	</div>
	<div class="chatRoomContentsBox">
		<div style="display: flex; color: rgba(0, 0, 0, .6);">
			<label class="chatRoomMemberBox">${userChatroom.CHAT_NAME}</label>
			<label style="font-size: 14px;">${write_date }</label>
		</div>
		<div class="chatContentsBox">${userChatroom.MEM_ID eq SESSION_MEMBERVO.mem_id ? "나": userChatroom.MEM_ID }
			: ${userChatroom.CHAT_CONTENT }</div>
	</div>
</a>
</c:forEach>
<script src="/js/js.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function() {
var chat_code = Cookies.get('chat_code');
$('.chatRooms').attr('class', 'chatRooms chatRoomBox');
	function selectRoomCSS(){
		 $(".chatRooms").each(function(index, item){
			 if($(item).attr('role') == chat_code){
				 $(item).attr('class', 'chatRooms chatRoomBoxOn');
			 }
			 
		 });
	}
	selectRoomCSS();
});
</script>