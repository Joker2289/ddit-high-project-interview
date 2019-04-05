<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView</title>
		<!-- 지도 script. -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>	
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
		<tr>
			<td>
				<div id="map" style="width:500px;height:400px;"></div>
			</td>
		</tr>
	</table>	
	<br>
	<a href="#" onclick="history.back(-1); return false;">뒤로 가기</a>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
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
	
	var data = "${corp.corp_location }";
	var data1 = data.split("/")[0];
	var data2 = data.split("/")[1];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new daum.maps.LatLng(data1, data2), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨  
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(data1, data2); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);	

	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
// 	var content = "${recr.recruit_title }";
// 	if(content.length > 21){
// 		content = content.substr(0, 21) + "...";
// 	}
	
	var iwContent = '<div style="padding:5px;">${corp.corp_name }<br>${recr.recruit_title } </div>', 
    iwPosition = new daum.maps.LatLng(data1, data2); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 	
	

</script>	
	
</body>
</html>






