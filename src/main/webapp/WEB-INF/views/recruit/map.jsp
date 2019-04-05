<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜22222</title>
	<!-- 우편번호 script. -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 지도 script. -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>	
	<style type="text/css">
		
	</style>
</head>

<body>
<div class="container"><div class="row"><div style="margin-top: 101px;">
	<!-- 레이아웃 잡는건 나중에.. -->
	<h4>원하는 범위를 설정해서 채용공고를 검색해보세요.</h4>
	<table border="1">
		<tr>
			<td><div id="map" style="width:750px;height:600px;"></div></td>
			<td>
				<input id="btn_circle" type="button" value="범위 설정"> <br><br>
				<input id="btn_userAddr" type="button" value="내 주소로 이동"> <br><br>
			</td>
		</tr>
	</table>
	
	
	<table>
		<tr>
			<td id="td_map">
<%-- 				<c:forEach begin="1" end="${corpList.size() }" varStatus="i"> --%>
<%-- 					${i.index }. ${corpList.get(i.index - 1).corp_name } / ${corpList.get(i.index - 1).addr1 } / 거리 : xxx <br> --%>
<%-- 				</c:forEach> <br><br> --%>
			</td>
		</tr>
	</table>
	
	
	<table border="1" style="margin-top: 15px;">
		<tr>
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<!-- 여기의 값으로 corp_location 등록. -->
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</td>
			<td>
				원 그리기 on/off <input id="cb_circle" type="checkbox"><br><br>
				<input id="btn_removeCircles" type="button" value="원 제거하기"> <br><br>			
				<input id="btn_changeAddr" type="button" value="주소 - 좌표 변환"> <br><br>
				<input id="btn_check" type="button" value="확인"> <br><br>
				<input id="btn_all" type="button" value="좌표 확인"> <br><br>
				<input id="btn_marker" type="button" value="마커 하나 찍기"> <br><br>			
			</td>
		</tr>		
		<tr>
			<td>
				전체 좌표 : <strong id="txt_location"></strong><br>
				회사 리스트 <br><br>
				<c:forEach begin="1" end="${corpList.size() }" varStatus="i">
					${i.index }. ${corpList.get(i.index - 1).corp_name } / ${corpList.get(i.index - 1).addr1 } / ${corpList.get(i.index - 1).corp_location } <br>
				</c:forEach> <br><br>
			</td>
			<td>11</td>
		</tr>
		<tr>
			<td>
				채용공고 리스트 <br><br>
				<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
					${i.index }. ${recrList.get(i.index - 1).recruit_title } / ${addrList.get(i.index - 1) } / ${locationList.get(i.index - 1) } <br>
				</c:forEach>
			</td>
			<td>11</td>
		</tr>
	</table>
	
	
	
	<br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
	<br><br><br><br><br><br>	
		
		
		
</div></div></div>		
		
