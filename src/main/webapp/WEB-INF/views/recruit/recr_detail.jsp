<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView</title>
	<style type="text/css">
		
		
	</style>
	
</head>

<body>
<div class="container">
<div class="row">
<div style="margin-top: 101px;">

	<!-- 레이아웃 잡는건 나중에.. -->
	<!-- 채용공고 상세 페이지. 어떤 param을 받아야되지? - recr/corp 받음. -->
	<h3>채용공고 상세 페이지</h3>
	
	<!-- 회사 배경이미지 넣어야 됨. -->
	<table border="1">
		<tr>
			<td>${corp.logo_path }</td>
		</tr>
		<tr>
			<td>${recr.recruit_title }</td>
		</tr>
		<tr>
			<td>${corp.corp_name }</td>
		</tr>
		<tr>
			<td>게시일: xxx</td>
		</tr>
		<tr>
			<td>지원자: ${recr.app_count }</td>
		</tr>
		<tr>
			<td>간편지원여부: ${recr.app_type }</td>
		</tr>
		<tr>
			<td>${recr.job_local }</td>
		</tr>
		<tr>
			<td>${recr.job_type }</td>
		</tr>
		<tr>
			<td>${recr.recruit_contents }</td>
		</tr>
		<tr>
			<td>${recr.job_rank }</td>
		</tr>
		<tr>
			<td>${recr.emp_type }</td>
		</tr>
	</table>	
		
</div>		
</div>		
</div>		
		
		
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- font awesome icon -->
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("docu");
			

		});
	
	
	</script>	
	
</body>
</html>






