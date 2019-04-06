<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/recruit/recruit.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사 페이지</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<div>
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br>
				<div style="position: relative; top: -177px; left: 180px;margin-top: 20px;border: 1px solid;width: 270px; height: 180px;">
						<label> ${corporationInfo.logo_path }</label><br>
						<label> ${getRecruitInfo.recruit_title }</label><br>
						<label> ${corporationInfo.corp_name }</label><br>
						<label> ${corporationInfo.addr1 }</label><br>
						<label> ${getRecruitInfo.job_type }</label><br>
				</div>
			</div>
		</div>
	</div>

<div id="div_box" class="whiteBox" style="position: relative; top: -177px; left: 180px;margin-top: 20px;border: 1px solid;width: 270px; height: 180px;">
						<label> ${corporationInfo.logo_path }</label><br>
						<label> ${getRecruitInfo.recruit_title }</label><br>
						<label> ${corporationInfo.corp_name }</label><br>
						<label> ${corporationInfo.addr1 }</label><br>
						<label> ${getRecruitInfo.job_type }</label><br>
</div>




</body>
</html>