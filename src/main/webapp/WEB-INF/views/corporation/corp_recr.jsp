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




	<div id="pc_find" class="whiteBox" style="height: 300px;width: 100%;">
		<div class="recr">
			<label class="recr_title"> 회사 채용공고</label>
			<button id="btnslidelt" class="btn btn-default">&lt;</button>
			<button id="btnSlidegt" class="btn btn-default">&gt;</button>
		</div>	
		<c:forEach items="${getRecruitInfo }" var="getRecruitInfo">
			<div class="whiteBox" id="all_recr">
				<img src="${corporationInfo.logo_path}">
				<div style="font-size: 150%; margin-left: 10px;">${getRecruitInfo.recruit_title}</div>
				<div style="margin-left: 10px;">${corporationInfo.corp_name}</div>
			</div>
		</c:forEach>
	</div>






</body>
</html>