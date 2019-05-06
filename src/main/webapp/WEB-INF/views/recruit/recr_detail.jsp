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
										<a href="/corporation?corp_id=${corp.corp_id }">
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
												${recr.job_rank }<br>
												<strong>업계</strong><br>
												${corp.industry_type }<br>
												<strong>고용형태</strong><br>
												${recr.emp_type }<br>
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
	
});
</script>	
	
</body>
</html>