<script>
	var result = "";
	
	// 반경 안 인포윈도우 담는 배열.
	var newinfos = [];

	$(document).ready(function(){
// 		console.log("${corpList.size() }");	
		
		// ajax로 회사와의 거리 나타내기.
		getMapHtml(result);

	});		

	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];	
	var infowindows = [];
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}	
	
	// 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}	
	function hideInfowindows() {
		for(var i=0; i < infowindows.length; i++){
			infowindows[i].close();
		}
		if(newinfos.length > 0){
			for(var i=0; i < newinfos.length; i++){
				newinfos[i].close();
			}
		}
	}	
	
	function getMapHtml(result){
		$.ajax({
			url : "${pageContext.request.contextPath }/mapAjaxHtml",
			data : "result="+result,
			success : function(data){
// 				$("#userListTbody").html(htmlArr[0]);
// 				$("#pagination").html(htmlArr[1]);
				
				console.log("data : " + data);
				
				$("#td_map").html(data);
				
				// * ajax를 통한 html 생성시 이벤트 핸들러 등록 방법 2.
				// ajax callback 안에 클릭 이벤트를 넣어줌.
// 				$(".userTr").on("click", function(){
// 					var userId = $(this).data("userid");
					
// 					$("#userId").val(userId);
// 					$("#frm").submit();
// 				});
			}
		});
	}
	
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new daum.maps.LatLng(36.32485, 127.42009), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨  
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 인포그래픽 담는 배열.
	var iwPositions = [];
	var iwContents = [];
	
	// 마커 위치 담는 배열.
	var markerPositions = [];
	
	// 마커 생성.
	<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
		var data = "${locationList.get(i.index - 1) }";
		var data1 = data.split("/")[0];
		var data2 = data.split("/")[1];
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(data1, data2); 
		markerPositions.push(markerPosition);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);		
		
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);		
		
		var iwContent = '<div style="padding:5px;">${recrList.get(i.index - 1).recruit_title } </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(data1, data2); //인포윈도우 표시 위치입니다

	    iwPositions.push(iwPosition);
	    iwContents.push(iwContent);
	    
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 	
		
		// 인포윈도우를 배열에 넣기.
		infowindows.push(infowindow);
	</c:forEach>
	
	// 마커 표시하지 않기.
	hideMarkers();
	hideInfowindows();
	
	// 마커 생성 후 지도 중심 이동시키기. - 회원의 정보 넣기.
	var addr = "${uVo.addr1 }";
	var user_id = "${uVo.user_id }";
	
	changeUserAddr(addr, user_id);
	
	var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다
	
	var corpLine; // 회사와의 거리를 재기위한 선.
	var arr_corpD = []; // 화사와의 거리를 담은 배열.
	
	var tempCenterValue; // 중심좌표를 확인하기 위한 임시 변수.
	var tempDistanceValue; // 원의 반지름을 확인하기 위한 임시 변수.
	
	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
	
	// 지도에 클릭 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		
		// 체크박스 값 false이면 return.
		if($('input:checkbox[id="cb_circle"]').is(":checked") == false){
			return;
		}
		
		// 원 1개만 그려지도록 하기
		if(circles.length == 1){
			return;
		}
	        
	    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
	    if (!drawingFlag) {    
	        
	        // 상태를 그리고있는 상태로 변경합니다
	        drawingFlag = true; 
	        
	        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
	        centerPosition = mouseEvent.latLng;
	        
	        tempCenterValue = centerPosition;
	
	        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
	        if (!drawingLine) {
	            drawingLine = new daum.maps.Polyline({
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid' // 선의 스타일입니다
	            });    
	            corpLine = new daum.maps.Polyline();
	        }
	        
	        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
	        if (!drawingCircle) {                    
	            drawingCircle = new daum.maps.Circle({ 
	                strokeWeight: 1, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid', // 선의 스타일입니다
	                fillColor: '#00a0e9', // 채우기 색깔입니다
	                fillOpacity: 0.2 // 채우기 불투명도입니다 
	            });     
	        }
	        
	        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
	        if (!drawingOverlay) {
	            drawingOverlay = new daum.maps.CustomOverlay({
	                xAnchor: 0,
	                yAnchor: 0,
	                zIndex: 1
	            });              
	        }
	    }
	});
	
	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
		
	    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
	    if (drawingFlag) {
	
	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 
	        
	        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
	        var linePath = [centerPosition, mousePosition];     
	        
	        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
	        drawingLine.setPath(linePath);
	        
	        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
	        var length = drawingLine.getLength();
	        
	        tempDistanceValue = length;
	        
	        if(length > 0) {
	            
	            // 그려지고 있는 원의 중심좌표와 반지름입니다
	            var circleOptions = { 
	                center : centerPosition, 
	            	radius: length,                 
	            };
	            
	            // 그려지고 있는 원의 옵션을 설정합니다
	            drawingCircle.setOptions(circleOptions); 
	                
	            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
	            var radius = Math.round(drawingCircle.getRadius()),   
	            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
	            drawingOverlay.setPosition(mousePosition);
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
	            drawingOverlay.setContent(content);
	            
	            // 그려지고 있는 원을 지도에 표시합니다
	            drawingCircle.setMap(map); 
	            
	            // 그려지고 있는 선을 지도에 표시합니다
	            drawingLine.setMap(map);  
	            
	            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
	            drawingOverlay.setMap(map);
	        } else { 
	            
	            drawingCircle.setMap(null);
	            drawingLine.setMap(null);    
	            drawingOverlay.setMap(null);
	            
	        }
	    }     
	});     
	
	var corp_num = 0;
	
	// array markers flag. 마커들이 반경 안에 있는지 여부를 담은 배열.
	var arr_mflag = [];
	
	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	    if (drawingFlag) {
			arr_corpD = [];	    	
	    	
	        <c:forEach begin="1" end="${recrList.size() }" varStatus="i">
		        var corpPath = [centerPosition, markerPositions[${i.index - 1 }]];  
		        corpLine.setPath(corpPath);
		        var corpD = corpLine.getLength();
				arr_corpD.push(corpD);	        	
      		</c:forEach>	
	    	
	    	
	        // 마우스로 오른쪽 클릭한 위치입니다 
	        var rClickPosition = mouseEvent.latLng; 
	
	        // 원의 반경을 표시할 선 객체를 생성합니다
	        var polyline = new daum.maps.Polyline({
	            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
	            strokeWeight: 3, // 선의 두께 입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });
	        
	        // 원 객체를 생성합니다
	        var circle = new daum.maps.Circle({ 
	            center : centerPosition, // 원의 중심좌표입니다
	            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
	            strokeWeight: 1, // 선의 두께입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid', // 선의 스타일입니다
	            fillColor: '#00a0e9', // 채우기 색깔입니다
	            fillOpacity: 0.2  // 채우기 불투명도입니다 
	        });
	        
	        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
	            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다
	
	        
	        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
	        var radiusOverlay = new daum.maps.CustomOverlay({
	            content: content, // 표시할 내용입니다
	            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 1 
	        });  
	
	        // 원을 지도에 표시합니다
	        circle.setMap(map); 
	        
	        // 선을 지도에 표시합니다
	        polyline.setMap(map);
	        
	        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
	        radiusOverlay.setMap(map);
	        
	        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
	        var radiusObj = {
	            'polyline' : polyline,
	            'circle' : circle,
	            'overlay' : radiusOverlay
	        };
	        
	        // 배열에 추가합니다
	        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
	        circles.push(radiusObj);   
	    
	        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
	        drawingFlag = false;
	        
	        // 중심 좌표를 초기화 합니다  
	        centerPosition = null;
	        
	        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
	        drawingCircle.setMap(null);
	        drawingLine.setMap(null);   
	        drawingOverlay.setMap(null);
	        
	        // 변수 값 초기화.
	        result = "";
	        arr_mflag = [];
	        
	        <c:forEach begin="1" end="${recrList.size() }" varStatus="i">
		        // 회사의 좌표
// 			    var corp_location = "${corpList.get(i.index - 1).corp_location }";
// 			    var corp_lat = corp_location.split("/")[0];
// 			    var corp_lng = corp_location.split("/")[1];
// 			    var corp_position = "(" + corp_lat + ", " + corp_lng + ")";
			    
				// 좌표를 통해 직접 거리를 계산해야겠다. 함수로 가져온 좌표값은 자료형이 뭔지 모르겠네.
				// 아무튼 문자열로 변환해주는 'String([object])'을 이용해서 문자열로 바꿨음.
// 				var center_location = String(tempCenterValue);
// 				center_location = center_location.substr(1, center_location.length);
// 				center_location = center_location.substr(0, center_location.length - 1);
// 				var center_lat = center_location.split(", ")[0];
// 				var center_lng = center_location.split(", ")[1];
				
				// 원 중심에서 corpList.get(0)까지의 거리.
// 				var tempDistance = 94344.35355830716 * (Math.sqrt( ((corp_lat+0)-(center_lat+0))*((corp_lat+0)-(center_lat+0)) + ((corp_lng+0)-(center_lng+0))*((corp_lng+0)-(center_lng+0)) ));
				
				if(arr_corpD[${i.index - 1 }] < tempDistanceValue){
					// '회사1:신세계,거리:100m/회사2:삼성,거리:200m...'
					result += "회사${i.index }:${recrList.get(i.index - 1).recruit_code },거리:" + arr_corpD[${i.index - 1 }] + "/";
					
					arr_mflag.push(true);
				}else{
					arr_mflag.push(false);
				}
				
	        </c:forEach>
// 			    alert("인덱스:${corpList.get(i.index).addr1 }  /  체크:"+ tempDistance);
// 			    alert("원 중심 좌표:"+ tempCenterValue);
// 			    alert("원 반지름:"+ tempDistanceValue);
	        
	        result += "반경:" + tempDistanceValue;

	        var arr_result = result.split("/");
	        
	        // 반경 내의 회사 수.
	        corp_num = arr_result.length - 1;
	        alert("범위 내에 " + corp_num + "개의 채용공고가 있습니다.");
	        getMapHtml(result);
	        
// 	        alert(arr_corpD);
			// 반경 안의 회사의 마커, 인포윈도우 표시하기.
			setCorps(map);
	        
		    tempCenterValue = null;
		    tempDistanceValue = null;
	    }
	    
	});    

	// 반경 안의 회사의 마커, 인포윈도우 표시하는 함수.
	function setCorps(map) {
		newinfos = [];
		
	    for (var i = 0; i < markers.length; i++) {
	    	if(arr_mflag[i] == true){
		        markers[i].setMap(map);
		        
				// 인포윈도우를 생성합니다
				var newinfo = new daum.maps.InfoWindow({
				    position : iwPositions[i], 
				    content : iwContents[i] 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				newinfo.open(map, markers[i]);
				newinfos.push(newinfo);
	    	}
	    }            
	}
	    
	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	    
		// 마커 표시하지 않기.
		hideMarkers();
		hideInfowindows();
	}
	
	// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
	// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {
	    // 거리를 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info" style="color: black;">';
	    content += '    <li>';
	    content += '        <span>총거리 : </span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '</ul>'
	
	    return content;
	}
	
	// 범위 설정 버튼
	$("#btn_circle").on("click", function(){
		if($('input:checkbox[id="cb_circle"]').is(":checked") == false){
			$('input:checkbox[id="cb_circle"]').attr("checked", true);
// 			alert("원 그리기 : " + $('input:checkbox[id="cb_circle"]').is(":checked"));
			alert("지도에 원하는 범위를 설정하세요. (시작: 마우스 왼쪽 버튼, 종료: 마우스 오른쪽 버튼)");
		}else{
			if(confirm("범위를 재설정하시겠습니까?")){
				removeCircles();
				
// 				alert("원 그리기 : " + $('input:checkbox[id="cb_circle"]').is(":checked"));
				alert("지도에 원하는 범위를 설정하세요. (시작: 마우스 왼쪽 버튼, 종료: 마우스 오른쪽 버튼)");
			}
		}
	});
	
	// 원 그리기 on/off
	$("#cb_circle").on("click", function(){
		alert("원 그리기 : " + $('input:checkbox[id="cb_circle"]').is(":checked"));
		// 체크박스 값이 true일 때 원 그릴 수 있도록 설정.
	});
	
	// 원 제거하기
	$("#btn_removeCircles").on("click", function(){
		removeCircles();
	});
	
	// 회원의 주소 표시.
	$("#btn_userAddr").on("click", function(){
		var addr = "${uVo.addr1 }";
		var user_id = "${uVo.user_id }";
		
		changeUserAddr(addr, user_id);
	});	
	
	// 주소 - 좌표 변환.
	$("#btn_changeAddr").on("click", function(){
		changeAddr($("#sample6_address").val());
	});	
	
	
	// 주소 - 좌표 변환 메서드.
	var marker = null;	
	var coords = null;
	function changeUserAddr(addr, user_id){
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		        coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + user_id + '님의 주소</div>'
		        });
		        
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}	
	
	function changeAddr(addr){
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		        coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}	
    
    
    
</script>	

<!-- 우편번호 script. -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
	
</body>
</html>






