<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>22222</title>
	<style type="text/css">
		
		
	</style>
	
</head>

<body>
<div class="container">
<div class="row">
<div>
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
				<table border="1" style="margin: 2px;">
					<tr>
						<td id="img1" rowspan="6" onmouseover="" style="cursor: pointer;">${corpImgList.get(0) }</td>
						<td id="srecr1" onmouseover="" style="cursor: pointer;">
							${srList.get(0).recruit_title }<br>
							${corpNmList.get(0) }<br>
							${srList.get(0).job_local }<br>
						</td>
						<td><i id="scrap1" class="fas fa-bookmark" onmouseover="" 
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
					<table border="1" style="margin: 2px;">
						<tr>
							<td id="img${i.index }" rowspan="6" onmouseover="" style="cursor: pointer;">${corpImgList.get(i.index - 1) }</td>
							<td id="srecr${i.index }" onmouseover="" style="cursor: pointer;">
								${srList.get(i.index - 1).recruit_title }<br>
								${corpNmList.get(i.index - 1) }<br>
								${srList.get(i.index - 1).job_local }<br>
							</td>
							<td><i id="scrap${i.index }" class="fas fa-bookmark" onmouseover="" 
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
		
		// 이미지, 채용공고 & 스크랩 클릭
		<c:forEach begin="1" end="${srList.size() }" varStatus="i">
			$("#img${i.index }").on("click", function(){
				alert("code : ${srList.get(i.index - 1).recruit_code }");
				
				// 상세보기 페이지로 이동.
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${srList.get(i.index - 1).recruit_code }';
			});
			
			$("#srecr${i.index }").on("click", function(){
// 				alert("채용공고 ${i.index }");
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${srList.get(i.index - 1).recruit_code }';
			});
			
			$("#scrap${i.index }").on("click", function(){
// 				alert("스크랩 ${i.index }");

				// 스크랩 취소하기.
			});
		</c:forEach>
		
		
	});

</script>	
	
</body>
</html>






