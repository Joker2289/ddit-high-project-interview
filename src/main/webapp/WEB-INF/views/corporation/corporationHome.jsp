<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<br>
	<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
	<br>
	<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
<!-- 	------------- -->
<!-- 	업데이트 -->
<!-- 	------------- -->
<!-- 	<table> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>사진공유</th> -->
<!-- 				<th>동영상공유</th> -->
<!-- 				<th>문서공유</th> -->
<!-- 				<th>글쓰기</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 	</table> -->
	${postList.get(0).post_contents }
</body>
</html>