<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="">
			<i class="fas fa-pencil-alt"></i>
			커리어 관심분야
		</a>
		<span style="margin: 290px;">
			인재를 찾고 계세요?
			<span class="button-group-area mt-10" style="margin-left: 20px;">
				<a href="#" class="genric-btn info-border">
					<i class="fas fa-edit"></i>
					채용공고 올리기
				</a>
			</span>							
		</span>
	</div>
	
	<form action="${pageContext.request.contextPath }/recrSearch" id="frm_search" method="post">
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
			<span class="button-group-area mt-10" style="margin-left: 800px;">
				<a href="#" class="genric-btn info-border">관리</a>
			</span>		
			
			<div style="text-align: left;">		
				<c:forEach items="${saveList }" var="search" varStatus="i">
					<div class="div_alarm">
						<table class="tb_alarm" style="margin-right: 20px;">
							<tr>
								<td class="t_alarm${i.index }">${search.search_word }</td>
								<td rowspan="2"><i id="t_alarm_alarm${i.index }" class="fas fa-bell"></i></td>
							</tr>
							<tr style="margin-left: 50px;">
								<td class="t_alarm${i.index }">${search.search_local }</td>
							</tr>
						</table>
					</div>			
				</c:forEach>
				<!-- 비어있는 종 아이콘. -->		
	<!-- 			<i class="far fa-bell"></i> -->
			</div>
		</div>
	</form>	
	

	<form id="frm_detail" action="${pageContext.request.contextPath }/recr_detail" method="post">
		<input type="hidden" id="recruit_code" name="recruit_code">
	
	   	<div class="div_ch" style="border: 1px solid; padding: 10px; margin-bottom: 20px; margin-top: 20px;">
	   		<div style="text-align: left; margin-bottom: 10px;">
	   			<strong>조회하신 항목을 참고하여..</strong> <br> 
	   			<a href="${pageContext.request.contextPath }/recr_detail?recruit_code=${LVRVo.recruit_code }">
	   				${LVRVo.recruit_title } - ${LVRVo.job_local }
	   			</a><br>
	   		</div>
	   		<!-- RRList1가 있으면 출력. -->
	   		<c:if test="${RRList1.size() >= 1 }">
				<table class="tb_recruit">
					<tr style="width: 100px; height: 140px; text-align: left;">
						<c:forEach items="${RRList1 }" varStatus="i" var="RRVo">
							<td style="width: 5px; height: 5px;">
								<div id="recr${i.index }" onmouseover="" style="cursor: pointer;">
									<div class="table_div">
										${corpImgList1.get(i.index) }
									</div> <br>
									<strong>${RRList1.get(i.index).recruit_title }</strong> <br>
									${corpNmList1.get(i.index) } <br>
									${RRList1.get(i.index).job_local }
								</div>
								<i class="far fa-bookmark" style="margin-top: 10px; font-size: large;"></i><br>
							</td>								
						</c:forEach>
					</tr>
				</table>
			</c:if> 
			<br>	                		
		           		
		         
			<br><br> 
			<div style="text-align: left; margin-bottom: 10px;">
				<strong>회원님의 프로필과 커리어 관심분야를 참고함</strong> <br> [관심 분야 · 관심 분야 · 관심 분야 ...] 
				<a href="">관심 분야 설정</a><br>
			</div>
			<!-- RRList2 출력. -->				
			<table class="tb_recruit">
				<tr style="width: 100px; height: 140px; text-align: left;">
					<c:forEach begin="5" end="8" varStatus="i">
						<td style="width: 5px; height: 5px;">
							<div id="recr${i.index-1 }" onmouseover="" style="cursor: pointer;">
								<div class="table_div">
									${corpImgList.get(i.index-1) }
								</div> <br>
								<strong>${recrList.get(i.index-1).recruit_title }</strong> <br>
								${corpNmList.get(i.index-1) } <br>
								${recrList.get(i.index-1).job_local }
							</div>
							<i class="far fa-bookmark" style="margin-top: 10px; font-size: large;"></i><br>
						</td>								
					</c:forEach>
				</tr>
				<tr style="width: 100px; height: 140px; text-align: left;">
					<c:forEach begin="9" end="12" varStatus="i">
						<td style="width: 5px; height: 5px;">
							<div id="recr${i.index-1 }" onmouseover="" style="cursor: pointer;">
								<div class="table_div">
									${corpImgList.get(i.index-1) }
								</div> <br>
								<strong>${recrList.get(i.index-1).recruit_title }</strong> <br>
								${corpNmList.get(i.index-1) } <br>
								${recrList.get(i.index-1).job_local }
							</div>
							<i class="far fa-bookmark" style="margin-top: 10px; font-size: large;"></i><br>
						</td>								
					</c:forEach>
				</tr>			
			</table> <br><br><br>   				
			<br>	                				
		</div>					
		<!-- 스크랩 안한 아이콘 -->
		<!-- <i class="far fa-bookmark"></i> -->
	</form>
	
	
	
</section>	
</div>
</div>	
</div>	

		
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- font awesome icon -->
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("RRlist1? : ${RRList1 }");
			
			// 채용공고 검색
			$("#btn_search").on("click", function(){
// 				alert($("#txt_name").val() + " / " + $("#txt_location").val());
				
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
// 					alert("t_alarm_alarm${i.index }");
					// 저장한 검색어에서 제외. 확인창 띄우기
					if(confirm("검색어를 목록에서 제거하시겠습니까?")) {
						window.location.href = 'http://localhost${pageContext.request.contextPath }/recruit?alarm_flag=t&search_code=${saveList.get(i.index).search_code }';					
					}					
				});
			</c:forEach>
			
			// 채용공고 리스트
			
			// 지금은 12개인데...
			<c:forEach begin="1" end="12" varStatus="i">
				$("#recr${i.index-1 }").on("click", function(){
					//alert("${i.index-1 }"); 첫번째 채용공고 : i.index-1 -> '0'
					
					$("#recruit_code").val(${recrList.get(i.index-1).recruit_code});
					
					$("#frm_detail").submit();
				});
			</c:forEach>
			
			
		});
	
	
	</script>	
	
</body>
</html>






