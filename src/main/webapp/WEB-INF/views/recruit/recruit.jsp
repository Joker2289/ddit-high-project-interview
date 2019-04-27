<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<link href="/css/recruit/recruit.css" type="text/css" rel="stylesheet">
	<title>채용공고｜22222</title>
	
	<style type="text/css">
		/* newList */
		
		.fa-circle{
			margin-right: 4px;
			cursor: pointer;
		}
		
		/* newList */
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
						color: #0174b0;" id="btn_write">
					<i class="fas fa-edit" style="color: #0174b0;"></i>
					채용공고 올리기
				</a>
			</span>		
		</div>
	</div>
	
	<div class="col-md-12" >	<!-- 연한 파랑 기존 색 - #edf1f5, 진한 색 - #adbfd2 -->
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 20px;
				text-align: center; padding-top: 10px; background-color: #edf1f5; font-size: 22px;">
			<a href="${pageContext.request.contextPath }/map" style="">
				<img width="37" src="http://mblogthumb4.phinf.naver.net/20160920_175/kokoa2100_1474368430239vv9yY_PNG/mzl.xnmoezsr.png?type=w800">   	
				 지도에서 검색 - 한 눈에 확인하는 채용공고.
			</a>
		</div>
	</div>
	
	<!-- newList -->
	<div class="col-md-12" >
		<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 10px; height: 370px; margin-bottom: 20px;
				text-align: center; padding-top: 10px; font-size: 22px;">
			<div style="text-align: left; padding-left: 15px; padding-bottom: 7px;">
				신규 채용공고
			</div>
			<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;">
		   		<c:if test="${newList.size() >= 1 }">
		   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
		   					margin-left: -290px;">
					<c:forEach items="${newList }" varStatus="i" var="rRVo">
						<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
								margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
							<div id="recr2${i.index }" onmouseover="" style="cursor: pointer; height: 215px;
									border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
								<div class="table_div" style="margin-left: 24px;">
									<img src="${newImgList.get(i.index) }" width="200"> 
								</div> <br><br>
								<strong>
									<c:choose>
										<c:when test="${rRVo.recruit_title.length() > 18 }">
											${rRVo.recruit_title.substring(0, 18) }...
										</c:when>
										<c:otherwise>
											${rRVo.recruit_title }
										</c:otherwise>
									</c:choose>
								</strong> <br>
								${newNmList.get(i.index) } <br>
								${rRVo.job_local } <br>
								${rRVo.job_type }
							</div>
							<div style="padding-top: 10px;">
								${newTimeList.get(i.index) } 전
							</div>
						</div></li>
					</c:forEach>
					</ul>
				</c:if>
			</div>
			<div style="text-align: center; font-size: 13px; padding-top: 15px;">
				<i onmouseover="" class="fas fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i>				
			</div>
		</div>
	</div>
	<!-- newList -->
	
	<div class="col-md-12" >
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: -1px;
				text-align: center; padding-top: 12px; font-size: 21px; background-color: #edf1f5;">
			<img width="35" src="https://lh3.googleusercontent.com/sMhe3GxpmWD6NISZBzhy--dtwcAcVvLFDxOGe1Kat3d0YA0nhq9ICwTSFN3UQ7uEZA">
			 &nbsp;뉴스로 IT 업계 동향을 확인해보세요.
		</div>
	</div>
	
	<div class="col-md-12" style="z-index: 2;">
		<div id="div_news" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 25px;
				text-align: center; padding-top: 12px; font-size: 21px; overflow: hidden;">
			<ul id="content_news" style="list-style: none; width: auto; padding-left: 5px; text-align: center; 
					padding-top: 2px; margin-top: -62px;">			
				<c:forEach begin="1" end="${titleList.size() }" varStatus="i">
					<li style="margin-bottom: 32px;">			
		 				<a href="${linkList.get(i.index - 1) }">${titleList.get(i.index - 1) }</a><br>
		 			</li>
				</c:forEach>
		 	</ul>
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
			<div id="alarm_manage" class="button-group-area mt-10" onmouseover="" style="margin-left: 790px; cursor: pointer;
					color: #0174b0; margin-right: 10px; display: inline; text-align: center;">
				<strong>관리</strong>
			</div>
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
		<input type="hidden" id="req_page" name="req_page">	
		
		<div class="col-md-12" >
			<!-- 260px, 525px, 790px -->
			<div id="div_list_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 790px; margin-bottom: 80px;
					text-align: center; padding-top: 20px; font-size: 18px; padding-left: 20px; overflow:hidden;">
				<table>
					<tr>
						<td id="">
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
					   		
					   		<!-- rRList1가 있으면 출력. -> rRList1AjaxHtml -->
							<div id="div_rRList1">
							</div>
							
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
											margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
										<div id="recr2${i.index }" onmouseover="" style="cursor: pointer; height: 215px;
												border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
											<div class="table_div" style="margin-left: 24px;">
												<img src="${corpImgList2.get(i.index) }" width="200"> 
											</div> <br><br>
											<strong>
												<c:choose>
													<c:when test="${rRVo.recruit_title.length() > 18 }">
														${rRVo.recruit_title.substring(0, 18) }...
													</c:when>
													<c:otherwise>
														${rRVo.recruit_title }
													</c:otherwise>
												</c:choose>
											</strong> <br>
											${corpNmList2.get(i.index) } <br>
											${rRVo.job_local } <br>
											${rRVo.job_type }
										</div>
										<c:choose>
											<c:when test="${scrapList2.get(i.index) == 'f' }">
												<!-- scrap_flag에 recruit_code를 붙여주자. (예: t12) -->
												${timeList2.get(i.index) } 전 · 
												<i id="scrap2${i.index }" class="far fa-bookmark" onmouseover="" 
														style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br>
											</c:when>
											<c:otherwise>
												${timeList2.get(i.index) } 전 · 
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
	
