<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>recruit</title>
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
		
		.t_alarm{
			
		}
		
	</style>
	
</head>

<body>

	<h3 class="text-white">채용공고</h3>
                	
   	<div style="border: 1px solid; padding: 10px; margin-bottom: 20px;">
		<a href="">
			<i class="far fa-check-circle"></i>
			채용공고 상태 파악
		</a> │ 
		<a href="">
			<i class="fas fa-pencil-alt"></i>
			커리어 관심분야
		</a>
		<span style="margin: 60px;">
			인재를 찾고 계세요?
			<span class="button-group-area mt-10" style="margin-left: 20px;">
				<a href="#" class="genric-btn info-border">
					<i class="fas fa-edit"></i>
					채용공고 올리기
				</a>
			</span>							
		</span>
	</div>
	
	<form action="${pageContext.request.contextPath }/temp_search" id="frm_search" method="post">
		<input type="hidden" id="search_word" name="search_word">
		<input type="hidden" id="search_local" name="search_local">
	
		<div style="border: 1px solid; padding: 10px;">
			<span style="margin: 80px; padding-left: 100px;">
				꿈꾸시던 직장 - 검색하면 바로 뜹니다.
			</span><br>
			<span style="margin-left: 30px;">
				<i class="fas fa-search"></i>
				<input id="txt_name" type="text" style="border: 0px;" placeholder="채용공고 검색">
			</span>
			<span>
				<i class="fas fa-map-marker-alt"></i>
				<input id="txt_location" type="text" style="border: 0px;" placeholder="지역 검색">
			</span>
			<input id="btn_search" type="button" value="검색">					
		</div>
	</form>
	
	<form action="" id="frm_alarm">
	   	<div class="main_blog_details" style="padding: 10px; border-top: 0px; border-bottom: 1px solid; 
	   			border-left: 1px solid; border-right: 1px solid;">
			<span style="margin: 60px;">
				채용공고 검색어
			</span>
			<span class="button-group-area mt-10" style="margin-left: 100px;">
				<a href="#" class="genric-btn info-border">관리</a>
			</span>		
			
			<div>		
				<c:forEach items="${saveList }" var="search" varStatus="i">
					<div class="div_alarm">
						<table class="tb_alarm">
							<tr>
								<td class="t_alarm${i.index }">${search.search_word }</td>
								<td rowspan="2"><i id="t_alarm_alarm${i.index }" class="fas fa-bell"></i></td>
							</tr>
							<tr>
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
	
   	<div class="main_blog_details" style="border: 1px solid; padding: 10px; margin-bottom: 20px; margin-top: 20px;">
   		조회하신 항목을 참고하여.. <br> [조회한 항목이름 - 지역] <br>
		<table class="tb_recruit">
			<tr style="width: 100px; height: 100px;">
				<c:forEach begin="2" end="5" varStatus="i">
					<td style="width: 5px; height: 5px;">
						<div class="table_div">
							${corpList.get(i.index-1).logo_path }
						</div> <br>
						<i class="fas fa-bookmark" style="margin-top: 5px; margin-left: 10px; font-size: large;"></i><br>
						2019년 상반기 신입사원 모집 <br>
						${corpList.get(i.index-1).corp_name } <br>
						Seoul, KR
					</td>								
				</c:forEach>
			</tr>
		</table> <br>	                		
	           		
	           		
	<br><br> 회원님의 프로필과 커리어 관심분야를 참고함 <br> [관심 분야 · 관심 분야 · 관심 분야 ...] 
	<a href="">관심 분야 설정</a><br>
		
		<table class="tb_recruit">
			<tr style="width: 100px; height: 100px;">
				<c:forEach begin="9" end="12" varStatus="i">
					<td style="width: 5px; height: 5px;">
						<div class="table_div">
							${corpList.get(i.index-1).logo_path }
						</div> <br>
						<i class="fas fa-bookmark" style="margin-top: 5px; margin-left: 10px; font-size: large;"></i><br>
						2019년 상반기 신입사원 모집 <br>
						${corpList.get(i.index-1).corp_name } <br>
						Seoul, KR
					</td>								
				</c:forEach>
			</tr>
			<tr style="width: 100px; height: 100px;">
				<c:forEach begin="5" end="8" varStatus="i">
					<td style="width: 5px; height: 5px;">
						<div class="table_div">
							${corpList.get(i.index-1).logo_path }
						</div> <br>
						<i class="fas fa-bookmark" style="margin-top: 5px; margin-left: 10px; font-size: large;"></i><br>
						2019년 상반기 신입사원 모집 <br>
						${corpList.get(i.index-1).corp_name } <br>
						Seoul, KR
					</td>								
				</c:forEach>							
			</tr>
		</table> <br><br><br>   				
	
	
		<br>	                				
	</div>					
								<!-- 스크랩 안한 아이콘 -->
<!-- 								<i class="far fa-bookmark"></i> -->
					
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- font awesome icon -->
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("docu");
			
			$("#btn1").on("click", function(){
				alert(1);
			});
			
			$("#img1").on("click", function(){
				alert(2);
			});
			
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
			
			
			$("#btn_search").on("click", function(){
// 				alert($("#txt_name").val() + " / " + $("#txt_location").val());
				
				// hidden에 값 넣어주기.
				$("#search_word").val($("#txt_name").val());
				$("#search_local").val($("#txt_location").val());
				
				$("#frm_search").submit();
			});
			
		});
	
	
	</script>	
	
</body>
</html>






