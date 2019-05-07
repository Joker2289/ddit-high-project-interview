<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜111</title>
	
	<style type="text/css">
		.div_btn{
			border: 0px solid; 
			width: 50px; 
			height: 50px; 
			float: right;
			padding-top: 10px;
			padding-right: 14px;
			border-radius: 25px;
		}
	</style>	
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
									<div style="position: relative; top: 40px; left: 25px; background-color: white;
											width: 175px;">
										<a href="/corp/corporation?corp_id=${corp.corp_id }">
											<c:choose>
												<c:when test="${ fn:contains(corp.logo_path, 'http') }">
													<img src="${corp.logo_path }" width="175" style="border: 1px solid;
															border-color: #a6a6a6; border-radius: 0px; border-bottom-width: 2px;
															padding: 10px;">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${corp.corp_id }&division=pf" 
															width="175" style="border: 1px solid; border-color: #a6a6a6; border-radius: 0px; 
															border-bottom-width: 2px; padding: 10px;">
												</c:otherwise>	
											</c:choose>													
										</a>			
									</div>
								</td>
							</tr>
							<tr style="height: 40px;">
								<td style="text-align: right; padding-top: 20px;">
									<c:choose>
										<c:when test="${scrap_flag == 't' }">
											<div class="div_btn" style="padding-top: 11px; margin-right: 46px;
													margin-left: 2px; padding-right: 15px;" id="div_scrap">
												<i class="fas fa-bookmark" style="color: #0174b0; font-size: 24px;
														cursor: pointer;" onmouseover="" id="btn_scrap"></i> 
											</div>
										</c:when>
										<c:otherwise>
											<div class="div_btn" style="padding-top: 11px; margin-right: 46px;
													margin-left: 2px; padding-right: 15px;" id="div_scrap">
												<i class="far fa-bookmark" style="color: #0174b0; font-size: 24px;
														cursor: pointer;" onmouseover="" id="btn_scrap"></i> 
											</div>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${report_flag == 't' }">
											<div class="div_btn" style="padding-right: 24px;" id="div_report">
												<i class="fas fa-flag" style="color: #0174b0; font-size: 24px;
														margin-left: 14px; margin-right: 10px; cursor: pointer;"
														onmouseover="" id="btn_report"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="div_btn" style="padding-right: 24px;" id="div_report">
												<i class="far fa-flag" style="color: #0174b0; font-size: 24px;
														margin-left: 14px; margin-right: 10px; cursor: pointer;"
														onmouseover="" id="btn_report"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" style="width: 795px;">
										<tr>
											<td style="width: 600px; padding-left: 20px; font-size: 17px;">
												<strong style="font-size: 22px;">${recr.recruit_title }</strong><br>
												<span>${corp.corp_name } ｜ ${recr.job_local }</span><br>
												<span style="color: #2f7b15;">
													<i class="far fa-clock"></i> ${time_value } 전
												</span> ｜ 
													<c:choose>
														<c:when test="${mem_id == corp.corp_id && recr.app_count < 10 }">
															<span id="btn_applyUser" onmouseover="" style="color: #0174b0;
																	cursor: pointer;">
																<i class="fas fa-user-alt"></i> 지원자 수: 10 명 미만
															</span>
														</c:when>
														<c:when test="${mem_id == corp.corp_id }">
															<span id="btn_applyUser" onmouseover="" style="color: #0174b0;
																	cursor: pointer;">
																<i class="fas fa-user-alt"></i> 지원자 수: ${recr.app_count } 명
															</span>
														</c:when>
														<c:when test="${recr.app_count < 10 }">
															<span style="color: #0174b0;">
																<i class="fas fa-user-alt"></i> 지원자 수: 10 명 미만
															</span>
														</c:when>
														<c:otherwise>
															<span style="color: #0174b0;">
																<i class="fas fa-user-alt"></i> 지원자 수: ${recr.app_count } 명
															</span>
														</c:otherwise>
													</c:choose>
												<br>
											</td>
											<td>
												<c:choose>
													<c:when test="${recr_app == 't' }">
														<input type="button" value="지원 취소" style="border: 0px;
																width: auto; background-color: #0174b0; font-size: 18px; height: 38px;
																color: white; font-weight: bold; margin-top: 15px; padding-left: 10px;
																padding-right: 10px; margin-left: 47px;" id="btn_app">
													</c:when>
													<c:otherwise>
														<input type="button" value="지원하기" style="border: 0px;
																width: auto; background-color: white; font-size: 18px; height: 38px;
																color: #0174b0; font-weight: bold; margin-top: 15px; padding-left: 10px;
																padding-right: 10px; border: 1px solid; border-color: #0174b0;
																margin-left: 47px;" id="btn_app">
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
												${recr.job_rank }<br><br>
												<strong>업계</strong><br>
												${corp.industry_type }<br><br>
												<strong>고용형태</strong><br>
												${recr.emp_type }<br>
											</td>
										</tr>
									</table>								
								</td>
							</tr>
						</table>
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
				<!-- newList -->
				<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 0px; height: 370px; margin-bottom: 20px;
						text-align: center; padding-top: 10px; font-size: 22px;">
					<div style="text-align: left; padding-left: 15px; padding-bottom: 7px; font-weight: bold; color: #0073b1;">
						<i class="fas fa-check" style="margin-right: 15px;"></i>신규 채용공고
					</div>
					<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;">
				   		<c:if test="${newList.size() >= 1 }">
				   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
				   					margin-left: -290px;">
							<c:forEach items="${newList }" varStatus="i" var="rRVo">
								<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
										margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
									<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
											border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
											data-code="${rRVo.recruit_code }">
										<div class="table_div" style="margin-left: 24px;">
											<c:choose>
												<c:when test="${ fn:contains(newImgList.get(i.index), 'http') }">
													<img src="${newImgList.get(i.index) }" width="200"> 
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${newIdList.get(i.index) }&division=pf" width="200">
												</c:otherwise>	
											</c:choose>												
										</div> <br>
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
									<div style="padding-top: 10px; color: #2f7b15;">
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
				<!-- newList -->
				</div>			
			</td>
		</tr>
	</table>

	<br><br>
		
