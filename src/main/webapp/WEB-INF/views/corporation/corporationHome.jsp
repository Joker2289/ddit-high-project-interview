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
	<br>
	<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
	<br>
	<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
	<br>
	<%@ include file="/WEB-INF/views/corporation/module/write.jsp"%>
	
	-------------
	회사 타임라인
	-------------
	<br>
	
	${postList.get(0).post_contents }
</body>
</html>