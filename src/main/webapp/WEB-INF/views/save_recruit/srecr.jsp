<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView11</title>
	<style type="text/css">
		
		
	</style>
	
</head>

<body>
<div class="container">
<div class="row">
<div style="margin-top: 101px;">
	<!-- 필터. -->
	<table border="1">
		<tr>
			<td>
				항목 수 xxx (여기는 저장한 채용공고 보여주는 페이지임.)
			</td>
			<td>
				<select>
					<option>올린날</option>
				</select>
			</td>
			<td>
				<select>
					<option>기능</option>
				</select>
			</td>
			<td>
				<select>
					<option>회사</option>
				</select>
			</td>
			<td>
				<select>
					<option>경력수준</option>
				</select>
			</td>
			<td><a href="">전체필터</a></td>
		</tr>
	</table>


	<!-- 레이아웃 잡는건 나중에.. -->
	<h3>채용공고저장 페이지임니다. (mem_id : ${SESSION_MEMBERVO.mem_id })</h3>
	
	<table border="1">
		<tr>
			<td>채용공고 검색 쪽부터 먼저 만들자.</td>
			<td>저장한 검색어</td>
		</tr>
		<tr>
			<td>채용공고2</td>
		</tr>
		<tr>
			<td>채용공고3</td>
		</tr>
		<tr>
			<td>채용공고4</td>
		</tr>
	</table>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>	
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






