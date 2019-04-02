<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜3333</title>
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
				항목 수 xxx
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
	<h3>채용공고검색 페이지임니다. (mem_id : ${SESSION_MEMBERVO.mem_id })</h3>
	<h5>(채용공고 수 - ${recrList.size() })</h5>
	<h5>(검색 : 검색어 - ${lSLog.search_word } / 지역 - ${lSLog.search_local })</h5>
	
	<table>
		<tr>
			<td>
				<!-- 첫번째 항목 따로 출력했음. -->
				<table id="recr1" border="1" onmouseover="" style="margin: 2px; cursor: pointer;">
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
						<td>${recrList.get(0).app_count }명이 지원했습니다</td>
					</tr>
					<tr>
						<td>${recrList.get(0).start_date } / 간편지원 ${recrList.get(0).app_type }</td>
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
		<c:forEach begin="2" end="${recrList.size() }" varStatus="i">
			<tr>
				<td>
					<table id="recr${i.index }" border="1" style="margin: 2px; cursor: pointer;" onmouseover="">
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
							<td>${recrList.get(i.index - 1).app_count }명이 지원했습니다</td>
						</tr>
						<tr>
							<td>${recrList.get(i.index - 1).start_date } / 간편지원 ${recrList.get(i.index - 1).app_type }</td>
						</tr>
					</table>			
				</td>
			</tr>
		</c:forEach>
		
		
	</table>	
	
	<br><br>
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
		
		<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
			$("#recr${i.index }").on("click", function(){
// 				alert("${i.index }");
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${recrList.get(i.index - 1).recruit_code }&otherParam=1';
			});
		</c:forEach>
		
	});

</script>	
	
</body>
</html>






