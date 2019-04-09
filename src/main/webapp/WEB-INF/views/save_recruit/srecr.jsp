<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>1122211</title>
</head>

<body>
<!-- 검색창. -->
<nav style="background-color: #5c6f7c; height: 97px; margin-top: -20px; text-align: center; padding-top: 7px;">
	<table style="margin: 0 auto; height: 82px;">
		<tr>
			<td>
				<table>
					<tr>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-search" style="font-size: 21px; margin-right: 5px;
										color: #666666;"></i>
								<input type="text" placeholder="채용공고 검색" style="width: 483px; border: 0px;
										height: 37px; font-size: 19px;">
							</div>
						</td>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-map-marker-alt" style="font-size: 21px; margin-right: 5px;
										color: #666666"></i>
								<input type="text" placeholder="지역 검색" style="width: 483px; border: 0px;
										height: 37px; font-size: 19px;">
							</div>
						</td>
						<td>
							<input type="button" value="검색" style="border: 1px solid; width: 78px; height: 40px;
									background-color: #5c6f7c; border-color: white; color: white; font-size: 18px;"
									id="btn_search">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="text-align: left; color: white; font-size: 17px; margin-top: 3px;">
			<td>
				<table>
					<tr>
						<td>저장한 검색어 :&nbsp; &nbsp;</td>
						<c:choose>
							<c:when test="${saveList.size() == 0 }">
								<td style="color: white;">
									자주 쓰는 검색어를 등록해보세요.&nbsp; &nbsp;
								</td>
							</c:when>
						</c:choose>
							<!-- 6개만 출력하기. -->
							<c:forEach begin="1" end="${saveList.size() }" varStatus="i">
								<td>
									<a href="" style="color: white;">
										${saveList.get(i.index - 1).search_word } ${saveList.get(i.index - 1).search_local }&nbsp; &nbsp;
									</a>
								</td>
							</c:forEach>
							<c:if test="${saveList.size() > 5 }">
								<td>...&nbsp; &nbsp; </td>
							</c:if>
						<td>｜&nbsp; &nbsp; </td>
						<td>
							<span id="alarm_manage" onmouseover="" style="cursor: pointer;">검색어 관리</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</nav>

<div class="container">
<div class="row">
<div>
	<table border="0" style="margin-bottom: 60px; margin-top: 22px; padding: 0px; margin-left: -2px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<h4 style="font-size: 22px; margin-left: 25px; margin-top: 14px;">저장한 채용공고 (${srList.size() })</h4>
					</div>
					<div class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;">
						<c:forEach begin="1" end="${srList.size() }" varStatus="i">
							<table border="0" style="margin: 2px; margin-top: 2px;">
								<tr>
									<td id="img${i.index }" rowspan="6" onmouseover="" style="cursor: pointer; 
											border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 7px; 
											padding-top: 7px; padding-left: 4px;">
										<img src="${corpImgList.get(i.index - 1) }" width="200"> 
									</td>
									<td id="srecr${i.index }" onmouseover="" style="cursor: pointer; width: 513px;
											border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-left: 15px;">
										${srList.get(i.index - 1).recruit_title }<br>
										${corpNmList.get(i.index - 1) }<br>
										${srList.get(i.index - 1).job_local }<br>
										<span style="color: #d11124;">(xx일 전에 마감되었습니다.)</span>
									</td>
									<td style="width: 77px; text-align: center; border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
										<div style="width: 56px; height: 56px; border-radius: 28px; background-color: white;
												padding-top: 7px;" id="div_scrap${i.index }">
											<i id="scrap${i.index }" class="fas fa-bookmark" onmouseover="" 
													style="margin-top: 10px; font-size: 22px; cursor: pointer; 
											color: #0174b0;"></i>
										</div>
									</td>
								</tr>
							</table>			
						</c:forEach>					
					</div>
				</div>			
			</td>
			<td style="vertical-align: top; margin-left: 0px;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 330px; margin-left: -14px; font-size: 20px; padding-bottom: 7px;
							padding-top: 7px; padding-left: 7px;">
						지원한 채용공고 (${appList.size() })
					</div>
					<div class="whiteBox" style="width: 330px; margin-left: -14px; margin-top: -1px; padding-bottom: 2px;">
						<table border="0" style="margin-left: 10px; width: 310px; margin-top: 10px;">
							<c:forEach begin="1" end="${appList.size() }" varStatus="i">
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
							</c:forEach>
						</table>						
					</div>
				</div>			
			</td>
		</tr>
	</table>
	<br><br><br>
	
<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->		
</div>		
</div>		
</div>		
		
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("${saveList }");
		
		// 검색 버튼
		$("#btn_search").on("mouseover", function(){
// 			alert(1);
			$("#btn_search").css("background-color", "#7b909d");
			$("#btn_search").css("border", "2px solid");
		});
		
		$("#btn_search").on("mouseout", function(){
			$("#btn_search").css("background-color", "#5c6f7c");
			$("#btn_search").css("border", "1px solid");
		});
		
		// 검색어 관리 (모달 띄울때는 $(function(){ 필요함. 그리고 jQuery 스크립트는 layout.jsp에 있으므로
		// 지워준다.)
		$(function(){
			$("#alarm_manage").on("click", function(){
				$("div.modal").modal();
			});
		});		

		// 이미지, 채용공고 & 스크랩 클릭
		<c:forEach begin="1" end="${srList.size() }" varStatus="i">
			$("#img${i.index }").on("click", function(){
				alert("code : ${srList.get(i.index - 1).recruit_code }");
				
				// 상세보기 페이지로 이동.
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${srList.get(i.index - 1).recruit_code }';
			});
			
			$("#srecr${i.index }").on("click", function(){
// 				alert("채용공고 ${i.index }");
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${srList.get(i.index - 1).recruit_code }';
			});
			
			$("#scrap${i.index }").on("click", function(){
// 				alert("스크랩 ${i.index }");
				if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
					window.location.href = '${pageContext.request.contextPath }/scrap?scrap_flag=f${srList.get(i.index - 1).recruit_code }&req_page=srecr';
				}
			});
			
			// 스크랩버튼 마우스오버.
			$("#scrap${i.index }").on("mouseover", function(){
// 				alert(1);
				$("#div_scrap${i.index }").css("background-color", "#e5f5fb");
			});
			$("#scrap${i.index }").on("mouseout", function(){
				$("#div_scrap${i.index }").css("background-color", "white");
			});
			
		</c:forEach>
		
		<c:forEach begin="1" end="${appList.size() }" varStatus="i">
			// 지원한 채용공고 클릭
			$("#app${i.index }").on("click", function(){
// 				alert("${i.index }");
				window.location.href = '${pageContext.request.contextPath}/recr_detail?recruit_code=${appList.get(i.index - 1).recruit_code }';
			});
		</c:forEach>
		
		
	});

</script>	
	
</body>
</html>






