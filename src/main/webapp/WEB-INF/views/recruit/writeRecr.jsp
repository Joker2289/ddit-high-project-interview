<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/recruit/writeRecr.css" type="text/css" rel="stylesheet">
	<title>111</title>
</head>

<body>
<div class="container"><div class="row"><div>
<br><br>
<table border="0" style="margin-bottom: 0px; margin-top: -40px; padding: 0px; margin-left: -1px;">
<tr>
<td style="vertical-align: top;">
<div class="col-md-12">
	<div class="whiteBox" style="width: 795px; vertical-align: middle;">
		<h4 id="txt_srList" style="font-size: 22px; margin-left: 25px; margin-top: 14px;
				margin-bottom: 14px;">
			<strong>채용공고 등록</strong>
		</h4>
	</div>
	<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: 0px;
			font-size: 15px; padding: 20px; font-size: 18px;">
		<form action="${pageContext.request.contextPath }/insertIntexxx" id="frm" method="post">	
			<input type="hidden" id="job_type" name="job_type">
			<input type="hidden" id="inte_local" name="inte_local">
			<input type="hidden" id="inte_emptype" name="inte_emptype">
			<input type="hidden" id="inte_size" name="inte_size">
			<input type="hidden" id="change_flag" name="change_flag">
			<input type="hidden" id="tell_content" name="tell_content">
			<input type="hidden" id="job_condition" name="job_condition">
			
			<input type="hidden" id="corp_id" name="corp_id">
			
			<table border="0" style="width: 750px;">
				<tr>
					<td style="padding-bottom: 35px;">
						<i class="fas fa-user-edit" style="color: #0174b0;"></i>
						<strong style="color: #0174b0;">
							적합한 후보자를 찾을 수 있도록 직무 내용을 입력해주세요.
						</strong> <br>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<div style="margin-bottom: 10px;"> 
							<strong>회사</strong>
						</div>
						<table>
							<tr style="border: 1px solid; border-color: #a6a6a6; border-radius: 15px;">
								<td id="td_comImg">
									<div style="width: 100px; height: 40px; text-align: center; padding-top: 8px;">
										<i class="fas fa-building" style="font-size: 22px;"></i>
									</div>
								</td>
								<td style="padding-left: 10px;" id="td_com">
									<input type="text" style="width: 400px; height: 50px; border: 0px;
											border-radius: 3px; padding: 5px;" id="txt_com" class="txt_com"
											placeholder="회사 검색"/>
									<div class="div_com"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<div style="margin-bottom: 10px;"> 
							<strong>채용공고명</strong><br>
						</div>
						<table>
							<tr style="border: 1px solid; border-color: #a6a6a6; border-radius: 15px;">
								<td id="">
									<div style="width: 100px; height: 40px; text-align: center; padding-top: 8px;">									
										<i class="fas fa-user-tie" style="font-size: 22px;"></i>	
									</div>
								</td>
								<td style="padding-left: 10px;" id="td_com">
									<input type="text" style="width: 400px; height: 50px; border: 0px;
											border-radius: 3px; padding: 5px;" id="" class=""
											placeholder="채용공고명"/>
								</td>
							</tr>
						</table>						
					</td>
				</tr>				
				<tr>
					<td style="padding-bottom: 30px;">
						<strong id="lb_type">업무분야</strong>
						 (가장 유사한 분야부터 세가지를 선택해주세요.)<br>
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
						<div style="margin-bottom: 10px;"> 
							<strong>업무내용</strong><br>
						</div>
						<textarea rows="4" cols="50" placeholder="업무 상세내용을 입력해주세요."></textarea>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<table border="0">
							<tr>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>모집기간1</strong><br>
									</div>
									<select id="" style="padding: 5px;">
										<option value="1">7일</option>
										<option value="2">15일</option>
										<option value="3">30일</option>
									</select>
								</td>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>모집인원</strong><br>
									</div>
									<select id="" style="padding: 5px;">
										<option value="1">O명</option>
										<option value="2">OO명</option>
										<option value="3">OOO명</option>
									</select>
								</td>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>직급</strong><br>
									</div>
									<select id="" style="padding: 5px;">
										<c:forEach begin="1" end="${rankList.size() }" varStatus="i">
											<option value="${rankList.get(i.index - 1).item_content }">
												${rankList.get(i.index - 1).item_content }
											</option>
										</c:forEach>
									</select>
								</td>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>고용형태</strong><br>
									</div>
									<select id="" style="padding: 5px;">
										<c:forEach begin="1" end="${empList.size() }" varStatus="i">
											<option value="${empList.get(i.index - 1) }">
												${empList.get(i.index - 1).item_content }
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<div style="margin-bottom: 10px;"> 
							<strong>간편지원?</strong><br>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<div style="margin-bottom: 10px;"> 
							<br><strong>현재 회원님의 상태는?</strong><br>
						</div>
						<select id="sel_cond" style="padding: 5px;">
							<option value="0" style="padding: 5px;">상태</option>
							<option value="1">적극적으로 지원하는 중</option>
							<option value="2">가끔 지원함</option>
							<option value="3" style="padding: 5px;">지원하고 있지 않지만 제안을 받는다면 고려할 것</option>
							<option value="4">원하고 있지 않고 기회가 생겨도 거절할 것</option>
						</select>
					</td>
				</tr>
			</table><br>
			
			<div style="text-align: right;">
				<input id="btn_save" type="button" value="저장하기" style="color: white; background-color: #0174b0;
						border: 1px solid; border-color: #0174b0; height: 40px; width: 90px; margin-right: 20px;">
			</div>
			<input id="btn_check" type="button" value="확인">
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
	
	<br><br>112233<i class="fas fa-user-tie"></i><i class="fas fa-map-marker-alt"></i>

