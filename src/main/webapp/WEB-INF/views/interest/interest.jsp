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
<div class="container"><div class="row"><div style="margin-top: 101px;">
	<!-- 레이아웃 잡는건 나중에.. -->
	
	<br><br>
	
	<table border="1">
		<tr>
			<td><strong>커리어 관심분야</strong> / <a href="">개인정보 설정</a></td>
		</tr>
		<tr>
			<td>
				<strong>리크루터에게 이직할 의사가 있다고 밝히기</strong>
				 / 켜짐(꺼짐) <input type="checkbox">
				<!-- 이직의사를 켰을때 리크루터에게하고싶은말 textarea가 생김. -->
			</td>
		</tr>
		<tr>
			<td>
				리크루터에게 하고 싶은 말 <br>
				<textarea rows="" cols="" placeholder="리크루터들에게 알리고 싶은 점이 있으세요?"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>회원님의 커리어 관심분야는 회원님께 추천하는 채용공고를 결정합니다.</strong> <br>
				현재 회원님의 상태는? <br>
				<select>
					<option>상태</option>
					<option>적극적으로 지원하는 중</option>
					<option>가끔 지원함</option>
					<option>지원하고 있지 않지만 제안을 받는다면 고려할 것</option>
					<option>원하고 있지 않고 기회가 생겨도 거절할 것</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				원하시는 업무분야가 무엇인가요? <br>
				<a href="">+ 업무분야 등록</a>				
			</td>
		</tr>
		<tr>
			<td>
				어느 지역으로 취직/이직하고 싶으세요? <br>
				<a href="">+ 희망지역 등록</a>	
			</td>
		</tr>
		<tr>
			<td>
				원하시는 고용형태가 있으신가요? <br>
				<input type="checkbox"> 정규직 <br>
				<input type="checkbox"> 111	 <br>
				<input type="checkbox"> 111	 <br>
				<input type="checkbox"> 111	 <br>
				<input id="" type="checkbox"> 111	 <br>
			</td>
		</tr>
		<tr>
			<td>
				원하시는 회사 규모는? <br>
				<select>
					<option>1명</option>
					<option>10명</option>
					<option>50명</option>
					<option>200명</option>
					<option>500명</option>
					<option>1,000명</option>
					<option>5,000명</option>
					<option>10,000명</option>
				</select>
				 - 
				<select>
					<option>1명</option>
					<option>10명</option>
					<option>50명</option>
					<option>200명</option>
					<option>500명</option>
					<option>1,000명</option>
					<option>5,000명</option>
					<option>10,000명</option>
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
		
		
		
		
</div></div></div>		
		
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






