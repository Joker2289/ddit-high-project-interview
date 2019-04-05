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
${SESSION_MEMBERVO.mem_id }
${SESSION_MEMBERVO.mem_division }
<table id="profilemenu">
	<thead>
<c:if test="${SESSION_MEMBERVO.mem_division == '2' }">
			회사계정
		
			</c:if>
			<c:if test="${SESSION_MEMBERVO.mem_division == '1' }">
			일반계정
			</c:if>
</thead>
</table>



</body>
</html>