</div></div></div>		
		
<script type="text/javascript">
$(document).ready(function(){
	console.log("corpList size? : ${corpList.size() }");
	
	$("#txt_com").on("click", function(){
		$("#txt_com").css("border-color", "#0174b0");
	});
	
	// 임시 확인 버튼
	$("#btn_check").on("click", function(){
// 		alert($("#hidden_size").val());
	});
	
	// 엔터키 누르면 드롭다운.
	$("#txt_com").keypress(function(e){
		if(e.which == 13){
			e.preventDefault();
			
			// 입력값 없을 시 alert
			if($("#txt_com").val() == ""){
				alert("검색어를 입력해주세요.");
				return;
			}
			
			// 드롭다운 열려있으면 return X -> 닫고 새로 열기.
			if($("#txt_com").attr("class") == 'txt_comOn'){
	        	$(".div_com").empty();
	        	$(".txt_comOn").attr('class','txt_com');
			}
			
			dropdownOn();
		}
	});		
	
	// 방향키 위/아래
	var list_idx = 0;
	
	$("#txt_com").keypress(function(e){
		if(e.which == 40){
			list_idx++;
			alert($(".list_item:eq("+ list_idx +")").data("name"));
		}
	});
	
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
				$("#job_type").val(data_1st+" / "+data_2nd+" / "+data_3rd);
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
			$("#job_type").val(null);
		}
	});	
});

function dropdownOn(){
	$(".txt_com").attr('class','txt_comOn');
	
	$.ajax({
		type : "POST",
    		url : "/comDropdown",
    		dataType : "HTML",
    		data : {"corp_name" : $("#txt_com").val()},
		success : function(result) {
			$(".div_com").append(result);
		}
	}); 	
}

$(document).on("click", function(e){
// 	alert($(e.target).data("name"));
	if (! $(e.target).closest(".txt_com").hasClass("txt_com")){
       	if($(e.target).closest(".txt_comOn").hasClass("txt_comOn")) {
        	$(".div_com").empty();
        	$(".txt_comOn").attr('class','txt_com');
       	}else if (! $(e.target).closest(".dropdown-menu").hasClass("dropdown-menu")){
       		$(".div_com").empty();
       		$(".txt_comOn").attr('class','txt_com');
       	}else if($(e.target).closest(".dropdown-menu").hasClass("dropdown-menu")){
			$("#td_comImg").html('<img height="40" src="'+ $(e.target).data("src") +'">');
			$("#txt_com").val($(e.target).data("name"));
			$("#corp_id").val($(e.target).data("corp_id"));
// 			alert($(e.target).data("corp_id"));
       		$(".div_com").empty();
       		$(".txt_comOn").attr('class','txt_com');
       	}
	}
});


</script>	
	
</body>
</html>






