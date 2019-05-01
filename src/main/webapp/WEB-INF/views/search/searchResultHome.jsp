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
									<span class="txt-industry" style="width: 68%;display: inline-block;">${corp.industry_type } ${corp.addr1 }</span>
								</div>
								<div class="col-corpbuttom">
									<button class="btn_follow">팔로우</button>
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
											<h4 style="font-size: 20px; color: #0073B1; font-weight: bold;">${user.mem_name }</h4>
											<p style="font-size: 16px; color: #8D9191; font-weight: bold;">${user.corporate_name }</p><br>
											<p style="font-size: 15px; color: #8D9191; font-weight: bold;">
												${fn:split(user.addr1, ' ')[0] } ${fn:split(user.addr1, ' ')[1] }
											</p>
										</a>
									</a>
									
									<div class="col-connect_controll">
										<button class="btn_connect_controll">1촌 맺기</button>
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

	var search_word = $("#search_word").val();
	console.log(search_word);

	$("#btn_allCorp").on("click", function () {
		
	});
	
	$("#btn_allUser").on("click", function () {
		
	});
	
</script>