<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->	
</div>
</div>	
</div>	

<!-- layout.jsp의 script랑 충돌나서 지움. -->
<script type="text/javascript">

	// 채용공고 검색어 관리
	$(function () {
		$("#alarm_manage").on("click", function(){
	//			console.log(1);
			$("div.modal").modal();
		});
	});

	// 얘는 전역으로.
	var slide_switch = 0;
	
	// div_news 마우스오버 시 false - 슬라이드 멈춤.
	var slide_flag = true;
	
	var list1_size = '';

	
	////////////////////////////newList
	
	// div_newList 마우스오버 시 false - 슬라이드 멈춤.
	var newSlide_flag = true;	
	
	// 자동 슬라이드
	var newSlide_width = 290;
	var newList_num = 1;
	
	function fn_newSlide(){
		if(newSlide_flag == false){
			return;
		}
		
		if(newList_num > 6){
// 			clearInterval(slide_switch);
			$("#content_newList").css("margin-left", "0px");
			newList_num = 0;
		}
		
		newList_num++;
		
		$("#content_newList").stop(true, true);
		var moveX = parseInt($("#content_newList").css("margin-left"));
		
		if( moveX > -2000 ){
			// 버튼 class 바꾸기.
			if(newList_num == 1){
				$(".fa-circle:eq(6)").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}else{
				$(".fa-circle:eq("+ (newList_num-2) +")").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}
			
			$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
		}
	}	
	
	//////////////////////////// newList
	
	
	$(document).ready(function(){
// 		console.log('lVRVo? : ${lVRVo.recruit_title }');
		
		
		//////////////////////////// newList
		// newList 슬라이드
		newList_slide = setInterval("fn_newSlide()", 4000);
		
		// newList 마우스오버 - 슬라이드 멈춤.
		$("#div_newList").on("mouseover", function(){
			newSlide_flag = false;
		});
		$("#div_newList").on("mouseout", function(){
			newSlide_flag = true;
		});		
		
		// newList 슬라이드 버튼 클릭.
		$(".fa-circle").on("click", function(){
// 			alert($(this).index());
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "far fa-circle");
			$(this).attr("class", "fas fa-circle");	
			
			// 이동할 칸 수. (move_page)
			var move_page = ($(this).index()) - (newList_num-1);
			
			// newList_num 변경.
			newList_num = ($(this).index())+1;
			
			// 슬라이드 이동.
			$("#content_newList").stop(true, true);
			var moveX = parseInt($("#content_newList").css("margin-left"));
			
			if( moveX > -3000 ){
				$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
			}
		});
		
		//////////////////////////// newList
		
		
		// news 슬라이드 실행.
		slide_switch = setInterval("fn_slide()", 4000);
		
		// news 마우스오버 - 슬라이드 멈춤.
		$("#div_news").on("mouseover", function(){
			slide_flag = false;
		});
		$("#div_news").on("mouseout", function(){
			slide_flag = true;
		});

		// rRList1 ajax 요청.
		getRRList1Html(null, "rRList1Ajax");
		
		// 버튼 마우스오버
		$("#btn_write").on("mouseover", function(){
			$("#btn_write").css("background-color", "#e5f5fc");
		});
		$("#btn_write").on("mouseout", function(){
			$("#btn_write").css("background-color", "white");
		});
		$("#btn_search").on("mouseover", function(){
			$("#btn_search").css("background-color", "#01537f");
		});
		$("#btn_search").on("mouseout", function(){
			$("#btn_search").css("background-color", "#026397");
		});
		
		// 추천 리스트 whitebox height 조절.
		if(list1_size == 0 && "${rRList2.size() }" == 0){
			$("#div_list_box").css("height", "260px");
		}else if($("#hidden_size").val() == 0 || "${rRList2.size() }" == 0){
			$("#div_list_box").css("height", "525px");
		}
// 		console.log("size2? : " + "${rRList2.size() }");
		
		// 검색어 슬라이드.
		var divWidth  = "511"; 
		
		$("#btnslidelt").on("click", function(){
			$("#content").stop(true, true);
			   var moveX   = parseInt($("#content").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content").animate({"margin-left":"+=" + divWidth + "px"},500);
			   }
		});
		$("#btnSlidegt").on("click", function(){
			 $("#content").stop(true, true);
			   var moveX   = parseInt($("#content").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content").animate({"margin-left":"-=" + divWidth + "px"},500);
			   }
		});		
		
		// 추천리스트1 슬라이드.
		$("#btn_slt1").on("click", function(){
			$("#content1").stop(true, true);
			   var moveX   = parseInt($("#content1").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content1").animate({"margin-left":"+=" + divWidth + "px"},340);
			   }
		});
		$("#btn_sgt1").on("click", function(){
			 $("#content1").stop(true, true);
			   var moveX   = parseInt($("#content1").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content1").animate({"margin-left":"-=" + divWidth + "px"},340);
			   }
		});				
		
		// 추천리스트2 슬라이드.
		$("#btn_slt2").on("click", function(){
			$("#content2").stop(true, true);
			   var moveX   = parseInt($("#content2").css("margin-left"));
		
			   if( moveX < 0 ){
					$("#content2").animate({"margin-left":"+=" + divWidth + "px"},340);
			   }
		});	
		$("#btn_sgt2").on("click", function(){
			 $("#content2").stop(true, true);
			   var moveX   = parseInt($("#content2").css("margin-left"));
		
			   if( -1022 < moveX ){
			   		 $("#content2").animate({"margin-left":"-=" + divWidth + "px"},340);
			   }
		});				
				
		// msg 출력.
		var msg_flag = "${msg_flag }";
// 		console.log("msg_flag? : " + msg_flag);
		if(msg_flag == 't'){
			alert("일반회원으로 로그인 후 이용해주세요.");
			
			<c:set var="msg_flag" value="f"></c:set>
		}else if(msg_flag == 't2'){
			alert("채용공고가 정상적으로 등록되었습니다.");
			
			<c:set var="msg_flag" value="f"></c:set>
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
		<c:forEach items="${rRList2 }" varStatus="i">
			$("#recr2${i.index }").on("click", function(){
// 				alert("${i.index }"); // 첫번째 채용공고 : i.index-1 -> '0'
				$("#recruit_code").val(${rRList2.get(i.index).recruit_code});
				
				// 상세화면에서 뒤로가기 페이지 구분을 위한 req_page.
				$("#req_page").val("recruit");
				
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
		
		var arr_save = new Array();
		var arr_search = new Array();
		var result_save = "";
		var result_search = "";
		var result = "";
		
		// 모달창 버튼
		$("#btn_save").on("click", function(){
			result_save = '';
			result_search = '';
			result = '';
			
			// 수정을 안했을 경우 컨트롤러에서 로직을 건너뛸 수 있게 설정. 'xxx/xxx/xxx::'
			if(arr_save.length == 0){
				result_save = 'xxx/xxx/xxx::';
			}else{
				for(var i=0; i < arr_save.length; i++){
	// 				alert( $(".save_alarm:eq("+i+")").data("code")+"/"+$(".save_alarm:eq("+i+")").data("alarm")+"/"+$(".save_save:eq("+i+")").data("save") );
					result_save += $(".save_alarm:eq("+(arr_save[i]-1)+")").data("code")+"/"+$(".save_alarm:eq("+(arr_save[i]-1)+")").data("alarm")+"/"+$(".save_save:eq("+(arr_save[i]-1)+")").data("save")+"::"		
				}
			}
			
			if(arr_search.length == 0){
				result_search = 'xxx/xxx/xxx::';
			}else{
				for(var i=0; i < arr_search.length; i++){
					result_search += $(".search_save:eq("+(arr_search[i]-1)+")").data("code")+"/"+$(".search_save:eq("+(arr_search[i]-1)+")").data("save")+"/"+$(".search_del:eq("+(arr_search[i]-1)+")").data("del")+"::"		
				}
			}
			
// 			alert("result : " + result_save + "???" + result_search);
			result = result_save + "???" + result_search;
			
			// 수정할 result 문자열 만들기
			// 저장한 검색어???최근 검색어
			// 저장1::저장2::...???최근1::최근2::...
			// search_code/search_save/search_alarm::...???search_code/search_save/delete::...
			$("#result").val(result);
			$("#frm").submit();			
		});
		$("#btn_cancel").on("click", function(){
// 			alert($(".save_alarm:eq(0)").data("code"));
			if(confirm("저장하지 않고 나가시겠습니까?")){
				$("#btn_cancel_hidden").trigger("click");
			}
		});
		
		// arr_save/search에 해당 search_code가 있는지 확인하고 추가하는 메서드.
		// 구분 division(div): 'save'-저장한 검색어, 'search'-최근 검색어
		function checkAdd(div, idx){
			if(div == 'save'){
				var add_flag = true;
				
				for(var i=0; i < arr_save.length; i++){
					if(arr_save[i] == idx){
						add_flag = false;						
						break;
					}
				}
				
				if(add_flag){
					arr_save[arr_save.length] = idx;
				}
			}else{
				var add_flag = true;
				
				for(var i=0; i < arr_search.length; i++){
					if(arr_search[i] == idx){
						add_flag = false;						
						break;
					}
				}
				
				if(add_flag){
					arr_search[arr_search.length] = idx;
				}
			}		
		}
		
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
		$(".search_save").on("mouseover", function(){
			$(this).css("background-color", "#f3f3f3");
		});
		$(".search_save").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		$(".search_del").on("mouseover", function(){
			$(this).css("background-color", "#f3f3f3");
		});
		$(".search_del").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		
		// 모달창 save 클릭
		$(".save_alarm").on("click", function(){
// 			alert($(this).data("alarm"));
			// 저장을 안했을때는 알림을 켤 수 없음.
			if($(".save_save:eq("+ (($(this).data("idx"))-1) +")").text() == '저장하기'){
				alert("먼저 검색어 저장을 해야합니다.");
				return;
			}
			
			if( (($(this).text()).split("알림 ")[1]).startsWith("켜기")){
// 				alert($(this).data("code") + "번 알림 켬");
				$(this).html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
				$(this).data("alarm", "2");
				checkAdd("save", $(this).data("idx"));
			}else{
// 				alert($(this).data("code") + "번 알림 끔");
				$(this).html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
				$(this).data("alarm", "1");
				checkAdd("save", $(this).data("idx"));
			}
		});
		$(".save_save").on("click", function(){
// 			alert($(this).data("idx"));
			if($(this).text() == '저장하기'){
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소');
				$(this).data("save", "2");
				
				// 저장 취소를 하면 알림도 꺼지고 저장을 하면 알림도 자동으로 설정됨.
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기');
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").data("alarm", "2");
				checkAdd("save", $(this).data("idx"));
			}else{
				$(this).html('<i class="far fa-save" style="margin-right: 5px; color: black;"></i>저장하기');
				$(this).data("save", "1");
				
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").html('<i class="far fa-bell" style="margin-right: 5px; color: black;"></i>알림 켜기');
				$(".save_alarm:eq("+ (($(this).data("idx"))-1) +")").data("alarm", "1");
				checkAdd("save", $(this).data("idx"));
			}
		});
		
		// 모달창 search 클릭
		$(".search_save").on("click", function(){
// 			alert(arr_search.length);
			// 삭제한 검색어는 저장할 수 없음.
			if($(".search_del:eq("+ (($(this).data("idx"))-1) +")").text() == '삭제 취소'){
				alert("삭제한 검색어는 저장할 수 없습니다.");
				return;
			}
			
			if( (($(this).text()).split("저장")[1]).startsWith("하기")){
				$(this).html('<i class="fas fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소');
				$(this).data("save", "2");
				checkAdd("search", $(this).data("idx"));
			}else{
				$(this).html('<i class="far fa-save" style="margin-right: 5px;"></i>저장하기');
				$(this).data("save", "1");
				checkAdd("search", $(this).data("idx"));
			}
		});
		$(".search_del").on("click", function(){
			if($(this).text() == '삭제 취소'){
				$(this).html('<i class="far fa-times-circle" style="margin-right: 5px;"></i>기록 삭제');
				$(this).data("del", "1");
				checkAdd("search", $(this).data("idx"));
			}else{
				$(this).html('<i class="far fa-times-circle" style="margin-right: 5px; color: red;"></i>삭제 취소');
				$(this).data("del", "2");
				
				$(".search_save:eq("+ (($(this).data("idx"))-1) +")").html('<i class="far fa-save" style="margin-right: 5px;"></i>저장하기');
				$(".search_save:eq("+ (($(this).data("idx"))-1) +")").data("save", "1");
				checkAdd("search", $(this).data("idx"));
			}
		});
		
	});
	
	// rRList1 ajax 요청 메서드.
	function getRRList1Html(scrap_flag, req_page){
		$.ajax({
			// 먼저 /scrap으로 보내고 'redirect'.			
			url : "${pageContext.request.contextPath }/scrap",
			data : "scrap_flag=" + scrap_flag +"&req_page=" + req_page,
			success : function(data){
				// rRList1 size값 넣기
				list1_size = $("#hidden_size").val();
				
				// rRList1 출력.
				$("#div_rRList1").html(data);
				
				// 클릭 이벤트.
				$(".recr").on("click", function(){
					$("#recruit_code").val($(this).data("code"));
					
					// 상세화면에서 뒤로가기 페이지 구분을 위한 req_page.
					$("#req_page").val("recruit");					
					
					$("#frm_detail").submit();					
				});

				// class가 아이콘 모양을 나타내기 때문에.. div 추가.
				$(".scrap").on("click", function(){
					if($(this).data("scrap") == 'f'){
						if(confirm("채용공고를 스크랩하시겠습니까?")){
							// 여기도 ajax로 수정해야됨.
							var scrap_flag = "t"+$(this).data("code");
							var req_page = "rRList1Ajax";
							
							getRRList1Html(scrap_flag, req_page);							
						}
					}else{
						if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
							var scrap_flag = "f"+$(this).data("code");
							var req_page = "rRList1Ajax";
							
							getRRList1Html(scrap_flag, req_page);							
						}
					}					
				});
			}
		});			
	}
	
	// 자동 슬라이드
	var news_width = 62;
	var limit_num = 1;
	
	function fn_slide(){
		if(slide_flag == false){
			return;
		}
		
		if(limit_num > 4){
// 			clearInterval(slide_switch);
			$("#content_news").css("margin-top", "0px");
			limit_num = 0;
		}
		
		limit_num++;
		
		$("#content_news").stop(true, true);
		var moveX = parseInt($("#content_news").css("margin-top"));
		
		if( moveX > -500 ){
			$("#content_news").animate({"margin-top":"-=" + news_width + "px"}, 500);
		}
	}

</script>	
	
</body>
</html>






