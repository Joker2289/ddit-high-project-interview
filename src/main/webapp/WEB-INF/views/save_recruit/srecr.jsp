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
	<table border="1" style="margin-bottom: 60px; margin-top: 10px;">
		<tr>
			<td>
				<div class="col-md-12">
					<div class="whiteBox" style="">
						<h4>저장한 채용공고 (${srList.size() })</h4>
					</div>
					<!-- 이어서. 두 whitebox 붙이기. -->
					<div class="whiteBox" style="border-top: 0px;">
						<c:forEach begin="1" end="${srList.size() }" varStatus="i">
							<table style="margin: 2px;">
								<tr>
									<td id="img${i.index }" rowspan="6" onmouseover="" style="cursor: pointer;">${corpImgList.get(i.index - 1) }</td>
									<td id="srecr${i.index }" onmouseover="" style="cursor: pointer;">
										${srList.get(i.index - 1).recruit_title }<br>
										${corpNmList.get(i.index - 1) }<br>
										${srList.get(i.index - 1).job_local }<br>
									</td>
									<td><i id="scrap${i.index }" class="fas fa-bookmark" onmouseover="" 
											style="margin-top: 10px; font-size: large; cursor: pointer;"></i></td>
								</tr>
							</table>			
						</c:forEach>					
					</div>
				</div>			
			</td>
			<td>
				<div class="col-md-12">
					<div class="whiteBox">
						<!-- 저장한 검색어 테이블. -->
						<table border="1" style="margin-left: 10px;">
							<tr>
								<td>지원한 채용공고</td>
							</tr>
							
							<c:forEach begin="1" end="3" varStatus="i">
								<tr>
									<td>${i.index }</td>
								</tr>
							</c:forEach>
							
							
							<tr>
								<td>더보기</td>
							</tr>
							<tr>
								<td>알림만들기</td>
							</tr>
						</table>						
					</div>
				</div>			
			</td>
		</tr>
	</table>
	
	
	<br><br><br><br><br><br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
	
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
		</c:forEach>
		
		
	});

</script>	
	
</body>
</html>






