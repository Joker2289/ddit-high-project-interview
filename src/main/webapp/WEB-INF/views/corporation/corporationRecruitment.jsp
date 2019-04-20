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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Carousel Slider</title>

</head>
<body>

	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br>


						<div class="col-md-12" style="width: 937px;margin-left: 220px;margin-top: -158px;">
							<div id="pc_find" class="whiteBox" style="height: 300px">
								<label style="font-size: 140%;margin-left: 20px"> 최근에 올라온 채용공고</label>
								<button id="btnslidelt" class="btn btn-default" style="border: 0px; margin-left: 590px; font-size: 150%;">&lt;</button>
								<button id="btnSlidegt" class="btn btn-default" style="border: 0px; margin-left: 10px; font-size: 150%;">&gt;</button><br/>
									<c:forEach items="${getRecruitInfo }" var="getRecruitInfo">
										<div class="whiteBox" style="margin-left: 10px; width: 300px;height: 200px;margin-top: 20px;">
											<img style="margin-left: 10px;" alt="" src="${corporationInfo.logo_path}"><br>
											<div style="font-size: 150%;margin-left: 10px;">${getRecruitInfo.recruit_title}</div><br> 
											<div style="margin-left: 10px;">${corporationInfo.corp_name}</div><br>
										</div> 
									</c:forEach>
							</div>
				</div>
			</div>
		</div>

		


-----------------------------------------
<iframe width="560" height="315" src="https://www.youtube.com/embed/ybhXVSAdIRE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

-----------------------------------------



  
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


</body>
</html>