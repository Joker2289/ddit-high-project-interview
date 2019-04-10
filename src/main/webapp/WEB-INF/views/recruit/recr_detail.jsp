<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜4444</title>
		<!-- 지도 script. -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>	
	
</head>

<body>
<div class="container">
<div class="row">
<div>
	<!-- 레이아웃 잡는건 나중에.. -->
	<table border="0" style="margin-bottom: 60px; margin-top: 0px; padding: 0px; margin-left: -2px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<table border="0" style="width: 795px;">
							<tr>
								<td style="background-image: url('${corp.bg_path }'); height: 100px;">
									<div style="position: relative; top: 40px; left: 25px;">
										<img src="${corp.logo_path }" width="155" style="border: 1px solid;
												border-color: #a6a6a6; border-radius: 3px; border-bottom-width: 2px;">
									</div>
								</td>
							</tr>
							<tr style="height: 40px;">
								<td style="text-align: right;">
									<i class="far fa-share-square" style="color: #0174b0; font-size: 22px;"></i> 
									<i class="far fa-flag" style="color: #0174b0; font-size: 22px;
											margin-left: 10px; margin-right: 28px;"></i>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" style="width: 795px;">
										<tr>
											<td style="width: 600px; padding-left: 20px;">
												<strong style="font-size: 22px;">${recr.recruit_title }</strong><br>
												<span style="font-size: 17px;">${corp.corp_name } ｜ ${recr.job_local }</span><br>
												<span style="font-size: 17px;">게시일: xx일 전 ｜ 지원자 수: xx명 미만</span><br>
											</td>
											<td>
												<input type="button" value="저장" style="border: 1px solid; border-color: #0174b0;
														width: 60px; background-color: white; font-size: 18px; height: 38px;
														color: #0174b0; font-weight: bold; margin-right: 15px; margin-top: 15px;">
												<input type="button" value="지원" style="border: 0px;
														width: 60px; background-color: #0174b0; font-size: 18px; height: 38px;
														color: white; font-weight: bold; margin-top: 15px;">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="1" style="width: 795px;">
										<tr>
											<td style="width: 500px; padding-left: 20px;">
												<span style="font-size: 17px;">(상세내용)</span><br>
											</td>
											<td>
												직급<br>
												...<br>
											</td>
										</tr>
									</table>								
								</td>
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
							<tr style="width: 30px;">
								<td>
									<br><br>
									<a style="padding: 10px; border: 1px solid;"><i class="fas fa-bookmark"></i>스크랩</a>
									<c:choose>
										<c:when test="${recr_app == 't' }">
											<input id="btn_app" type="button" value="지원 취소" style="">
										</c:when>
										<c:otherwise>
											<input id="btn_app" type="button" value="지원 하기" style="">
										</c:otherwise>
									</c:choose>
									<br><br><br><br><br>
								</td>
							</tr>
						</table>
					</div>
					<div class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;">
						<h4>(회사 소개)</h4>
					</div>
				</div>			
			</td>
			<td style="vertical-align: top; margin-left: 0px;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 330px; margin-left: -14px; font-size: 20px; padding-bottom: 7px;
							padding-top: 7px; padding-left: 7px;">
						함께 조회된 페이지
					</div>
					<div class="whiteBox" style="width: 330px; margin-left: -14px; margin-top: -1px; padding-bottom: 2px;">
						<table border="0" style="margin-left: 10px; width: 310px; margin-top: 10px;">
							<tr>
								<td id="app${i.index }" onmouseover="" style="cursor: pointer; 
										border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 7px; 
										padding-top: 0px; padding-left: 4px;">
									<img src="${corpImgList_app.get(i.index - 1) }" width="150"><br>
									${appList.get(i.index - 1).recruit_title }<br>
									${corpNmList_app.get(i.index - 1) }<br>
									${appList.get(i.index - 1).job_local }<br>
									지원일: xx일 전
								</td>
							</tr>
						</table>						
					</div>
				</div>			
			</td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
			<td>
				<img src="${corp.logo_path }" width="200">
			</td>
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
		<tr style="width: 30px;">
			<td>
				<br><br>
				<a style="padding: 10px; border: 1px solid;"><i class="fas fa-bookmark"></i>스크랩</a>
				<c:choose>
					<c:when test="${recr_app == 't' }">
						<input id="btn_app" type="button" value="지원 취소" style="">
					</c:when>
					<c:otherwise>
						<input id="btn_app" type="button" value="지원 하기" style="">
					</c:otherwise>
				</c:choose>
				<br><br><br><br><br>
			</td>
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
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("bg_path? : ${corp.bg_path }");
		
		$("#btn_app").on("click", function(){
			<c:choose>
				<c:when test="${recr_app == 't' }">
					if(confirm("채용공고 지원을 취소하시겠습니까?")){
						window.location.href = '${pageContext.request.contextPath }/recr_app?recruit_code=${recr.recruit_code }&scrap_flag=${scrap_flag }';
					}
				</c:when>
				<c:otherwise>
					if(confirm("해당 채용공고에 지원하시겠습니까?")){
						window.location.href = '${pageContext.request.contextPath }/recr_app?recruit_code=${recr.recruit_code }&scrap_flag=${scrap_flag }';
					}
				</c:otherwise>
			</c:choose>
		});
		
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






