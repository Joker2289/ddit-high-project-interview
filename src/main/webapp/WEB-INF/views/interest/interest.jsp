<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/recruit/interest.css" type="text/css" rel="stylesheet">
	<title></title>
</head>

<body>
<div class="container"><div class="row"><div>
	<!-- 레이아웃 잡는건 나중에.. -->
	
	<br><br>
<table border="0" style="margin-bottom: 0px; margin-top: -40px; padding: 0px; margin-left: -1px;">
<tr>
<td style="vertical-align: top;">
<div class="col-md-12">
	<div class="whiteBox" style="width: 795px; vertical-align: middle;">
		<h4 id="txt_srList" style="font-size: 22px; margin-left: 25px; margin-top: 14px;
				margin-bottom: 14px;">
			<strong>커리어 관심분야</strong>
		</h4>
	</div>
	<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: 0px;
			font-size: 15px; padding: 20px; font-size: 18px;">
		<form action="${pageContext.request.contextPath }/insertInte" id="frm" method="post">	
			<input type="hidden" id="inte_type" name="inte_type">
			<input type="hidden" id="inte_local" name="inte_local">
			<input type="hidden" id="inte_emptype" name="inte_emptype">
			<input type="hidden" id="inte_size" name="inte_size">
			<input type="hidden" id="change_flag" name="change_flag">
			<input type="hidden" id="tell_content" name="tell_content">
			<input type="hidden" id="job_condition" name="job_condition">
		
			<table border="0" style="width: 750px;">
				<tr>
					<td style="padding-bottom: 35px;">
						<i class="fas fa-user-edit" style="color: #0174b0;"></i>
						<strong style="color: #0174b0;">
							회원님의 커리어 관심분야는 회원님께 추천하는 채용공고를 결정합니다.
						</strong> <br>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 20px;">
						<strong>리크루터에게 이직할 의사가 있다고 밝히기</strong>
						<div class="can-toggle demo-rebrand-2" style="float: right; margin-right: 60px;">
							<input id="cb_move" type="checkbox">
							<label for="cb_move">
								<div class="can-toggle__switch" data-checked="2" data-unchecked="2"></div>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td id="td_txt" style="padding-bottom: 30px;">
						<!-- 이직의사를 켰을때 리크루터에게하고싶은말 textarea가 생김. -->
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<div style="margin-bottom: 10px;"> 
							<strong>현재 회원님의 상태는?</strong><br>
						</div>
						<select id="sel_cond" style="padding: 5px;">
							<option value="0">상태</option>
							<option value="1">적극적으로 지원하는 중</option>
							<option value="2">가끔 지원함</option>
							<option value="3">지원하고 있지 않지만 제안을 받는다면 고려할 것</option>
							<option value="4">원하고 있지 않고 기회가 생겨도 거절할 것</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<strong id="lb_type">원하시는 업무분야가 무엇인가요?</strong>
						 (가장 관심있는 분야부터 세가지를 선택해주세요.)<br>
						<table border="0" style="margin-top: 10px; margin-bottom: 10px;">
							<tr>
								<!-- css파일에서 제대로 css수정이 안될땐 태그에 직접. -->
								<td class="td_b" style="width: 250px;">1순위:</td>
								<td class="td_b" style="width: 250px;">2순위:</td>
								<td class="td_b" style="width: 250px;">3순위:</td>
							</tr>
						</table>						 
						 
						 <table border="0" style="width: 750px;">
						 	<!-- 체크된 아이콘 'far fa-check-circle'-->
						 	<tr>
							 	<c:forEach begin="1" end="${jobList.size() }" varStatus="i">
							 		<td class="td_a">
							 			<div class="div_job" data-idx="${i.index }" style="
							 					width: auto; float: left; cursor: pointer;" 
							 					data-check-flag="f" onmouseover=""
							 					data-job="${jobList.get(i.index - 1).item_content }">
							 				<i class="far fa-circle"></i>
							 				&nbsp;${jobList.get(i.index - 1).item_content }
							 			</div>
							 		</td>
							 		<c:if test="${(i.index)%4 == 0 }">
							 			</tr><tr>
							 		</c:if>
							 	</c:forEach>
						 	</tr>
						 </table>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<strong id="lb_local">어느 지역으로 취직/이직하고 싶으세요?</strong><br>
						<table border="0" style="margin-top: 10px; margin-bottom: 10px;">
							<tr>
								<td class="td_local" style="width: 250px;">1순위:</td>
								<td class="td_local" style="width: 250px;">2순위:</td>
								<td class="td_local" style="width: 250px;">3순위:</td>
							</tr>
						</table>						 
						 
						 <table border="0" style="width: 750px;">
						 	<tr>
						 		<td class="td_local_data">
						 			<div class="div_local" data-idx="1" style="
						 					width: auto; float: left; cursor: pointer;" 
						 					data-check-flag="f" onmouseover=""
						 					data-local="전국">
						 				<i class="far fa-circle"></i>
						 				&nbsp;전국
						 			</div>
						 		</td>						 	
							 	<c:forEach begin="1" end="${localList.size() }" varStatus="i">
							 		<td class="td_local_data">
							 			<div class="div_local" data-idx="${i.index + 1 }" style="
							 					width: auto; float: left; cursor: pointer;" 
							 					data-check-flag="f" onmouseover=""
							 					data-local="${localList.get(i.index - 1) }">
							 				<i class="far fa-circle"></i>
							 				&nbsp;${localList.get(i.index - 1) }
							 			</div>
							 		</td>
							 		<c:if test="${(i.index)%4 == 3 }">
							 			</tr><tr>
							 		</c:if>
							 	</c:forEach>
						 	</tr>
						 </table>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<strong id="lb_emp">원하시는 고용형태가 있으신가요?</strong><br>
						<table border="0" style="margin-top: 10px; margin-bottom: 10px;">
							<tr>
								<td class="td_emp" style="width: 250px;">1순위:</td>
								<td class="td_emp" style="width: 250px;">2순위:</td>
							</tr>
						</table>						 
						 
						 <table border="0" style="width: 750px;">
						 	<tr>
						 		<td class="td_emp_data" onmouseover="" style="width: 187px;">
						 			<div class="div_emp" data-idx="1" style="
						 					width: auto; float: left; cursor: pointer;" 
						 					data-check-flag="f" onmouseover=""
						 					data-emp="모든 고용형태">
						 				<i class="far fa-circle"></i>
						 				&nbsp;모든 고용형태
						 			</div>
						 		</td>						 	
							 	<c:forEach begin="1" end="${empList.size() }" varStatus="i">
							 		<td class="td_emp_data" onmouseover="" style="width: 187px;">
							 			<div class="div_emp" data-idx="${i.index + 1 }" style="
							 					width: auto; float: left; cursor: pointer;" 
							 					data-check-flag="f" onmouseover=""
							 					data-emp="${empList.get(i.index - 1) }">
							 				<i class="far fa-circle"></i>
							 				&nbsp;${empList.get(i.index - 1) }
							 			</div>
							 		</td>
							 		<c:if test="${(i.index)%4 == 3 }">
							 			</tr><tr>
							 		</c:if>
							 	</c:forEach>
						 	</tr>
						 </table>
					</td>
				</tr>				
				<tr>
					<td>
						<div style="margin-bottom: 10px;"> 
							<strong>원하시는 회사 규모는?</strong><br>
						</div>
						<select id="sel_1st" style="padding: 5px;">
							<option value="1명">1명</option>
							<option value="10명">10명</option>
							<option value="50명">50명</option>
							<option value="200명">200명</option>
							<option value="500명">500명</option>
							<option value="1,000명">1,000명</option>
							<option value="5,000명">5,000명</option>
							<option value="10,000명">10,000명</option>
						</select>
						&nbsp;~&nbsp;
						<select id="sel_2nd" style="padding: 5px;">
							<option value="10명">10명</option>
							<option value="50명">50명</option>
							<option value="200명">200명</option>
							<option value="500명">500명</option>
							<option value="1,000명">1,000명</option>
							<option value="5,000명">5,000명</option>
							<option value="10,000명">10,000명</option>
							<option value="10,000명 이상" selected>10,000+명</option>
						</select>
					</td>
				</tr>
			</table><br>
			
			<div style="text-align: right;">
				<input id="btn_save" type="button" value="저장하기" style="color: white; background-color: #0174b0;
						border: 1px solid; border-color: #0174b0; height: 40px; width: 90px; margin-right: 20px;">
			</div>
			<input id="btn_check" type="hidden" value="확인">
		</form>	
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
		지원한 채용공고?? (${appList.size() })
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
	
	<br><br>11
		
