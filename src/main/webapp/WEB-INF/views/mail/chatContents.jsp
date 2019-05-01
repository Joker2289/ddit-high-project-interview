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
	<button class="btn btn-link exit" onclick="location.href='/deleteChatMember?chat_code=${param.chat_code}&mem_id=${SESSION_MEMBERVO.mem_id}'">
		<i class="fas fa-door-open"></i>
	</button>
</div>
<div class="chatContentBox">
	<c:forEach items="${chatContentsVoList }" var="chatContentsVo">
	<fmt:formatDate value="${chatContentsVo.write_date}" pattern="MM월 dd일 a KK:mm" var="write_date"/>
		<c:set var="profile_addrpath" value="/profile?mem_id=${chatContentsVo.mem_id }"/>
		<c:if test="${fn:contains(chatContentsVo.profile_path, 'http')}">
			<c:set var="profile_path" value="${chatContentsVo.profile_path }"/> 
		</c:if>
		<c:choose>
			<c:when test="${fn:split(chatContentsVo.chat_content,'▣')[1] eq 'exit'}">
				<div style="width: 474px; margin-bottom: 10px; text-align: center;">${fn:split(chatContentsVo.chat_content,'▣')[0] } 님이 나가셨습니다.</div>
			</c:when>
			<c:otherwise>
				<div style="width: 474px; min-height: 66px; display: flex; margin-bottom: 10px;">
					<a href="/profileHome<c:if test="${chatContentsVo.mem_id != SESSION_MEMBERVO.mem_id}">?user_id=${chatContentsVo.mem_id }</c:if>" ><div style="margin-right: 20px; background-image: url(${not empty profile_path ? profile_path : profile_addrpath}); width: 40px; height: 40px; border-radius: 40px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div></a>
					<div>
						<div>
							<label style="font-size: 15px; font-weight: bold;">${chatContentsVo.name}</label>
							<label style="color: rgba(0,0,0,.6); font-size: 13px;">${write_date}</label>
						</div>
						
						<c:choose>
							<c:when test="${not empty fn:split(chatContentsVo.chat_content,'▣')[1]}">
								<c:choose>
									<c:when test="${fn:split(chatContentsVo.chat_content,'▣')[1] eq 'image' }">
										<a href="/chatContentsFileDownload?content_code=${chatContentsVo.content_code }">									
											<div style="width: 250px; height: 300px; background-image:url('/chat_contentsImage?uuid=${fn:split(chatContentsVo.chat_content,'▣')[0]}'); background-repeat: no-repeat; background-size: contain; background-position: center;">
											</div>
										</a>
									</c:when>
									<c:otherwise>
										<a href="/chatContentsFileDownload?content_code=${chatContentsVo.content_code }">									
											<div style="width: 400px;">
												${fn:split(chatContentsVo.chat_content,'▣')[2]}
											</div>
										</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div style="width: 390px;  word-break: break-all; word-wrap: break-word;">
									${chatContentsVo.chat_content}
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>