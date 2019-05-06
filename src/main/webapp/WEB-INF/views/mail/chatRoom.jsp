<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${userChatroomsMap }" var="userChatroom">
<c:choose>
	<c:when test="${not empty fn:split(userChatroom.PATH,',')[1] }">
		<c:set var="room_img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKVGBZRHop7h5QXz8vP3CgarNIlJbDHcrX2IODVV-lyPd1j-lg"/>
	</c:when>
	<c:otherwise>
		<c:set var="room_imgaddr" value="/profile?mem_id=${userChatroom.MEMBER }"/>
		<c:if test="${fn:contains(userChatroom.PATH, 'http')}">
			<c:set var="room_img" value="${userChatroom.PATH }"/> 
		</c:if>
	</c:otherwise>
</c:choose>
<fmt:formatDate value="${userChatroom.WRITE_DATE}" pattern="MM월 dd일" var="write_date"/>
<a class="chatRooms chatRoomBox" role="${userChatroom.CHAT_CODE }">
	<div class="profileImageBox">
		<div style="background-image: url(${fn:contains(userChatroom.PATH, 'http') ? room_img : room_imgaddr});"></div>
	</div>
	<div class="chatRoomContentsBox">
		<div style="display: flex; color: rgba(0, 0, 0, .6);">
			<label class="chatRoomMemberBox">${userChatroom.CHAT_NAME}</label>
			<label style="font-size: 14px;">${write_date }</label>
		</div>
		<div class="chatContentsBox">${userChatroom.MEM_ID eq SESSION_MEMBERVO.mem_id ? "나": userChatroom.NAME }
			: <c:choose>
				<c:when test="${not empty fn:split(userChatroom.CHAT_CONTENT,'▣')[1]}">
					<c:choose>
						<c:when test="${fn:split(userChatroom.CHAT_CONTENT,'▣')[1] eq 'exit'}">
							나가셨습니다.
						</c:when>
						<c:when test="${fn:split(userChatroom.CHAT_CONTENT,'▣')[1] eq 'image'}">
							이미지를 보냈습니다.
						</c:when>
						<c:otherwise>
							파일을 보냈습니다.
						</c:otherwise>
			 		 </c:choose>
				</c:when>
				<c:otherwise>
					${userChatroom.CHAT_CONTENT}
				</c:otherwise>
			  </c:choose>
		 </div>
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