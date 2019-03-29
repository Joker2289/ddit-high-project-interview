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
			<td><br></td>
		</tr>
		<tr>
			<td>
				<strong>리크루터에게 이직할 의사가 있다고 밝히기</strong>
				 / 켜짐(꺼짐) <input type="checkbox">
				<!-- 이직의사를 켰을때 리크루터에게하고싶은말 textarea가 생김. -->
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				리크루터에게 하고 싶은 말 <br>
				<textarea rows="" cols="" placeholder="리크루터들에게 알리고 싶은 점이 있으세요?"></textarea>
			</td>
		</tr>
		<tr>
			<td><br></td>
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
			<td><br></td>
		</tr>		
		<tr>
			<td>
				원하시는 업무분야가 무엇인가요? <br>
				(최대 3개까지 등록 가능합니다.)<br>
				1순위: xxx &nbsp; &nbsp; &nbsp;2순위: xxx &nbsp; &nbsp; &nbsp;3순위: xxx &nbsp; &nbsp; &nbsp;<br>
				<input type="checkbox"> 소프트웨어개발 &nbsp;<input type="checkbox"> 백엔드 &nbsp;<input type="checkbox"> 모바일앱개발 &nbsp;<input type="checkbox"> 웹마스터<br>
				<input type="checkbox"> 공공기관 &nbsp;<input type="checkbox"> 전자상거래 &nbsp;<input type="checkbox"> 웹컨텐츠 &nbsp;<input type="checkbox"> 웹테스터<br>
				<input type="checkbox"> 모바일기획 &nbsp;<input type="checkbox"> 서버관리 &nbsp;<input type="checkbox"> 시스템운영 &nbsp;<input type="checkbox"> 네트워크구축<br>
				<input type="checkbox"> 클라이언트개발 &nbsp;<input type="checkbox"> 유지보수 &nbsp;<input type="checkbox"> 알고리즘 &nbsp;<input type="checkbox"> 데이터베이스<br>
				<input type="checkbox"> 웹프로그래밍 &nbsp;<input type="checkbox"> 통신 &nbsp;<input type="checkbox"> 빅데이터 &nbsp;<input type="checkbox"> 머신러닝<br>
				<input type="checkbox"> 소프트웨어QA &nbsp;<input type="checkbox"> 리눅스 &nbsp;<input type="checkbox"> 안드로이드 &nbsp;<input type="checkbox"> 솔루션<br>
				<input type="checkbox"> 네트워크보안 &nbsp;<input type="checkbox"> HTTP·TCP &nbsp;<input type="checkbox"> Python &nbsp;<input type="checkbox"> POS<br>
				<input type="checkbox"> C++ &nbsp;<input type="checkbox"> DataMining &nbsp;<input type="checkbox"> Java &nbsp;<input type="checkbox"> Nodejs<br>
				<input type="checkbox"> .NET &nbsp;<input type="checkbox"> springboot &nbsp;<input type="checkbox"> Framework &nbsp;<input type="checkbox"> DBMS<br>
				<input type="checkbox"> asp &nbsp;<input type="checkbox"> Oracle &nbsp;<input type="checkbox"> MS-SQL &nbsp;<input type="checkbox"> SM<br>
				<input type="checkbox"> SI &nbsp;<input type="checkbox"> WAS &nbsp;<input type="checkbox"> jsp &nbsp;<input type="checkbox"> DBA<br>
				<input type="text" placeholder="+ 업무분야 등록" onmouseover="" style="cursor: pointer; width: 120px;">			
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				어느 지역으로 취직/이직하고 싶으세요? <br>
				<input type="checkbox"> 상관없음 &nbsp;<input type="checkbox"> 서울 &nbsp;<input type="checkbox"> 경기 &nbsp;<input type="checkbox"> 인천<br>
				<input type="checkbox"> 대전 &nbsp;<input type="checkbox"> 세종 &nbsp;<input type="checkbox"> 충남 &nbsp;<input type="checkbox"> 충북<br>
				<input type="checkbox"> 광주 &nbsp;<input type="checkbox"> 전남 &nbsp;<input type="checkbox"> 전북 &nbsp;<input type="checkbox"> 대구<br>
				<input type="checkbox"> 경북 &nbsp;<input type="checkbox"> 부산 &nbsp;<input type="checkbox"> 울산 &nbsp;<input type="checkbox"> 경남<br>
				<input type="checkbox"> 강원 &nbsp;<input type="checkbox"> 제주 <br>
				<input type="text" placeholder="+ 희망지역 등록" onmouseover="" style="cursor: pointer; width: 120px;">			
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				원하시는 고용형태가 있으신가요? <br>
				<input type="checkbox"> 정규직 <br>
				<input type="checkbox"> 계약직	 <br>
				<input type="checkbox"> 인턴	 <br>
				<input type="checkbox"> 파견직	 <br>
				<input id="" type="checkbox"> 도급	 <br>
				<input id="" type="checkbox"> 프리랜서	 <br>
			</td>
		</tr>
		<tr>
			<td><br></td>
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
					<option>10,000+명</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
	</table>
	<br>
	
	<input type="button" value="저장">
	
	<br><br>
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






