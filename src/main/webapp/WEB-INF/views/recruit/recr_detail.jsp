<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜111</title>
		<!-- 지도 script. -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>	
	
</head>

<body>
<div class="container">
<div class="row">
<div>
	<!-- 레이아웃 잡는건 나중에.. -->
	<table border="0" style="margin-bottom: 20px; margin-top: -4px; padding: 0px; margin-left: 0px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<table border="0" style="width: 795px;">
							<tr>
								<td style="background-image: url('${corp.bg_path }'); height: 100px; background-color: #24a4be;">
									<div style="position: relative; top: 40px; left: 25px;">
										<a href="/corporation?corp_id=${corpor.corp_id }">
											<img src="${corp.logo_path }" width="155" style="border: 1px solid;
													border-color: #a6a6a6; border-radius: 3px; border-bottom-width: 2px;">
										</a>			
									</div>
								</td>
							</tr>
							<tr style="height: 40px;">
								<td style="text-align: right; padding-top: 20px;">
									<i class="far fa-share-square" style="color: #0174b0; font-size: 24px;"></i> 
									<i class="far fa-flag" style="color: #0174b0; font-size: 24px;
											margin-left: 22px; margin-right: 57px;"></i>
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
												<c:choose>
													<c:when test="${recr_app == 't' }">
														<input type="button" value="지원 취소" style="border: 0px;
																width: auto; background-color: #0174b0; font-size: 18px; height: 38px;
																color: white; font-weight: bold; margin-top: 15px; padding-left: 10px;
																padding-right: 10px;" id="btn_app">
													</c:when>
													<c:otherwise>
														<input type="button" value="지원하기" style="border: 0px;
																width: auto; background-color: #0174b0; font-size: 18px; height: 38px;
																color: white; font-weight: bold; margin-top: 15px; padding-left: 10px;
																padding-right: 10px;" id="btn_app">
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="height: 200px;">
									<table border="0" style="width: 794px; border-top: 1px solid; border-color: #a6a6a6;
											margin-top: 15px;">
										<tr style="">
											<td style="width: 520px; padding: 20px; padding-left: 25px;">
												<span style="font-size: 17px;">
													${recr.recruit_contents }
												</span><br>
											</td>
											<td style="vertical-align: top; padding: 20px; font-size: 17px;">
												<strong>직급</strong><br>
												...<br>
												<strong>업계</strong><br>
												...<br>
												<strong>고용형태</strong><br>
												...(등록:${recr.start_date })<br>
											</td>
										</tr>
									</table>								
								</td>
							</tr>
						</table>
					</div>
					<div class="whiteBox" style="width: 795px; margin-top: 30px;">
						<h4>(회사 소개)</h4>
					</div>
	
					<div class="col-md-12">
						<div class="whiteBox" style="width: 795px; margin-bottom: 100px; height: 50px; padding: 10px;
								padding-left: 20px; font-size: 20px; margin-top: -1px; margin-left: -15px;">
							<div id="div_back" onmouseover="" style="cursor: pointer;">
								<i class="fas fa-chevron-left" style="font-size: 19px;"></i>
								<strong>&nbsp; &nbsp;목록으로</strong>
							</div>
						</div>
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

	<br><br>
		
</div>		
</div>		
</div>		
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("req_page? : ${req_page }");
		$("#div_back").on("click", function(){
// 			alert("req page? : ${req_page }");
			<c:choose>
				<c:when test="${req_page == null }">
					window.location.href = '${pageContext.request.contextPath }/srecr';
				</c:when>
				<c:when test="${req_page == 'recruit' }">
					window.location.href = '${pageContext.request.contextPath }/recruit';
				</c:when>
				<c:otherwise>
					window.location.href = '${pageContext.request.contextPath }/recrSearch';
				</c:otherwise>
			</c:choose>
		});
		
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






