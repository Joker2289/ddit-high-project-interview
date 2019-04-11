<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<link href="/css/recruit/recruit.css" type="text/css" rel="stylesheet">
	<title>채용공고｜22222</title>
	
	<style type="text/css">
	</style>
</head>

<body>






<div class="container">
<div class="row">
<div>

	<div class="col-md-12" >
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 20px;
				text-align: center; font-size: 18px; padding-top: 18px;">
			<a href="${pageContext.request.contextPath }/srecr">
				<i class="far fa-check-circle" style="color: #0174b0;"></i>
				채용공고 상태 파악
			</a> │ 
			<a href="${pageContext.request.contextPath }/interest">
				<i class="fas fa-pencil-alt" style="color: #0174b0;"></i>
				커리어 관심분야
			</a>
			<span style="margin: 370px;">
				인재를 찾고 계세요?
				<a href="${pageContext.request.contextPath }/writeRecr" class="genric-btn info-border" style="
						border: 1px solid; padding: 9px; margin-left: 15px; border-color: #0174b0; 
						color: #0174b0;">
					<i class="fas fa-edit" style="color: #0174b0;"></i>
					채용공고 올리기
				</a>
			</span>		
		</div>
	</div>
	
	<div class="col-md-12" >
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 0px;
				text-align: center; padding-top: 10px; background-color: #edf1f5; border-bottom: 0px;
				font-size: 22px;">
			<a href="${pageContext.request.contextPath }/map" style="">
				<img width="37" src="http://mblogthumb4.phinf.naver.net/20160920_175/kokoa2100_1474368430239vv9yY_PNG/mzl.xnmoezsr.png?type=w800">   	
				 지도에서 검색 - 한 눈에 확인하는 채용공고.
			</a>
		</div>
	</div>
	
	<div class="col-md-12" >
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 20px;
				text-align: center; padding-top: 12px; font-size: 21px;">
			<a href="https://media.daum.net/digital/">
				<img width="30" src="https://lh3.googleusercontent.com/sMhe3GxpmWD6NISZBzhy--dtwcAcVvLFDxOGe1Kat3d0YA0nhq9ICwTSFN3UQ7uEZA">
				 뉴스로 IT 업계 동향을 확인해보세요. 1
			</a>
		</div>
	</div>
	
	<form action="${pageContext.request.contextPath }/insertSLog" id="frm_search" method="post">
		<input type="hidden" id="search_word" name="search_word">
		<input type="hidden" id="search_local" name="search_local">
		
		<div class="col-md-12" style="height: 148px;">
			<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 148px; text-align: center;
					background-color: #edf1f5;">
				<h3 style="color: black;">꿈꾸시던 직장 - 검색하면 바로 뜹니다.</h3><br>
				<span style="margin-top: -15px; margin-left: -40px; margin-right: 10px;">
					<i class="fas fa-search" style="font-size: 20px; margin-right: 10px;"></i>
					<input id="txt_name" type="text" style="width: 400px; height: 40px; border: 0px; 
							border: 1px solid rgba(0, 0, 0, .15); font-size: 19px; padding-left: 10px;" 
							placeholder="채용공고 검색">
				</span>
				<span style="margin-top: -15px;">
					<i class="fas fa-map-marker-alt" style="font-size: 22px; margin-right: 10px;"></i>
					<input id="txt_location" type="text" style="width: 400px; height: 40px; border: 0px;
							border: 1px solid rgba(0, 0, 0, .15); font-size: 19px; padding-left: 10px;" 
							placeholder="지역 검색">
				</span>
				<input style="margin-top: -15px; margin-left: 10px; height: 38px; width: 85px; background-color: #0174b0;
						border: 0px; font-size: 18px; color: white;" id="btn_search" type="button" value="검색">
			</div>
		</div>
	</form>
	
	<div class="col-md-12" >
		<!-- height: 160px; -->
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 160px; margin-bottom: 20px;
				text-align: center; border-top: 0px; font-size: 18px; padding-top: 15px; padding-left: 15px;
				overflow:hidden;">
			<strong>채용공고 검색어</strong>
			<span id="alarm_manage" class="button-group-area mt-10" onmouseover="" style="margin-left: 790px; cursor: pointer;
					color: #0174b0; margin-right: 10px;">
				<strong>관리</strong>
			</span>
			<button id="btnslidelt" class="btn btn-default" style="border: 0px;">
				<i class="fas fa-chevron-left" style="font-size: 17px;"></i>
			</button>
			<button id="btnSlidegt" class="btn btn-default" style="border: 0px;">
				<i class="fas fa-chevron-right" style="font-size: 17px;"></i>
			</button><br/>
			
			<c:if test="${saveList == null || saveList.size() == 0 }">
				검색어를 등록해보세요.
			</c:if>
			<div style="text-align: left;">		
				<ul id="content" style="list-style: none; width: 3000px; padding-left: 5px;">			
					<c:forEach items="${saveList }" var="search" varStatus="i">
						<li style="float: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
								margin-right: 10px; padding: 8px; padding-right: 0px; font-size: 16px; height: 66px;">
							<table border="0" class="tb_alarm" style="margin-right: 10px; float: left; margin-left: 10px;">
								<tr>
									<td class="t_alarm${i.index }" onmouseover="" style="cursor: pointer;
											width: 270px;">
										${search.search_word }<br>
										${search.search_local }
									</td>
									<td style="width: 60px; text-align: center;">
										<div style="border: 0px solid; width: 50px; height: 50px; border-radius: 50%;
												background-color: white; padding-top: 2px;" id="div_alarm${i.index }">
											<c:choose>
												<c:when test="${search.search_alarm == 2 }">
													<i id="t_alarm_alarm${i.index }" class="fas fa-bell" onmouseover="" style="
															cursor: pointer; margin-left: 0px; margin-top: 10px; margin-left: 0px; 
															font-size: 22px; color: #0174b0;"></i>
												</c:when>
												<c:otherwise>
													<i id="t_alarm_alarm${i.index }" class="far fa-bell" onmouseover="" style="
															cursor: pointer; margin-left: 0px; margin-top: 10px; margin-left: 0px; 
															font-size: 22px; color: #0174b0;"></i>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</table>
						</div></li>		
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<form id="frm_detail" action="${pageContext.request.contextPath }/recr_detail" method="post">
		<input type="hidden" id="recruit_code" name="recruit_code">	
		
		<div class="col-md-12" >
			<!-- 260px, 525px, 790px -->
			<div id="div_list_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 790px; margin-bottom: 20px;
					text-align: center; padding-top: 20px; font-size: 18px; padding-left: 20px; overflow:hidden;">
				<table>
					<tr>
						<td>
					   		<table style="margin-bottom: 20px;">
					   			<tr>
					   				<td style="width: 800px; text-align: left;">
							   			<strong>조회하신 항목을 참고하여..</strong> <br> 
							   			<c:choose>
							   				<c:when test="${lVRVo.recruit_title.substring(0, 9) == '원하는 채용공고를' }">
									   			<a href="${pageContext.request.contextPath }/recrSearch">
									   				${lVRVo.recruit_title } - ${lVRVo.job_local }
									   			</a>
							   				</c:when>
							   				<c:otherwise>
									   			<a href="${pageContext.request.contextPath }/recr_detail?recruit_code=${lVRVo.recruit_code }">
									   				${lVRVo.recruit_title } - ${lVRVo.job_local }
									   			</a>
							   				</c:otherwise>
							   			</c:choose>
					   				</td>
					   				<td>
										<a id="btn_slt1" class="btn btn-default" style="border: 0px; margin-left: 200px;">
											<i class="fas fa-chevron-left" style="font-size: 17px;"></i>
										</a>
										<a id="btn_sgt1" class="btn btn-default" style="border: 0px;">
											<i class="fas fa-chevron-right" style="font-size: 17px;"></i>
										</a><br/>
					   				</td>
					   			</tr>
					   		</table>
					   		
					   		<!-- rRList1가 있으면 출력. -->
					   		<c:if test="${rRList1.size() >= 1 }">
					   			<ul id="content1" style="list-style: none; width: 3000px; padding-left: 5px;">
								<c:forEach items="${rRList1 }" varStatus="i" var="rRVo">
									<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
											margin-right: 10px; padding: 8px; font-size: 16px; height: 270px;">
										<div id="recr${i.index }" onmouseover="" style="cursor: pointer;">
											<div class="table_div">
												<img src="${corpImgList1.get(i.index) }" width="200">
											</div> <br>
											<strong>${rRVo.recruit_title }</strong> <br>
											${corpNmList1.get(i.index) } <br>
											${rRVo.job_local } <br>
											${rRVo.job_type }
										</div>
										<c:choose>
											<c:when test="${scrapList1.get(i.index) == 'f' }">
												<!-- scrap_flag에 recruit_code를 붙여주자. (예: t12) -->
												<i id="scrap${i.index }" class="far fa-bookmark" onmouseover="" 
														style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br>
											</c:when>
											<c:otherwise>
												<i id="scrap${i.index }" class="fas fa-bookmark" onmouseover="" 
														style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br>
											</c:otherwise>
										</c:choose>
									</div></li>
								</c:forEach>
								</ul>
							</c:if> 
						</td>
					</tr>
					<tr>
						<td>
					   		<table border="0" style="margin-bottom: 20px; margin-top: 30px;">
					   			<tr>
					   				<td style="width: 950px; text-align: left;">
							   			<strong>회원님의 프로필과 커리어 관심분야를 참고함</strong> <br>
										<c:choose>
											<c:when test="${inteVo == null }">
												<a href="${pageContext.request.contextPath }/interest">
													 업무지역 · 업무분야 · 고용형태 · 회사 규모 등 관심 분야 설정
												</a><br>
											</c:when>
											<c:otherwise>
												 ${inteVo.inte_local } · ${inteVo.inte_type } · ${inteVo.inte_emptype } · ${inteVo.inte_size } ... 
												<a href="${pageContext.request.contextPath }/interest">
													 관심 분야 설정
												</a> <br>
											</c:otherwise>
										</c:choose>
					   				</td>
					   				<td>
										<a id="btn_slt2" class="btn btn-default" style="border: 0px; margin-left: 50px;">
											<i class="fas fa-chevron-left" style="font-size: 17px;"></i>
										</a>
										<a id="btn_sgt2" class="btn btn-default" style="border: 0px;">
											<i class="fas fa-chevron-right" style="font-size: 17px;"></i>
										</a><br/>
					   				</td>
					   			</tr>
					   		</table>	
					   		<!-- rRList2가 있으면 출력. -->
					   		<c:if test="${rRList2.size() >= 1 }">
					   			<ul id="content2" style="list-style: none; width: 3000px; padding-left: 5px;">
								<c:forEach items="${rRList2 }" varStatus="i" var="rRVo">
									<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
											margin-right: 10px; padding: 8px; font-size: 16px; height: 270px;">
										<div id="recr${i.index }" onmouseover="" style="cursor: pointer;">
											<div class="table_div">
												<img src="${corpImgList2.get(i.index) }" width="200"> 
											</div> <br>
											<strong>${rRVo.recruit_title }</strong> <br>
											${corpNmList2.get(i.index) } <br>
											${rRVo.job_local } <br>
											${rRVo.job_type }
										</div>
										<c:choose>
											<c:when test="${scrapList2.get(i.index) == 'f' }">
												<!-- scrap_flag에 recruit_code를 붙여주자. (예: t12) -->
												<i id="scrap2${i.index }" class="far fa-bookmark" onmouseover="" 
														style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br>
											</c:when>
											<c:otherwise>
												<i id="scrap2${i.index }" class="fas fa-bookmark" onmouseover="" 
														style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br>
											</c:otherwise>
										</c:choose>
									</div></li>
								</c:forEach>
								</ul>
							</c:if> 					
						</td>
					</tr>
				</table>				
				<br>
				 
			</div>
		</div>
		
	</form>
	

	
	
	<br><br><br><br>
	<br><br><br><br>

	


	
	
