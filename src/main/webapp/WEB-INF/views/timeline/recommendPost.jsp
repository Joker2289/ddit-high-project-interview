<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div id="pc_find" class="col-post">
	<div class="col-recommend_word">
<!-- 		<h4 class="txt_recommend">새로운 인맥을 찾고싶으세요?</h4> -->
		<h4 class="txt_recommend" style="font-size: 22px;"><i class="fas fa-plus" style="margin-right: 10px; font-size: 25px;"></i>새 소식을 받아보고 싶으세요?</h4>
		<h4 class="txt_recommend" style="color: #8D9191;">회원님을 위한 추천목록</h4>
	</div>
	<ul id="content2" class="recommend_user_container">
		<div>
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
				<li class="recommend_user_info">
					<div class="whiteBox">
						<a href="/profileHome?user_id=${user.user_id }"><div style="margin-top:10px; margin-bottom: 10px; width: 108px; height: 108px; background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 30px;border: 4px solid #E3EEF2;border-radius: 100px;"></div></a>
						<a href="/profileHome?user_id=${user.user_id }"><div><strong class="txt_recommend_name">${user.user_name}</strong></div></a>
						<a href="/profileHome?user_id=${user.user_id }"><div style="height: 70px;"><span class="txt_recommend_intro">${user.introduce}</span></div></a>
					<div>
						<c:choose>
							<c:when test="${SESSION_MEMBERVO.mem_division eq '1' }">
								<div><button onclick="location.href='/recommendUser_post_connect?user_id=${SESSION_MEMBERVO.mem_id }&receive_id=${user.user_id}'" class="btn btn_recommend_connect" type="button">1촌 맺기</button> </div>
							</c:when>
							<c:when test="${SESSION_MEMBERVO.mem_division eq '2' }">
								<div><button onclick="location.href='/recommendUser_post_follow?mem_id=${SESSION_MEMBERVO.mem_id }&ref_keyword=${user.user_id}'" class="btn btn_recommend_follow" type="button">팔로우</button> </div>
							</c:when>
						</c:choose>
					</div>
					</div>
					
				</li>
			</c:forEach>
		</div>
	</ul>
</div>

<script>

</script>
