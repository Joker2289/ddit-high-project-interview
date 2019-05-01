<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
<form action="${pageContext.request.contextPath }/insertSLog" id="frm_search">
<input type="hidden" id="search_word" name="search_word">
<input type="hidden" id="search_local" name="search_local">
<!-- 검색창. -->
<nav style="background-color: #5c6f7c; height: 97px; margin-top: -20px; text-align: center; padding-top: 7px;">
	<table style="height: 82px; margin-left: 263px;">
		<tr>
			<td>
				<table>
					<tr>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;
									margin-left: 0px;">
								<i class="fas fa-search" style="font-size: 21px; margin-right: 5px;
										color: #666666;"></i>
								<input type="text" placeholder="채용공고 검색" style="width: 488px; border: 0px;
										height: 37px; font-size: 19px;" id="txt_word">
							</div>
						</td>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-map-marker-alt" style="font-size: 21px; margin-right: 5px;
										color: #666666"></i>
								<input type="text" placeholder="지역 검색" style="width: 488px; border: 0px;
										height: 37px; font-size: 19px;" id="txt_local">
							</div>
						</td>
						<td>
							<input type="button" value="검색" style="border: 1px solid; width: 78px; height: 40px;
									background-color: #5c6f7c; border-color: white; color: white; font-size: 18px;
									margin-left: 3px;" id="btn_search">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="text-align: left; color: white; font-size: 17px; margin-top: 3px; margin-left: 30px;">
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

<!-- 필터 nav. -->
<nav style="text-align: center; height: 60px; background-color: white; font-size: 19px; 
		border: 1px solid rgba(0, 0, 0, .15); box-shadow: 0 6px 12px rgba(0, 0, 0, .175);">
	<table border="0" style="height: 60px; text-align: left;
			margin-left: 260px; vertical-align: top;">
		<tr>
			<td style="padding: 5px; width: auto; padding-right: 0px; padding-top: 3px;">
				채용공고 &nbsp;｜
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<select style="padding: 5px;">
					<option>올린날</option>
				</select>
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<select style="padding: 5px;">
					<option>기능</option>
				</select>
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<select style="padding: 5px;">
					<option>회사</option>
				</select>
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<select style="padding: 5px;">
					<option>경력수준</option>
				</select>
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<a href="">전체필터</a>
			</td>
			<td style="padding: 15px; padding-top: 13px;">
				<a href="">지우기</a>
			</td>
		</tr>
	</table>
</nav>

<div class="container">
<div class="row">
<div>

<table border="0" style="margin-bottom: 0px; margin-top: 22px; padding: 0px; margin-left: -2px;">
	<tr>
		<td style="vertical-align: top;">
			<div class="col-md-12">
				<div class="whiteBox" style="width: 795px; vertical-align: middle;">
					<h4 id="txt_srList" style="font-size: 22px; margin-left: 25px; margin-top: 14px;
							margin-bottom: 14px;">
						검색 결과 (${recrList.size() })
					</h4>
				</div>
				<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;
						font-size: 15px;">
					<c:if test="${recrList.size() > 0 }">
						<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
							<table id="recr${i.index }" border="0" style="margin: 2px; cursor: pointer;
									width: 790px; border-bottom: 1px solid; border-color: #d9d9d9;
									margin-bottom: 5px;" onmouseover="">
								<tr>
									<td rowspan="6" style="width: 235px;">
										<img src="${corpImgList.get(i.index - 1) }" width="200"
											style="margin-left: 15px;">
									</td>
									<td style="padding-left: 10px; color: #0174b0; font-size: 17px; 
											padding-bottom: 2px; padding-top: 7px;">
										<strong>${recrList.get(i.index - 1).recruit_title }</strong>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 16px; padding-bottom: 2px; padding-top: 2px;">
										<strong>${corpNmList.get(i.index - 1) }</strong>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; padding-bottom: 2px; padding-top: 2px;">
										${recrList.get(i.index - 1).job_local }
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; padding-bottom: 2px; padding-top: 2px;">
										<c:choose>
											<c:when test="${recrList.get(i.index - 1).app_count == '0'}">
												<i class="far fa-clock" style="color: #2f7b15;"></i>
												 가장 먼저 지원하세요.
											</c:when>
											<c:otherwise>
												${recrList.get(i.index - 1).app_count }명 지원
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="border-bottom: 1px solid; border-color: #d9d9d9;">
									<td style="padding-left: 10px; padding-bottom: 7px; padding-top: 2px;">
										<span style="color: #2f7b15;">${timeList.get(i.index - 1) } 전</span>
										<c:if test="${recrList.get(i.index - 1).app_type == 't'}">
											 · <img src="/images/logo/linkedin.png" width="17">
											 간편 지원
										</c:if>
									</td>
								</tr>
							</table>			
						</c:forEach>
					</c:if>
				</div>
				
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px; margin-bottom: 100px; height: 50px; padding: 10px;
							padding-left: 20px; font-size: 20px; margin-left: -15px; margin-top: -5px;">
						<a href="${pageContext.request.contextPath }/recruit">
							<i class="fas fa-chevron-left" style="font-size: 19px;"></i>
							<strong>&nbsp; &nbsp;채용공고 페이지로</strong>
						</a>
					</div>
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
										border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 10px; 
										padding-top: 10px; padding-left: 4px;">
									<img src="${corpImgList_app.get(i.index - 1) }" width="150"
											style="margin-bottom: 10px;"><br><br>
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

<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->
</div>		
</div>		
</div>		
		
<script type="text/javascript">
	// nav - 검색어 관리 - 모달창
	$(function () {
		$("#alarm_manage").on("click", function(){
			$("div.modal").modal();
		});
	});

	$(document).ready(function(){
		console.log("docu");

		// 모달창 jQuery
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
			
			result = result_save + "???" + result_search;
			
			// 수정할 result 문자열 만들기
			$("#result").val(result);
			
			// 요청 페이지 구분값 보내기.
			$("#req_page").val("recrSearch");
			
			$("#frm").submit();			
		});
		$("#btn_cancel").on("click", function(){
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
		
		<c:forEach begin="1" end="${recrList.size() }" varStatus="i">
			$("#recr${i.index }").on("click", function(){
// 				alert("${i.index }");
				window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=${recrList.get(i.index - 1).recruit_code }&req_page=recrSearch';
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






