<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#txt_com::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
		  color: black;
		}
		
		#txt_com:focus {
			border: 0px;
		}
	</style>
</head>

<body>

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
						<!-- applyUserList -->
						채용공고 지원자 (${aUList.size() })
					</h4>
				</div>
				<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;
						font-size: 15px;">
					<c:if test="${aUList.size() > 0 }">
						<c:forEach begin="1" end="${aUList.size() }" varStatus="i">
							<table id="recr${i.index }" border="1" style="margin: 2px; cursor: pointer;
									width: 790px; border-bottom: 1px solid; border-color: #d9d9d9;
									margin-bottom: 5px;" onmouseover="">
								<tr>
									<td rowspan="6" style="width: 235px;">
										<table border="1">
											<tr>
												<td>
													<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${aUList.get(i.index - 1).user_id }&division=pf" 
															width="60" style="margin-left: 15px;">
												</td>
												<td style="font-size: 16px; padding-left: 15px; padding-right: 15px;">
													<strong>${aUList.get(i.index - 1).user_id }</strong>
												</td>
											</tr>
										</table>
									</td>
									<td style="padding-left: 10px; font-size: 16px; 
											padding-bottom: 2px; padding-top: 7px;">
										<strong>${aUList.get(i.index - 1).user_id }</strong>
									</td>
									<td style="width: 150px; cursor: default;" rowspan="3">
										<input type="button" value="이력서 저장" style="color: #0174b0; 
												border: 1px solid; border-color: #0174b0;
												background-color: white;">
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 16px; padding-bottom: 2px; padding-top: 2px;">
										<strong>${aUList.get(i.index - 1).user_id }</strong>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; padding-bottom: 2px; padding-top: 2px;">
										${aUList.get(i.index - 1).user_id }
									</td>
								</tr>
							</table>			
						</c:forEach>
					</c:if>
				</div>
				
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px; margin-bottom: 100px; height: 50px; padding: 10px;
							padding-left: 20px; font-size: 20px; margin-left: -15px; margin-top: -5px;">
						<a href="${pageContext.request.contextPath }/recr_detail?recruit_code=${recruit_code }">
							<i class="fas fa-chevron-left" style="font-size: 19px;"></i>
							<strong>&nbsp; &nbsp;채용공고 상세 페이지로</strong>
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
		console.log($("#sel_period option:selected").text());

		// 필터 sel_period 기본값 설정 / 선택
		if('${period_value }' != ''){
			$("#sel_period").val("${period_value }").prop("selected", true);
			$("#period_value").val($("#sel_period option:selected").val());
		}
		$("#sel_period").on("change", function(){
// 			alert("val : " + $("#sel_period option:selected").val());
			$("#period_value").val($("#sel_period option:selected").val());
			
			if($("#sel_period option:selected").text() != '올린 날'){
				$("#sel_period").css("background-color", "#0174b0");
				$("#sel_period").css("color", "white");
			}else{
				$("#sel_period").css("background-color", "white");
				$("#sel_period").css("color", "black");
			}
		});
		if($("#sel_period option:selected").text() != '올린 날'){
			$("#sel_period").css("background-color", "#0174b0");
			$("#sel_period").css("color", "white");
		}
		
		// 필터 sel_function 기본값 설정 / 선택
		if('${function_value }' != ''){
			$("#sel_function").val("${function_value }").prop("selected", true);
			$("#function_value").val($("#sel_function option:selected").val());
		}
		$("#sel_function").on("change", function(){
// 			alert("val : " + $("#sel_function option:selected").val());
			$("#function_value").val($("#sel_function option:selected").val());
			
			if($("#sel_function option:selected").text() != '기능'){
				$("#sel_function").css("background-color", "#0174b0");
				$("#sel_function").css("color", "white");
			}else{
				$("#sel_function").css("background-color", "white");
				$("#sel_function").css("color", "black");
			}			
		});
		if($("#sel_function option:selected").text() != '기능'){
			$("#sel_function").css("background-color", "#0174b0");
			$("#sel_function").css("color", "white");
		}
		
		// 필터 sel_com.
		$("#sel_com").on("click", function(){
// 			$("#sel_com").preventDefault();
		});
		
		// 필터 적용 버튼
		$("#btn_filter").on("click", function(){
			$("#frm_filter").submit();			
		});
		$("#btn_filter").on("mouseover", function(){
			$(this).css("background-color", "#cdedfe");
		});
		$("#btn_filter").on("mouseout", function(){
			$(this).css("background-color", "white");
		});
		// 필터 지우기 버튼
		$("#btn_remove").on("click", function(){
			window.location.href = '${pageContext.request.contextPath }/recrSearch';
		});
		$("#btn_remove").on("mouseover", function(){
			$(this).css("background-color", "#cdedfe");
		});
		$("#btn_remove").on("mouseout", function(){
			$(this).css("background-color", "white");
		});		

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






