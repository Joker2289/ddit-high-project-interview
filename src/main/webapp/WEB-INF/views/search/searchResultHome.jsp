<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/searchResult/searchResultHome.css" rel="stylesheet">
<div class="container">
	<div class="row">
		<div class="col-md-10" style="border: 0px solid #333333; height: 100px;">
			<div id="div_box" class="whiteBox">
				<h4 style="color: #8D9191;padding-left: 10px;padding-bottom: 10px;font-weight: bold;border-bottom: 1px solid #ddd;margin-bottom: 0px;">업체 검색결과  ${corpCount }건</h4>
				
				<div class="col-result">
					<div class="result_corp">
						<c:forEach items="${corpList }" var="corp">
							<div class="corp_info">
							
								<div class="corp_img">
									<a href="/corporation?corp_id=${corp.mem_id }">
										<img src="${corp.profile_path }" style="width: 150px;">
									</a>
								</div>
								
								<div class="col-corpInfomation">
									<a class="txt-corp_name" href="/corporation?corp_id=${corp.mem_id }">${corp.mem_name }</a>
									<span class="txt-industry">${corp.industry_type }</span>
								</div>
								<div class="col-corpbuttom">
									<button class="btn_follow">팔로우</button>
								</div>
								
							</div>
						</c:forEach>
					</div>
					<div class="result_user">
						<h4 style="color: #8D9191;padding-left: 10px;padding-bottom: 10px;font-weight: bold;border-bottom: 1px solid #ddd;margin-bottom: 0px;">관련 인물 검색결과 ${userCount }건</h4>
						<div style="padding: 10px;">
							<c:forEach items="${userList }" var="user">
								<div class="user_info" style="display: table;">
									<div class="user_container" style="box-shadow: 0px 6px 12px rgba(0, 0, 0, .175);">
										
										<a class="user_img">
											<a href="/profileHome?user_id=${user.mem_id }">
		<%-- 										<img class="user_img" src="${ cp }/view/imageView?mem_id=${user.mem_id }&division=pf"> --%>
												<img class="user_img" src="/images/profile/basicProfile.png">
												<h4 style="font-size: 20px; color: #0073B1; font-weight: bold;">${user.mem_name }</h4>
												<p style="font-size: 16px; color: #8D9191; font-weight: bold;">${user.corporate_name }</p>
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
</div>