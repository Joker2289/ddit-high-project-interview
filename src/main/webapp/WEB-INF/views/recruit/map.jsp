<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b"></script>	
	<style type="text/css">
		
	</style>
</head>

<body>
<div class="container"><div class="row"><div style="margin-top: 101px;">
	<!-- 레이아웃 잡는건 나중에.. -->
	
	<br><br>
	<h3>지도에서 채용공고 검색하기 페이지임니다</h3>
	
	<div id="map" style="width:500px;height:400px;"></div>
	
	
	<br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
	<br><br><br><br><br><br>	
		
		
		
</div></div></div>		
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("docu");
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴		
		
		
	});
	

</script>	
	
</body>
</html>






