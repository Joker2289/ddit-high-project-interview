<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView</title>
	<style type="text/css">
		table.tb_recruit{
/*  style="width: 700px; height: 500px; border: 1px solid; border-spacing: 15px;" */
			border-spacing: 15px;
		}
	
		tr.tb_recruit, td.tb_recruit{
			border: 1px solid;			
		}
	
		div.table_div, .div_alarm, .tb_alarm{
			display: inline;
		}	
		
		.div_ch{
			width: 1000px;
			display: inline-block;
		}
		
		.div_list{
			width: 1000px;
			height: 670px;
			display: inline-block;
		}
		
		
	</style>
	
</head>

<body>

<div class="container">
<div class="row">
<div style="margin-top: 101px;">
<section style="text-align: center;">
   	<div class="div_ch" style="border: 1px solid; padding: 10px; margin-bottom: 20px;">
		<a href="${pageContext.request.contextPath }/srecr">
			<i class="far fa-check-circle"></i>
			채용공고 상태 파악
		</a> │ 
		<a href="${pageContext.request.contextPath }/interest">
			<i class="fas fa-pencil-alt"></i>
			커리어 관심분야
		</a>
		<span style="margin: 290px;">
			인재를 찾고 계세요?
			<span class="button-group-area mt-10" style="margin-left: 20px;">
				<a href="${pageContext.request.contextPath }/writeRecr" class="genric-btn info-border">
					<i class="fas fa-edit"></i>
					채용공고 올리기
				</a>
			</span>							
		</span>
	</div>
	
   	<div class="div_ch" style="border: 1px solid; padding: 10px; margin-bottom: 20px;">
		<img width="30" src="https://lh3.googleusercontent.com/sMhe3GxpmWD6NISZBzhy--dtwcAcVvLFDxOGe1Kat3d0YA0nhq9ICwTSFN3UQ7uEZA">
		<a href="https://media.daum.net/digital/">
			 뉴스로 IT 업계 동향을 확인해보세요.(다음 뉴스 - IT - 크롤링 - 링크)
		</a>
	</div>
	
	<form action="${pageContext.request.contextPath }/insertSLog" id="frm_search" method="post">
		<input type="hidden" id="search_word" name="search_word">
		<input type="hidden" id="search_local" name="search_local">
	
		<div class="div_ch" style="border: 1px solid; padding: 10px;">
			<h3 style="">꿈꾸시던 직장 - 검색하면 바로 뜹니다. (mem_id : ${memberVO.mem_id })</h3><br>
			<span style="margin-left: 30px;">
				<i class="fas fa-search"></i>
				<input id="txt_name" type="text" style="width: 400px; height: 30px; border: 0px;" placeholder="채용공고 검색">
			</span>
			<span>
				<i class="fas fa-map-marker-alt"></i>
				<input id="txt_location" type="text" style="width: 400px; height: 30px; border: 0px;" placeholder="지역 검색">
			</span>
			<input id="btn_search" type="button" value="검색">					
		</div>
	</form>
	
	<form action="" id="frm_alarm">
	   	<div class="div_ch" style="padding: 10px; border-top: 0px; border-bottom: 1px solid; 
	   			border-left: 1px solid; border-right: 1px solid;">
			<span style="">
				채용공고 검색어
			</span>
			<span id="alarm_manage" class="button-group-area mt-10" onmouseover="" style="margin-left: 800px; cursor: pointer;">
				관리
			</span>		
			
			<div style="text-align: left;">		
				<c:forEach items="${saveList }" var="search" varStatus="i">
					<div class="div_alarm">
						<table class="tb_alarm" style="margin-right: 20px;">
							<tr>
								<td class="t_alarm${i.index }" onmouseover="" style="cursor: pointer;">${search.search_word }</td>
								<td rowspan="2"><i id="t_alarm_alarm${i.index }" class="fas fa-bell" onmouseover="" 
										style="cursor: pointer;"></i></td>
							</tr>
							<tr style="margin-left: 50px;">
								<td class="t_alarm${i.index }" onmouseover="" style="cursor: pointer;">${search.search_local }</td>
							</tr>
						</table>
					</div>			
				</c:forEach>
				<!-- 비어있는 종 아이콘. -->		
	<!-- 			<i class="far fa-bell"></i> -->
			</div>
		</div>
	</form>	
	
   	<div class="div_ch" style="border: 1px solid; padding: 10px; margin-bottom: 20px; margin-top: 20px;">
		<img width="30" src="http://mblogthumb4.phinf.naver.net/20160920_175/kokoa2100_1474368430239vv9yY_PNG/mzl.xnmoezsr.png?type=w800">   	
		<a href="https://map.kakao.com/">
			 (지도 API를 이용한 채용공고 검색)
		</a>
	</div>	
	

	<form id="frm_detail" action="${pageContext.request.contextPath }/recr_detail" method="post">
		<input type="hidden" id="recruit_code" name="recruit_code">
	
	   	<div class="div_list" style="border: 1px solid; padding: 10px; margin-bottom: 150px; margin-top: 20px;">
	   		<div style="text-align: left; margin-bottom: 10px;">
	   			<strong>조회/스크랩하신 항목을 참고하여..</strong> <br> 
	   			<c:choose>
	   				<c:when test="${lVRVo.recruit_title.substring(0, 9) == '원하는 채용공고를' }">
			   			<a href="${pageContext.request.contextPath }/recrSearch">
			   				${lVRVo.recruit_title } - ${lVRVo.job_local }
			   			</a><br>
	   				</c:when>
	   				<c:otherwise>
			   			<a href="${pageContext.request.contextPath }/recr_detail?recruit_code=${lVRVo.recruit_code }">
			   				${lVRVo.recruit_title } - ${lVRVo.job_local }
			   			</a><br>
	   				</c:otherwise>
	   			</c:choose>
	   		</div>
	   		<!-- rRList1가 있으면 출력. -->
	   		<c:if test="${rRList1.size() >= 1 }">
				<table class="tb_recruit">
					<tr style="width: 100px; height: 140px; text-align: left;">
						<c:forEach items="${rRList1 }" varStatus="i" var="rRVo">
							<!-- 마지막 조회/스크랩 채용공고 색을 좀 표시하면 좋겠는데. -->
