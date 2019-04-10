<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>
<link href="/css/recruit/recruit.css" type="text/css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br>


				<!-- 				<div style="position: relative; top: -177px; left: 240px;margin-top: 20px;width: 270px; height: 180px;background-color: #FFFFFF;box-shadow: 0px 1px 4px;border-radius: 4px;"> -->
				<%-- 						<label> <img style="border-radius: 4px" src="${corporationInfo.logo_path}"></img></label><br> --%>
				<%-- 						<label> ${getRecruitInfo.recruit_title }</label><br> --%>
				<%-- 						<label> ${corporationInfo.corp_name }</label><br> --%>
				<%-- 						<label> ${corporationInfo.addr1 }</label><br> --%>	
				<%-- 						<label> ${getRecruitInfo.job_type }</label><br> --%>




						<div class="col-md-12" style="width: 937px;margin-left: 220px;margin-top: -158px;">
							<div id="pc_find" class="whiteBox" style="height: 300px">
								<label style="font-size: 140%;margin-left: 20px"> 최근에 올라온 채용공고</label>
								<button id="btnslidelt" class="btn btn-default" style="border: 0px; margin-left: 590px; font-size: 150%;">&lt;</button>
								<button id="btnSlidegt" class="btn btn-default" style="border: 0px; margin-left: 10px; font-size: 150%;">&gt;</button><br/>
<!-- 								<ul  id="content" style="list-style:none;width:3000px; padding-left: 5px;"> -->
									<c:forEach items="${getRecruitInfo }" var="getRecruitInfo">
										<div class="whiteBox" style="margin-left: 10px; width: 300px;height: 200px;margin-top: 20px;">
											<img style="margin-left: 10px;" alt="" src="${corporationInfo.logo_path}"><br>
											<div style="font-size: 150%;margin-left: 10px;">${getRecruitInfo.recruit_title}</div><br> 
											<div style="margin-left: 10px;">${corporationInfo.corp_name}</div><br>
										</div> 
									</c:forEach>
								</ul>
							</div>
				</div>
			</div>
		</div>


	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


</body>
</html>