<%@ include file="/WEB-INF/views/recruit/report_modal.jsp" %> <!-- 신고 modal -->		
</div>		
</div>		
</div>		
		
<script type="text/javascript">
// 채용공고 신고 modal
$(function () {
	$("#btn_report").on("click", function(){
		if('${report_flag }' == 't'){
			alert("이미 신고처리 되었습니다.");
		}else{
			$("div.modal").modal();
		}
	});
});

$(document).ready(function(){
// 	console.log("req_page? : ${req_page }");
	
	// 채용공고 지원자 클릭.
	$("#btn_applyUser").on("click", function(){
		window.location.href = '${pageContext.request.contextPath }/applyUser?recruit_code=${recr.recruit_code }';
	});
	
	// msg 출력.
	var msg_flag = "${msg_flag }";
	
	if(msg_flag == 't'){
		alert("정상적으로 신고접수 되었습니다.");
		
		<c:set var="msg_flag" value="f"></c:set>
	}
	
	// modal 전송
	$("#btn_save").on("click", function(){
// 		alert("${recr.recruit_code }");
		$("#report_contents").val($("#txt_report").val());
		$("#recruit_code").val("${recr.recruit_code }");
		$("#req_page").val("${req_page }");
		$("#frm").submit();
	});
	
	// modal 취소
	$("#btn_cancel").on("click", function(){
		$("#btn_cancel_hidden").trigger("click");
	});	
	
	// 신고 버튼
	$("#btn_report").on("mouseover", function(){
		$("#div_report").css("background-color", "#e5f5fb");
	});
	$("#btn_report").on("mouseout", function(){
		$("#div_report").css("background-color", "white");
	});
	
	// 스크랩 버튼
	$("#btn_scrap").on("click", function(){
		if('${scrap_flag }' == 'f'){
			if(confirm("채용공고를 스크랩하시겠습니까?")){
				window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=t${recr.recruit_code }&req_page=recr_detail';
			}
		}else{
			if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
				window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=f${recr.recruit_code }&req_page=recr_detail';
			}
		}
	});
	$("#btn_scrap").on("mouseover", function(){
		$("#div_scrap").css("background-color", "#e5f5fb");
	});
	$("#btn_scrap").on("mouseout", function(){
		$("#div_scrap").css("background-color", "white");
	});
	
	$("#div_back").on("click", function(){
// 		alert("req page? : ${req_page }");
		<c:choose>
			<c:when test="${req_page == null }">
				window.location.href = '${pageContext.request.contextPath }/srecr';
			</c:when>
			<c:when test="${req_page == 'recruit' }">
				window.location.href = '${pageContext.request.contextPath }/recruit';
			</c:when>
			<c:when test="${req_page == 'timeline' }">
				window.location.href = '${pageContext.request.contextPath }/timeline';
			</c:when>
			<c:when test="${req_page == 'mail' }">
				window.location.href = '${pageContext.request.contextPath }/mailHome';
			</c:when>
			<c:when test="${req_page == 'personal' }">
				window.location.href = '${pageContext.request.contextPath }/personalConnection';
			</c:when>
			<c:when test="${req_page == 'alarm' }">
				window.location.href = '${pageContext.request.contextPath }/alarm';
			</c:when>
			<c:otherwise>
				window.location.href = '${pageContext.request.contextPath }/recrSearch';
			</c:otherwise>
		</c:choose>
	});
	
	// 지원버튼 클릭.
	$("#btn_app").on("click", function(){
		if('${mem_division }' == '2'){ // 회사 회원 - 지원 불가.
			alert("일반회원으로 로그인 후 이용해주세요.");
			return;
		}
		
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
//			alert($(this).index());
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
	
	// 채용공고 클릭.
	$(".recr").on("click", function(){
		window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=personal';
	});		
	
	//////////////////////////// newList	
});

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
//			clearInterval(slide_switch);
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
</script>	
	
</body>
</html>






