<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜222</title>
	<style type="text/css">
		
		
	</style>
	
</head>

<body>
<div class="container">
<div class="row">
<div style="margin-top: 101px;">
	<!-- 검색창. -->
	<table border="1">
		<tr>
			<td>
				<i class="fas fa-search"></i>
				<input type="text" placeholder="채용공고 검색">
				<i class="fas fa-map-marker-alt"></i>
				<input type="text" placeholder="지역 검색">
				<input type="button" value="검색">
			</td>
		</tr>
		<tr>
			<td>저장한 검색어 : 검색어1	검색어2 / 알림 관리</td>
		</tr>
	</table>


	<!-- 레이아웃 잡는건 나중에.. -->
	<h3>채용공고저장 페이지임니다. (mem_id : ${SESSION_MEMBERVO.mem_id })</h3>
	
	<table>
		<tr>
			<td><h4>저장한 채용공고 (${srList.size() })</h4></td>
		</tr>
		<tr>
			<td>
				<!-- 첫번째 항목 따로 출력했음. -->
				<table id="srecr1" border="1" onmouseover="" style="margin: 2px; cursor: pointer;">
					<tr>
						<td rowspan="6">${corpImgList.get(0) }</td>
						<td>${srList.get(0).recruit_title }</td>
					</tr>
					<tr>
						<td>${corpNmList.get(0) }</td>
					</tr>
					<tr>
						<td>${srList.get(0).job_local }</td>
					</tr>
					<tr>
						<td>지원 버튼 (또는 'xxx전에 마감되었습니다.')</td>
					</tr>
					<tr>
						<td><i id="" class="far fa-bookmark" onmouseover="" 
								style="margin-top: 10px; font-size: large; cursor: pointer;"></i></td>
					</tr>
				</table>
			</td>
			<td>
				<!-- 저장한 검색어 테이블. -->
				<table border="1" style="margin-left: 10px;">
					<tr>
						<td>저장한 검색어 / 관리</td>
					</tr>
					
					<c:forEach begin="1" end="3" varStatus="i">
						<tr>
							<td>${i.index }</td>
						</tr>
					</c:forEach>
					
					
					<tr>
						<td>더보기</td>
					</tr>
					<tr>
						<td>알림만들기</td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 첫번째 항목을 제외한 전체 리스트. -->
		<c:forEach begin="2" end="${srList.size() }" varStatus="i">
			<tr>
				<td>
					<table id="srecr${i.index }" border="1" style="margin: 2px; cursor: pointer;" onmouseover="">
						<tr>
							<td rowspan="6">${corpImgList.get(i.index - 1) }</td>
							<td>${srList.get(i.index - 1).recruit_title }</td>
						</tr>
						<tr>
							<td>${corpNmList.get(i.index - 1) }</td>
						</tr>
						<tr>
							<td>${srList.get(i.index - 1).job_local }</td>
						</tr>
						<tr>
							<td>지원 버튼 (또는 'xxx전에 마감되었습니다.')</td>
						</tr>
						<tr>
							<td><i id="" class="far fa-bookmark" onmouseover="" 
									style="margin-top: 10px; font-size: large; cursor: pointer;"></i></td>
						</tr>						
					</table>			
				</td>
			</tr>
		</c:forEach>
	</table>	
	
	<br><br>
	
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






