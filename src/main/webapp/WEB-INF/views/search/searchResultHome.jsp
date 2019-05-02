<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/searchResult/searchResultHome.css" rel="stylesheet">
<div class="container">
	<div class="row">
		<div class="col-md-10" style="border: 0px solid #333333; height: 100px;">
			<div id="div_box" class="whiteBox">
			<input id="search_word" type="hidden" value="${search_word }">
			
				<div class="col-corpResult_top" style="border-bottom: 1px solid #ddd;">
					<h4 style="color: #8D9191; padding-left: 10px; padding-bottom: 10px; font-weight: bold; margin-bottom: 0px; padding-top: 10px; display: inline-block; width: 88%;">업체 검색결과  ${corpCount }건</h4>
					<button id="btn_allCorp" class="btn_more_result">모두 보기</button>
				</div>
				
				<div class="col-result">
					<div class="result_corp">
						<c:forEach items="${corpList }" var="corp">
							<div class="corp_info">
							
								<div class="corp_img">
									<a href="/corporation?corp_id=${corp.mem_id }">
										<c:choose>
											<c:when test="${corp.profile_path eq null }">
												<img src="/images/corporation/basic/basicCorporation.png">
											</c:when>
											<c:when test="${corp.profile_path != null }">
												<img src="${corp.profile_path }" style="width: 150px;">
											</c:when>
										</c:choose>
									</a>
								</div>
								
								<div class="col-corpInfomation">
									<a class="txt-corp_name" style="width: 20%; display: inline-block;" href="/corporation?corp_id=${corp.mem_id }">${corp.mem_name }</a>
									<span class="txt-industry" style="width: 68%;display: inline-block;">
										${corp.industry_type } ${corp.addr1 }
									</span>
								</div>
								<div class="col-corpbuttom">
									<!-- 회사 팔로우 버튼 -->
									<input type="button" id="btn_follow${corp.col_no }" data-corp="${corp.mem_id }"
										<c:if test="${corp.mem_id eq corp.ref_keyword }">class="btn_unfollow" value="팔로우 중"</c:if>
										<c:if test="${corp.mem_id != corp.ref_keyword }">class="btn_follow" value="팔로우"</c:if>/>
								</div>
								
							</div>
						</c:forEach>
					</div>
					
					<div class="result_user">
						<div class="col-userResult_top" style="border-bottom: 1px solid #ddd;">
							<h4 style="color: #8D9191;padding-left: 10px;padding-bottom: 10px; font-weight: bold; margin-bottom: 0px; padding-top: 10px; display: inline-block; width: 88%;">관련 인물 검색결과 ${userCount }건</h4>
							<button id="btn_allUser" class="btn_more_result">모두 보기</button>
						</div>
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
													${user.introduce }
													${fn:split(user.addr1, ' ')[0] } ${fn:split(user.addr1, ' ')[1] }
												</p>
											</pre>
										</a>
									</a>
									
									<div class="col-connect_controll">
										<!-- 일촌버튼 -->
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
									</div>
								
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
	var userCount = ${userCount};
	var corpCount = ${corpCount};
	var currUserCount = $(".user_info").length;
	var currCropCount = $(".corp_info").length;	
	
	if(userCount == currUserCount){
		$("#btn_allUser").hide();
	}
	if(corpCount == currCropCount){
		$("#btn_allCorp").hide();
	}
	
	//회사 팔로우
	var corp_id = "";
	$(document).on("click", ".btn_follow", function() {
		corp_id = $(this).attr("data-corp");
		
		$.ajax({
			type : 'POST',
			url : '/corp_follow',
			data : {"target_id" : corp_id}
		});
		$(this).attr('class', 'btn_unfollow');
		$(this).attr('value', '팔로우 중');

	});
	
	//회사 언팔로우
	$(document).on("click", ".btn_unfollow", function() {
		corp_id = $(this).attr("data-corp");
		
		$.ajax({
			type : 'POST',
			url : '/corp_unfollow',
			data : {"target_id" : corp_id}
		});
		$(this).attr('class', 'btn_follow');
		$(this).attr('value', '팔로우');
	});
	
	//일촌맺기
	var user_id = "";
	$(document).on("click", ".btn_connect", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_connect',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_disconnect');
		$(this).attr('value', '일촌수락 대기');
	});

	//일촌끊기
	$(document).on("click", ".btn_disconnect", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_disconnect',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_connect');
		$(this).attr('value', '일촌 맺기');
	});
	
	//일촌수락 대기 -> 취소
	$(document).on("click", ".btn_waiting", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_waiting_delete',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_connect');
		$(this).attr('value', '일촌 맺기');
	});
	
</script>