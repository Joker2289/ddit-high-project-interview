<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜111</title>
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
	
	<br><br>
	<h3>지도에서 채용공고 검색하기 페이지임니다</h3>
	
	<table border="1">
		<tr>
			<td><div id="map" style="width:750px;height:600px;"></div></td>
			<td>
				<input id="btn_removeCircles" type="button" value="원 제거하기"> <br><br>
				<input id="btn_circleNum" type="button" value="원 개수확인"> <br><br>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<!-- 여기의 값으로 corp_location 등록. -->
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</td>
			<td>11</td>
		</tr>
	</table>
	
	
	
	<br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
	<br><br><br><br><br><br>	
		
		
		
</div></div></div>		
		
<script>
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new daum.maps.LatLng(36.32485, 127.42009), // 지도의 중심좌표
	    level: 2 // 지도의 확대 레벨  
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다
	
	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
	
	// 지도에 클릭 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		
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
	
	        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
	        if (!drawingLine) {
	            drawingLine = new daum.maps.Polyline({
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid' // 선의 스타일입니다
	            });    
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
	
	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	    if (drawingFlag) {
	
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
	    }
	});    
	    
	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	}
	
	// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
	// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {
	
	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';
	
	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';
	
	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
	
	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'
	
	    return content;
	}
	
	// 원 제거하기
	$("#btn_removeCircles").on("click", function(){
		removeCircles();
	});
	
	// 원 개수확인
	$("#btn_circleNum").on("click", function(){
		alert(circles.length);
	});
	
	
	
	
  	
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