</div></div></div>		
		
<script>
$(document).ready(function(){
// 	console.log("%4 ? : " + test);
	// 업무분야 마우스오버.
	$(".div_job").on("mouseover", function(){
		$(this).css("background-color", "#f3f3f3");
	});
	$(".div_job").on("mouseout", function(){
		$(this).css("background-color", "white");
	});
	
	// 업무분야 클릭
	var cnt_choice = 0;
	var data_1st = ""; // 1순위 선택값
	var data_2nd = ""; // 2순위 선택값
	var data_3rd = ""; // 3순위 선택값
	
	$(".div_job").on("click", function(){
// 		alert($(".td_b:eq(2)").text());	
		if($(this).data("checkFlag") == 'f'){
			if(cnt_choice == 3){
				alert("업무분야는 3개까지 선택가능합니다.");
				return;
			}
			
			$(this).data("checkFlag", "t");
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-check-circle" style="color: #0174b0;"></i>&nbsp; <strong>'+ $(this).data("job") +'</strong>');
			
			// 선택한 값 표시하기.
			$(".td_b:eq("+ cnt_choice +")").html("<strong>"+ (cnt_choice+1) +"순위: "+ $(this).data("job") +"</strong>");
			
			cnt_choice++;
			
			if(cnt_choice == 1){
				data_1st = $(this).data("job");
			}else if(cnt_choice == 2){
				data_2nd = $(this).data("job");
			}else{
				data_3rd = $(this).data("job");
				
				// input hidden에 값 저장.
				$("#inte_type").val(data_1st+" / "+data_2nd+" / "+data_3rd);
			}
		}else{
			$(this).data("checkFlag", "f"); 			
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-circle" style="color: black;"></i>&nbsp; '+ $(this).data("job"));
			
			if(cnt_choice == 2 && $(this).data("job") == data_1st){
				$(".td_b:eq(0)").html("<strong>1순위: "+ data_2nd +"</strong>");
				data_1st = data_2nd;
				data_2nd = '';
			}else if(cnt_choice == 3 && $(this).data("job") == data_2nd){
				$(".td_b:eq(1)").html("<strong>2순위: "+ data_3rd +"</strong>");
				data_2nd = data_3rd;
				data_3rd = '';
			}else if(cnt_choice == 3 && $(this).data("job") == data_1st){
				$(".td_b:eq(0)").html("<strong>1순위: "+ data_2nd +"</strong>");
				$(".td_b:eq(1)").html("<strong>2순위: "+ data_3rd +"</strong>");
				data_1st = data_2nd;
				data_2nd = data_3rd;
				data_3rd = '';
			}
			
			cnt_choice--;			
			
			// 표시된 값 지우기.			
			$(".td_b:eq("+ cnt_choice +")").html((cnt_choice+1) +"순위: ");
						
			// input hidden 값 null로 설정.
			$("#inte_type").val(null);
		}
	});
	
	// 업무지역 마우스오버.
	$(".div_local").on("mouseover", function(){
		$(this).css("background-color", "#f3f3f3");
	});
	$(".div_local").on("mouseout", function(){
		$(this).css("background-color", "white");
	});	
	
	// 업무지역 클릭
	var cnt_local = 0;
	var local_1st = ""; // 1순위 선택값
	var local_2nd = ""; // 2순위 선택값
	var local_3rd = ""; // 3순위 선택값	
	
	$(".div_local").on("click", function(){
// 		alert($(".td_b:eq(2)").text());	
		if($(this).data("checkFlag") == 'f'){
			if($(this).data("local") == '전국'){
				if(confirm("희망 업무지역을 전국으로 설정하시겠습니까?")){
					$(this).data("checkFlag", "t");
					$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-check-circle" style="color: #0174b0;"></i>&nbsp; <strong>'+ $(this).data("local") +'</strong>');
					
					// div_local 전체를 확인 -> 'each()' - 선택된 값 해제.
					$(".div_local").each(function(){
						if($(this).data("local") != '전국' && $(this).data("checkFlag") == 't'){
							$(this).data("checkFlag", "f");
							$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-circle" style="color: black;"></i>&nbsp; '+ $(this).data("local"));
						}
					});
					
					$(".td_local:eq(0)").html("<strong>1순위: "+ $(this).data("local") +"</strong>");
					
					// 나머지 '---'로 표시
					$(".td_local:eq(1)").html("<strong>2순위: ---</strong>");
					$(".td_local:eq(2)").html("<strong>3순위: ---</strong>");
					
					cnt_local = 3;
					
					$("#inte_local").val($(this).data("local"));
					
					return;
				}
			}
			
			if(cnt_local == 3){
				alert("희망 업무지역은 3개까지 선택가능합니다.");
				return;
			}
			
			$(this).data("checkFlag", "t");
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-check-circle" style="color: #0174b0;"></i>&nbsp; <strong>'+ $(this).data("local") +'</strong>');
			
			// 선택한 값 표시하기.
			$(".td_local:eq("+ cnt_local +")").html("<strong>"+ (cnt_local+1) +"순위: "+ $(this).data("local") +"</strong>");
			
			cnt_local++;
			
			if(cnt_local == 1){
				local_1st = $(this).data("local");
			}else if(cnt_local == 2){
				local_2nd = $(this).data("local");
			}else{
				local_3rd = $(this).data("local");
				
				// input hidden에 값 저장.
				$("#inte_local").val(local_1st+" / "+local_2nd+" / "+local_3rd);
			}
		}else{
			$(this).data("checkFlag", "f"); 			
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-circle" style="color: black;"></i>&nbsp; '+ $(this).data("local"));
			
			if($(this).data("local") == '전국'){
				cnt_local = 0;
				local_1st = '';
				local_2nd = '';
				local_3rd = '';
				$(".td_local:eq(0)").html("1순위:");
				$(".td_local:eq(1)").html("2순위:");
				$(".td_local:eq(2)").html("3순위:");
				
				$("#inte_local").val(null);
				
				return;
			}
			
			if(cnt_local == 2 && $(this).data("local") == local_1st){
				$(".td_local:eq(0)").html("<strong>1순위: "+ local_2nd +"</strong>");
				local_1st = local_2nd;
				local_2nd = '';
			}else if(cnt_local == 3 && $(this).data("local") == local_2nd){
				$(".td_local:eq(1)").html("<strong>2순위: "+ local_3rd +"</strong>");
				local_2nd = local_3rd;
				local_3rd = '';
			}else if(cnt_local == 3 && $(this).data("local") == local_1st){
				$(".td_local:eq(0)").html("<strong>1순위: "+ local_2nd +"</strong>");
				$(".td_local:eq(1)").html("<strong>2순위: "+ local_3rd +"</strong>");
				local_1st = local_2nd;
				local_2nd = local_3rd;
				local_3rd = '';
			}
			
			cnt_local--;			
			
			// 표시된 값 지우기.			
			$(".td_local:eq("+ cnt_local +")").html((cnt_local+1) +"순위: ");
						
			// input hidden 값 null로 설정.
			$("#inte_local").val(null);
		}
	});	
	
	// 고용형태 클릭.
	var cnt_emp = 0;
	var emp_1st = ""; // 1순위 선택값
	var emp_2nd = ""; // 2순위 선택값
	
	$(".div_emp").on("click", function(){
		if($(this).data("checkFlag") == 'f'){
			if($(this).data("emp") == '모든 고용형태'){
				if(confirm("모든 고용형태로 설정하시겠습니까?")){
					$(this).data("checkFlag", "t");
					$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-check-circle" style="color: #0174b0;"></i>&nbsp; <strong>'+ $(this).data("emp") +'</strong>');
					
					// div_emp 전체를 확인 -> 'each()' - 선택된 값 해제.
					$(".div_emp").each(function(){
						if($(this).data("emp") != '모든 고용형태' && $(this).data("checkFlag") == 't'){
							$(this).data("checkFlag", "f");
							$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-circle" style="color: black;"></i>&nbsp; '+ $(this).data("emp"));
						}
					});
					
					$(".td_emp:eq(0)").html("<strong>1순위: "+ $(this).data("emp") +"</strong>");
					
					// 나머지 '---'로 표시
					$(".td_emp:eq(1)").html("<strong>2순위: ---</strong>");
					
					cnt_emp = 2;
					
					$("#inte_emptype").val($(this).data("emp"));
					
					return;
				}
			}
			
			if(cnt_emp == 2){
				alert("희망 고용형태는 2개까지 선택가능합니다.");
				return;
			}
			
			$(this).data("checkFlag", "t");
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-check-circle" style="color: #0174b0;"></i>&nbsp; <strong>'+ $(this).data("emp") +'</strong>');
			
			// 선택한 값 표시하기.
			$(".td_emp:eq("+ cnt_emp +")").html("<strong>"+ (cnt_emp+1) +"순위: "+ $(this).data("emp") +"</strong>");
			
			cnt_emp++;
			
			if(cnt_emp == 1){
				emp_1st = $(this).data("emp");
			}else if(cnt_emp == 2){
				emp_2nd = $(this).data("emp");
				
				// input hidden에 값 저장.
				$("#inte_emptype").val(emp_1st+" / "+emp_2nd);
			}
		}else{
			$(this).data("checkFlag", "f"); 			
			$(this).html('<i data-idx="'+ $(this).data("idx") +'" class="far fa-circle" style="color: black;"></i>&nbsp; '+ $(this).data("emp"));
			
			if($(this).data("emp") == '모든 고용형태'){
				cnt_emp = 0;
				emp_1st = '';
				emp_2nd = '';
				$(".td_emp:eq(0)").html("1순위:");
				$(".td_emp:eq(1)").html("2순위:");
				
				$("#inte_emp").val(null);
				
				return;
			}
			
			if(cnt_emp == 2 && $(this).data("emp") == emp_1st){
				$(".td_emp:eq(0)").html("<strong>1순위: "+ emp_2nd +"</strong>");
				emp_1st = emp_2nd;
				emp_2nd = '';
			}
			
			cnt_emp--;			
			
			// 표시된 값 지우기.			
			$(".td_emp:eq("+ cnt_emp +")").html((cnt_emp+1) +"순위: ");
						
			// input hidden 값 null로 설정.
			$("#inte_emp").val(null);
		}
	});	
	
	// 이직 의사 checkbox(toggle 버튼)
	$("#cb_move").on("click", function(){
// 		alert($("input:checkbox[id='cb_move']").is(":checked"));
		if($("input:checkbox[id='cb_move']").is(":checked") == true){
			var str_html = '<strong id="lb_txt">리크루터에게 하고 싶은 말</strong> <br>';
			str_html += '<textarea placeholder="리크루터들에게 알리고 싶은 점이 있으세요?"';
			str_html += 'id="txt_move" style="width: 750px; margin-top: 5px; height: 80px;"></textarea>';
			$("#td_txt").html(str_html);
		}else{
			$("#td_txt").html("");
		}
	});

	// inte_size 기본값.
	$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
	
	// 회사규모 ajax? 우선 jQuery로 sel_2nd의 옵션 변경하기.
	$("#sel_1st").on("change", function(){
		// select box ID로 접근하여 선택된 값 읽기 -> $("#[셀렉트박스ID] option:selected").val();
		//1명/10명/50명/200명/500명/1,000명/5,000명/10,000명
		if($("#sel_1st option:selected").val() == '1명'){
			$("#sel_2nd").html('<option value="10명">10명</option><option value="50명">50명</option><option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '10명'){
			$("#sel_2nd").html('<option value="50명">50명</option><option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '50명'){
			$("#sel_2nd").html('<option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '200명'){
			$("#sel_2nd").html('<option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '500명'){
			$("#sel_2nd").html('<option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '1,000명'){
			$("#sel_2nd").html('<option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '5,000명'){
			$("#sel_2nd").html('<option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
		}else if($("#sel_1st option:selected").val() == '10,000명'){
			$("#sel_2nd").html('<option value="10,000명 이상" selected>10,000+명</option>');
		}
		
		$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
	});
	
	$("#sel_2nd").on("change", function(){
		$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
	});
	
	// 스크롤 높이 입력. 유효성 실패시 해당 높이로 이동하도록.
	var scroll_value = 0;
	
	$(window).scroll(function(){
		scroll_value = $(document).scrollTop();
	});	
	
	// 임시 check 버튼.
	$("#btn_check").on("click", function(){
// 		alert("size? : " + $("#inte_size").val());
	});
		
	// 저장 버튼 클릭
	$("#btn_save").on("click", function(){
		if($("input:checkbox[id='cb_move']").is(":checked") == true){
			$("#change_flag").val("t");
		}else{
			$("#change_flag").val("f");
		}
		
		// 하고싶은말 유효성 체크. (이직의사 true인 경우)		
		if($("input:checkbox[id='cb_move']").is(":checked") == true){
			if($("#txt_move").val() == ""){
				alert("리크루터에게 하고 싶은 말을 입력해주세요.");
				
				// textarea로 focus 변경.
				$("#txt_move").focus();
				return;				
			}
		}
		
		$("#tell_content").val($("#txt_move").val());
		
		// 상태 유효성 체크.
		if($("#sel_cond option:selected").val() == '0'){
			alert("회원님의 상태를 선택해주세요.");
			
			// select로 focus 변경.
			$("#sel_cond").focus();
			return;
		}
		
		$("#job_condition").val($("#sel_cond option:selected").val());
		
		// 업무분야 유효성 체크.
		if($("#inte_type").val() == ""){
			alert("업무분야를 3순위까지 선택해주세요.");
			
			// 해당 위치로 스크롤 이동.
	 		$(window).scrollTop(($("#lb_type").offset().top) - 20);
			return;
		}
		
		// 업무지역 유효성 체크.
		if($("#inte_local").val() == ""){
			alert("업무지역을 3순위까지 선택해주세요.");
			
			// 해당 위치로 스크롤 이동.
	 		$(window).scrollTop(($("#lb_local").offset().top) - 20);
			return;
		}
		
		// 고용형태 유효성 체크.
		if($("#inte_emptype").val() == ""){
			alert("희망 고용형태를 2순위까지 선택해주세요.");
			
			// 해당 위치로 스크롤 이동.
	 		$(window).scrollTop(($("#lb_emp").offset().top) - 20);
			return;
		}
		
		// 값 확인 (이직의사, 하고싶은말, 상태, 업무분야, 업무지역, 고용형태, 회사규모)
// 		alert("이직의사 : " + $("input:checkbox[id='cb_move']").is(":checked"));
// 		alert("하고싶은말 : " + $("#txt_move").val());
// 		alert("상태 : " + $("#sel_cond option:selected").val());
// 		alert("업무분야 : " + $("#inte_type").val());
// 		alert("업무지역 : " + $("#inte_local").val());
// 		alert("고용형태 : " + $("#inte_emp").val());
// 		alert("회사규모 : " + $("#inte_size").val());
		
		$("#frm").submit();
	});
	
});
	

</script>	
	
</body>
</html>