<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->	
</div>
</div>	
</div>	

<!-- layout.jsp의 script랑 충돌나서 주석처리함. -->
<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<!-- font awesome icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">

	// 채용공고 검색어 관리
	$(function () {
		$("#alarm_manage").on("click", function(){
	//			console.log(1);
			$("div.modal").modal();
		});
	});

	$(document).ready(function(){
		console.log("list null");
		
		
		// 추천 리스트 whitebox height 조절.
		<c:choose>
			<c:when test="${rRList1.size() == 0 && rRList2.size() == 0 }">
				$("#div_list_box").css("height", "260px");
			</c:when>
			<c:when test="${rRList1.size() == 0 || rRList2.size() == 0 }">
				$("#div_list_box").css("height", "525px");
			</c:when>
		</c:choose>
		
		// 검색어 슬라이드.
		var divWidth  = "511"; 
		
		$("#btnslidelt").on("click",function(){
			$("#content").stop(true,true);
			   var moveX   = parseInt($("#content").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content").animate({"margin-left":"+=" + divWidth + "px"},500);
			   }
		});
	
		$("#btnSlidegt").on("click",function(){
			 $("#content").stop(true,true);
			   var moveX   = parseInt($("#content").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content").animate({"margin-left":"-=" + divWidth + "px"},500);
			   }
		});		
		
		// 추천리스트1 슬라이드.
		$("#btn_slt1").on("click",function(){
			$("#content1").stop(true,true);
			   var moveX   = parseInt($("#content1").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content1").animate({"margin-left":"+=" + divWidth + "px"},340);
			   }
		});
	
		$("#btn_sgt1").on("click",function(){
			 $("#content1").stop(true,true);
			   var moveX   = parseInt($("#content1").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content1").animate({"margin-left":"-=" + divWidth + "px"},340);
			   }
		});				
		
		// 추천리스트2 슬라이드.
		$("#btn_slt2").on("click",function(){
			$("#content2").stop(true,true);
			   var moveX   = parseInt($("#content2").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content2").animate({"margin-left":"+=" + divWidth + "px"},340);
			   }
		});
	
		$("#btn_sgt2").on("click",function(){
			 $("#content2").stop(true,true);
			   var moveX   = parseInt($("#content2").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content2").animate({"margin-left":"-=" + divWidth + "px"},340);
			   }
		});				
				
				
		// msg 출력.
		var msg_flag = "${msg_flag }";
		console.log("msg_flag? : " + msg_flag);
		
		var msg = "일반회원으로 로그인 후 이용해주세요.";

		if(msg_flag == 't'){
			alert(msg);
			
			<c:set var="msg_flag" value="t"></c:set>
		}
			
		// 채용공고 검색
		$("#btn_search").on("click", function(){
// 			alert($("#txt_name").val() + " / " + $("#txt_location").val());
			
			// hidden에 값 넣어주기.
			$("#search_word").val($("#txt_name").val());
			$("#search_local").val($("#txt_location").val());
			
			$("#frm_search").submit();
		});			

		// 채용공고 검색어 (저장한 검색어)
		<c:forEach items="${saveList }" varStatus="i">
			$(".t_alarm${i.index }").on("click", function(){
				// 여기서도 /recrSearch로 파라미터를 넘기지 말고 검색어를 등록하면 됨. - 
				// /insertSLog
				window.location.href = '${pageContext.request.contextPath }/insertSLog?search_word=${saveList.get(i.index).search_word }&search_local=${saveList.get(i.index).search_local }';
			});
			
			$("#t_alarm_alarm${i.index }").on("click", function(){
				// ajax로 처리해야됨.
				
				// 저장한 검색어에서 제외. 확인창 띄우기 X -> 알림 켜고 끄기.
				if("${saveList.get(i.index).search_alarm }" == 2){
					if(confirm("채용공고 알림을 끄시겠습니까?")) {
						// alarm_flag를 우선 save_flag로 변경. 저장되어있는 항목은 flag 't'를 보낸다.
						// 컨트롤러에서 't'를 받으면 search_save를 '1'로 변경(저장을 해제).
// 						window.location.href = 'http://localhost${pageContext.request.contextPath }/updateSave?save_flag=t&search_code=${saveList.get(i.index).search_code }';					

						window.location.href = 'http://localhost${pageContext.request.contextPath }/updateAlarm?search_alarm=${saveList.get(i.index).search_alarm }&search_code=${saveList.get(i.index).search_code }';					
					}					
				}else{
					if(confirm("채용공고 알림을 받으시겠습니까?")) {
						window.location.href = 'http://localhost${pageContext.request.contextPath }/updateAlarm?search_alarm=${saveList.get(i.index).search_alarm }&search_code=${saveList.get(i.index).search_code }';					
					}					
				}
			});
			
			// 알림 버튼 마우스오버
			$("#t_alarm_alarm${i.index }").on("mouseover", function(){
				$("#div_alarm${i.index }").css("background-color", "#e5f5fb");
			});
			$("#t_alarm_alarm${i.index }").on("mouseout", function(){
				$("#div_alarm${i.index }").css("background-color", "white");
			});			
		</c:forEach>
		
		// 채용공고 리스트
		
		// 지금은 12개인데...
		<c:forEach items="${rRList1 }" varStatus="i">
			$("#recr${i.index }").on("click", function(){
// 				alert("${i.index }"); // 첫번째 채용공고 : i.index-1 -> '0'
				
				$("#recruit_code").val(${rRList1.get(i.index).recruit_code});
				
				$("#frm_detail").submit();
			});
			
			$("#scrap${i.index }").on("click", function(){
				<c:choose>
					<c:when test="${scrapList1.get(i.index) == 'f' }">
						if(confirm("채용공고를 스크랩하시겠습니까?")){
							window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=t${rRList1.get(i.index).recruit_code }';
						}
					</c:when>
					<c:otherwise>
						if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
							window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=f${rRList1.get(i.index).recruit_code }';
						}
					</c:otherwise>
				</c:choose>
			});
			
		</c:forEach>
		
		<c:forEach items="${rRList2 }" varStatus="i">
			$("#recr2${i.index }").on("click", function(){
// 				alert("${i.index }"); // 첫번째 채용공고 : i.index-1 -> '0'
				
				$("#recruit_code").val(${rRList2.get(i.index).recruit_code});
				
				$("#frm_detail").submit();
			});
			
			$("#scrap2${i.index }").on("click", function(){
				<c:choose>
					<c:when test="${scrapList2.get(i.index) == 'f' }">
						if(confirm("채용공고를 스크랩하시겠습니까?")){
							window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=t${rRList2.get(i.index).recruit_code }';
						}
					</c:when>
					<c:otherwise>
						if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
							window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=f${rRList2.get(i.index).recruit_code }';
						}
					</c:otherwise>
				</c:choose>
			});
			
		</c:forEach>
		
		var test_str = "";
		
		// 모달창 버튼
		$("#btn_save").on("click", function(){
// 			alert("save");
			test_str = 'save';
		});
		$("#btn_cancel").on("click", function(){
			test_str = 'cancel';
		});
		
		// 모달창 div
		$("#div_save").on("mouseover", function(){
			$("#lb_save").css("color", "#0174b0");
			$("#lb_save").css("border-bottom", "2px solid");
			$("#lb_save").css("border-bottom-color", "#0174b0");
		});
		$("#div_save").on("mouseout", function(){
			$("#lb_save").css("color", "black");
			$("#lb_save").css("border-bottom", "0px solid");
		});
		$("#div_search").on("mouseover", function(){
			$("#lb_search").css("color", "#0174b0");
			$("#lb_search").css("border-bottom", "2px solid");
			$("#lb_search").css("border-bottom-color", "#0174b0");
		});
		$("#div_search").on("mouseout", function(){
			$("#lb_search").css("color", "black");
			$("#lb_search").css("border-bottom", "0px solid");
		});
		
		// 모달창 save, search 마우스오버
		var idx = 0;
		
		$(".save_alarm").on("mouseover", function(){
			idx = $(".save_alarm").index(this);
			$(".save_alarm:eq("+idx+")").css("background-color", "#f3f3f3");
// 			alert($(this).data("idx"));
		});
		$(".save_alarm").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		$(".save_save").on("mouseover", function(){
			$(this).css("background-color", "#f3f3f3");
		});
		$(".save_save").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		$(".search_alarm").on("mouseover", function(){
			$(this).css("background-color", "#f3f3f3");
		});
		$(".search_alarm").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		$(".search_save").on("mouseover", function(){
			$(this).css("background-color", "#f3f3f3");
		});
		$(".search_save").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		
		// 모달창 save 클릭
		$(".save_alarm").on("click", function(){
// 			console.log($(this).text());
			// 저장을 안했을때는 알림을 켤 수 없음.
			if($(".save_save:eq("+ (($(this).data("idx"))-1) +")").text() == '저장하기'){
				alert("먼저 검색어 저장을 해야합니다.");
				return;
			}
			
			if( (($(this).text()).split("알림 ")[1]).startsWith("켜기")){
				$(this).html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
			}else{
				$(this).html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
			}
		});
		$(".save_save").on("click", function(){
// 			alert($(this).data("idx"));
			if($(this).text() == '저장하기'){
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소');
				
				// 저장 취소를 하면 알림도 꺼지고 저장을 하면 알림도 자동으로 설정됨.
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
			}else{
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: black;"></i>저장하기');
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
			}
			
		});
		
		// 모달창 search 클릭
		$(".search_alarm").on("click", function(){
			// 삭제한 검색어는 저장할 수 없음.
			if($(".search_save:eq("+ (($(this).data("idx"))-1) +")").text() == '삭제 취소'){
				alert("삭제한 데이터는 저장할 수 없습니다.");
				return;
			}
			
			if( (($(this).text()).split("저장")[1]).startsWith("하기")){
				$(this).html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
			}else{
				$(this).html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
			}
		});
		$(".search_save").on("click", function(){
			if($(this).text() == '저장하기'){
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소');
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
			}else{
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: black;"></i>저장하기');
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
			}
			
		});
		
	});

</script>	
	
</body>
</html>






