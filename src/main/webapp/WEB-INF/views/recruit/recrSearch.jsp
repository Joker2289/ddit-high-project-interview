<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜3333</title>
</head>

<body>
<form action="${pageContext.request.contextPath }/insertSLog" id="frm_search">
<input type="hidden" id="search_word" name="search_word">
<input type="hidden" id="search_local" name="search_local">
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
										height: 37px; font-size: 19px;" id="txt_word">
							</div>
						</td>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-map-marker-alt" style="font-size: 21px; margin-right: 5px;
										color: #666666"></i>
								<input type="text" placeholder="지역 검색" style="width: 483px; border: 0px;
										height: 37px; font-size: 19px;" id="txt_local">
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
</form>

<div class="container">
<div class="row">
<div>
		<!-- 필터. -->
	<table border="1">
		<tr>
			<td>
				항목 수 xxx
			</td>
			<td>
				<select>
					<option>올린날</option>
				</select>
			</td>
			<td>
				<select>
					<option>기능</option>
				</select>
			</td>
			<td>
				<select>
					<option>회사</option>
				</select>
			</td>
			<td>
				<select>
					<option>경력수준</option>
				</select>
			</td>
			<td><a href="">전체필터</a></td>
		</tr>
	</table>

	<!-- 레이아웃 잡는건 나중에.. -->
	<h3>채용공고검색 페이지임니다. (mem_id : ${SESSION_MEMBERVO.mem_id })</h3>
	<h5>(채용공고 수 - ${recrList.size() })</h5>
	<h5>(검색 : 검색어 - ${lSLog.search_word } / 지역 - ${lSLog.search_local })</h5>
	
	<table>
		<tr>
			<td>
				<!-- 첫번째 항목 따로 출력했음. -->
				<table id="recr1" border="1" onmouseover="" style="margin: 2px; cursor: pointer;">
					<c:if test="${recrList.size() > 0 }">
						<tr>
							<td rowspan="6">
								<img src="${corpImgList.get(0) }" width="200">
							</td>
							<td>${recrList.get(0).recruit_title }</td>
						</tr>
						<tr>
							<td>${corpNmList.get(0) }</td>
						</tr>
						<tr>
							<td>${recrList.get(0).job_local }</td>
						</tr>
						<tr>
							<td>${recrList.get(0).app_count }명이 지원했습니다</td>
						</tr>
						<tr>
							<td>${recrList.get(0).start_date } / 간편지원 ${recrList.get(0).app_type }</td>
						</tr>
					</c:if>
				</table>
			</td>
			<td>
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
			</td>
		</tr>
		<!-- 첫번째 항목을 제외한 전체 리스트. -->
		<c:if test="${recrList.size() > 1 }">
			<c:forEach begin="2" end="${recrList.size() }" varStatus="i">
				<tr>
					<td>
						<table id="recr${i.index }" border="1" style="margin: 2px; cursor: pointer;" onmouseover="">
							<tr>
								<td rowspan="6">
									<img src="${corpImgList.get(i.index - 1) }" width="200">
								</td>
								<td>${recrList.get(i.index - 1).recruit_title }</td>
							</tr>
							<tr>
								<td>${corpNmList.get(i.index - 1) }</td>
							</tr>
							<tr>
								<td>${recrList.get(i.index - 1).job_local }</td>
							</tr>
							<tr>
								<td>${recrList.get(i.index - 1).app_count }명이 지원했습니다</td>
							</tr>
							<tr>
								<td>${recrList.get(i.index - 1).start_date } / 간편지원 ${recrList.get(i.index - 1).app_type }</td>
							</tr>
						</table>			
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>	
	
	<br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>	
	
		
</div>		
</div>		
</div>		
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("docu");
		
		<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
			$("#recr${i.index }").on("click", function(){
// 				alert("${i.index }");
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${recrList.get(i.index - 1).recruit_code }&otherParam=1';
			});
		</c:forEach>
		
		// input text에 검색중인 값 출력하기.
		$("#txt_word").val("${lSLog.search_word }");
		$("#txt_local").val("${lSLog.search_local }");
		
		// 검색 버튼
		$("#btn_search").on("click", function(){
// 			alert($("#txt_word").val() + " + " + $("#txt_local").val());
			search();
		});
		
		// 엔터키 눌렀을 때 검색되도록.
		$("#txt_local").keypress(function(e){
			if(e.which == 13){
				search();
			}
		});		
		$("#txt_word").keypress(function(e){
			if(e.which == 13){
				search();
			}
		});		
		
	});
	
	function search(){
		$("#search_word").val($("#txt_word").val());
		$("#search_local").val($("#txt_local").val());
		
		$("#frm_search").submit();		
	}

</script>	
	
</body>
</html>






