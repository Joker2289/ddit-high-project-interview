<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- corp_intro.css -->

<!-- 회사 정보 div -->
<div class="corp_info_area">

	<table class="info_table">
	
		<tr>
			<td colspan="2">
				<h4 class="info_title"><i class="far fa-eye"></i> 한눈에 보기</h4>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 회사 소개</label></td>
			<td>
				<label class="info_content">${ corporationInfo.corp_profile }</label>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 웹사이트</label></td>
			<td>
				<label class="info_content">${ corporationInfo.corp_url }</label>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 업계</label></td>
			<td>
				<label class="info_content">${ corporationInfo.industry_type }</label>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 회사 규모</label></td>
			<td>
				<label class="info_content">${ corporationInfo.corp_size }</label>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 본사 주소</label></td>
			<td>
				<label class="info_content">( ${ corporationInfo.zipcode } ) ${ corporationInfo.addr1 } ${ corporationInfo.addr2 }</label>
			</td>
		</tr>
		<tr>
			<td><label class="info_label"><i class="fas fa-check"></i> 회사 유형</label></td>
			<td>
				<label class="info_content">${ corporationInfo.corp_type }</label>
			</td>
		</tr>
		
	</table>
	
</div>	

<!-- 회사 위치 div -->
<div class="corp_location_area">

	<table class="location_table">
		<tr>
			<td>
				<h4 class="location_title"><i class="fas fa-map-marker-alt"></i> 회사 위치</h4>
			</td>
		</tr>
		<tr>
			<td>
				<div id="map" class="map"></div>
			</td>
		</tr>			
	</table>
	
</div>
				


	<script type="text/javascript">
		$(document).ready(function() {
			console.log("${ corporationInfo.corp_name }");

		});

		var data = "${ corporationInfo.corp_location }";
		var data1 = data.split("/")[0];
		var data2 = data.split("/")[1];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(data1, data2), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨  
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(data1, data2);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">${ corpInfo.corp_name } </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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