<!-- 							<td style="width: 5px; height: 5px; border: 10px; border-color: #b3d9ff;"> -->
							<td style="width: 5px; height: 5px;">
								<div id="recr${i.index }" onmouseover="" style="cursor: pointer;">
									<div class="table_div">
										${corpImgList1.get(i.index) }
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
							</td>								
						</c:forEach>
					</tr>
				</table>
			</c:if> 
			<br>	                		
		           		
		         
			<br><br> 
			<div style="text-align: left; margin-bottom: 10px;">
				<strong>회원님의 프로필과 커리어 관심분야를 참고함</strong> <br>
				
				<!-- c:choose안에 또 c:choose 넣을 수 있나? -->
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
			</div>
			<!-- rRList2 출력. 있으면 출력. -->				
	   		<c:if test="${rRList2.size() >= 1 }">
				<table class="tb_recruit">
					<tr style="width: 100px; height: 140px; text-align: left;">
						<c:forEach items="${rRList2 }" varStatus="i" var="rRVo">
							<td style="width: 5px; height: 5px;">
								<div id="recr2${i.index }" onmouseover="" style="cursor: pointer;">
									<div class="table_div">
										${corpImgList2.get(i.index) }
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
							</td>								
						</c:forEach>
					</tr>
				</table>
			</c:if>
			<br><br><br>   				
			<br>	 
			<div style="border-top: 1px solid;">              				
				<a href="">계속 검색</a>
			</div>
		</div>		
		<!-- 스크랩 안한 아이콘 -->
		<!-- <i class="far fa-bookmark"></i> -->
	</form>
	
	
<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->	
</section>	
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
		console.log("scrapList? : ${scrapList }");
		
		<c:forEach items="${rRList1 }" varStatus="i">
			console.log("i? : ${i.index }");
		</c:forEach>
		// " i? : 0 ~ 5 "
		
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
				alert("t_alarm${i.index }");
			});
			
			$("#t_alarm_alarm${i.index }").on("click", function(){
// 				alert("t_alarm_alarm${i.index }");
				// 저장한 검색어에서 제외. 확인창 띄우기
				if(confirm("검색어를 목록에서 제거하시겠습니까?")) {
					window.location.href = 'http://localhost${pageContext.request.contextPath }/recruit?alarm_flag=t&search_code=${saveList.get(i.index).search_code }';					
				}					
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
		
		
	});

</script>	
	
</body>
</html>






