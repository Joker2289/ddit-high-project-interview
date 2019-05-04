<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${userList }" var="user">
	<div class="user_info">
		<div class="user_container" style="box-shadow: 0px 6px 12px rgba(0, 0, 0, .175);">
			
			<a class="user_img" href="/profileHome?user_id=${user.mem_id }">
				<a href="/profileHome?user_id=${user.mem_id }">
					<c:choose>
						<c:when test="${user.profile_path eq null }">
							<img class="user_img" src="/images/profile/basicProfile.png">
						</c:when>
						<c:when test="${user.profile_path != null }">
							<img class="user_img" src="${ cp }/view/imageView?mem_id=${user.mem_id }&division=pf">
						</c:when>
					</c:choose>
					<h4 style="font-size: 20px; color: #0073B1; font-weight: bold; margin-top: 20px;">${user.mem_name }</h4>
					<pre style="height: 80px;">
						<p style="font-size: 16px; color: #8D9191; font-weight: bold; height: 50px;">
							${user.school_info }
							${user.career_info }
							${fn:split(user.addr1, ' ')[0] } ${fn:split(user.addr1, ' ')[1] }
						</p>
					</pre>
				</a>
			</a>
			
			<div class="col-connect_controll">
				<!-- 일촌버튼 -->
				<c:choose>
					<c:when test="${SESSION_MEMBERVO.mem_division == '1' }">
						<input type="button" id="btn_connection${user.col_no }" data-user="${user.mem_id }"
							<c:choose>
								<c:when test="${user.receive_accept eq 'Y' }">
									class="btn_disconnect" value="일촌 끊기"
								</c:when>
								<c:when test="${user.receive_accept eq 'N' }">
									class="btn_waiting" value="일촌수락 대기"
								</c:when>
								<c:when test="${user.receive_accept eq null }">
									class="btn_connect" value="일촌 맺기"
								</c:when>
							</c:choose>/>
					</c:when>
					<c:when test="${SESSION_MEMBERVO.mem_division == '2' }">
						<input type="button" id="btn_follow${user.col_no }" data-user="${user.mem_id }"
							<c:if test="${user.mem_id eq user.ref_keyword }">class="btn_unfollow_user" value="팔로우 중"</c:if>
							<c:if test="${user.mem_id != user.ref_keyword }">class="btn_follow_user" value="팔로우"</c:if>/>
					</c:when>
				</c:choose>
			</div>
		
		</div>
	</div>
</c:forEach>