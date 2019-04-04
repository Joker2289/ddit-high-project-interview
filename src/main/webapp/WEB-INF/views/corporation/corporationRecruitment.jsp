<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사 페이지</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<div style="margin-top: 101px;">
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
			</div>
		</div>
	</div>



	<table id="recr1" border="1" onmouseover=""
		style="margin: 2px; cursor: pointer;">
		<tr>
			<td rowspan="6">${corpImgList.get(0) }</td>
			<td>${recrList.get(0).recruit_title }</td>
		</tr>
		<tr>
			<td>${corpNmList.get(0) }</td>
		</tr>
		<tr>
			<td>${recrList.get(0).job_local }</td>
		</tr>
		<tr>
			<td>${recrList.get(0).recruit_contents }</td>
		</tr>
		<tr>
			<td>${recrList.get(0).app_count }명이지원했습니다</td>
		</tr>
		<tr>
			<td>${recrList.get(0).start_date }/간편지원
				${recrList.get(0).app_type }</td>
		</tr>
	</table>
	<c:forEach begin="2" end="${recrList.size() }" varStatus="i">
		<tr>
			<td>
				<table id="recr${i.index }" border="1"
					style="margin: 2px; cursor: pointer;" onmouseover="">
					<tr>
						<td rowspan="6">${corpImgList.get(i.index - 1) }</td>
						<td>${recrList.get(i.index - 1).recruit_title }</td>
					</tr>
					<tr>
						<td>${corpNmList.get(i.index - 1) }</td>
					</tr>
					<tr>
						<td>${recrList.get(i.index - 1).job_local }</td>
					</tr>
					<tr>
						<td>${recrList.get(i.index - 1).recruit_contents }</td>
					</tr>
					<tr>
						<td>${recrList.get(i.index - 1).app_count }명이지원했습니다</td>
					</tr>
					<tr>
						<td>${recrList.get(i.index - 1).start_date }/ 간편지원
							${recrList.get(i.index - 1).app_type }</td>
					</tr>
				</table>
			</td>
		</tr>
	</c:forEach>



</body>
</html>