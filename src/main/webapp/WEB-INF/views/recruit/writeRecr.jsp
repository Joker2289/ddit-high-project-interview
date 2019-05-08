<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		<form action="${pageContext.request.contextPath }/insertRecr" id="frm" method="post">	
			<input type="hidden" id="corp_id" name="corp_id">
			<input type="hidden" id="recruit_title" name="recruit_title">
			<input type="hidden" id="job_type" name="job_type">
			<input type="hidden" id="recruit_contents" name="recruit_contents">
			<input type="hidden" id="recruit_period" name="recruit_period">
			<input type="hidden" id="personnel" name="personnel">
			<input type="hidden" id="job_rank" name="job_rank">
			<input type="hidden" id="emp_type" name="emp_type">
			<input type="hidden" id="app_type" name="app_type">
			
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
											border-radius: 3px; padding: 5px;" id="txt_title" class=""
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
						<textarea rows="4" cols="50" placeholder="업무 상세내용을 입력해주세요."
								id="txt_content"></textarea>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 30px;">
						<table border="0">
							<tr>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>모집기간</strong><br>
									</div>
									<select id="sel_period" style="padding: 5px;">
										<option value="7" selected>7일</option>
										<option value="15">15일</option>
										<option value="30">30일</option>
									</select>
								</td>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>모집인원</strong><br>
									</div>
									<select id="sel_personnel" style="padding: 5px;">
										<option value="O명" selected>O명</option>
										<option value="OO명">OO명</option>
										<option value="OOO명">OOO명</option>
									</select>
								</td>
								<td style="width: 187px;">
									<div style="margin-bottom: 10px;"> 
										<strong>직급</strong><br>
									</div>
									<select id="sel_rank" style="padding: 5px;">
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
									<select id="sel_emp" style="padding: 5px;">
										<c:forEach begin="1" end="${empList.size() }" varStatus="i">
											<option value="${empList.get(i.index - 1).item_content }">
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
					<td style="padding-bottom: 50px; padding-top: 20px;">
						<div style="margin-bottom: 10px;"> 
							<div style="color: #0174b0; float: left;">
								<div style="margin-bottom: 20px;">
									<strong style="color: black;">간편지원 설정여부</strong>
									<div class="can-toggle demo-rebrand-2" style="float: right; margin-right: 440px;">
										<input id="cb_move" type="checkbox">
										<label for="cb_move">
											<div class="can-toggle__switch" data-checked="2" data-unchecked="2"></div>
										</label>
									</div>				
								</div>					<!-- 이어서. app_type val() 설정 -->
								<img src="/images/logo/IV_LOGO.png" width="22">
								<strong>간편지원 기능을 이용해보세요. ( 지원자의 프로필을 한 번에 확인할 수 있습니다. )</strong>
							</div>
						</div>
					</td>
				</tr>
<!--  				<tr> -->
<!-- 					<td style="padding-bottom: 30px;"> -->
<!-- 						<div style="margin-bottom: 10px;">  -->
<!-- 							<br><strong>현재 회원님의 상태는?</strong><br> -->
<!-- 						</div> -->
<!-- 						<select id="sel_cond" style="padding: 5px;"> -->
<!-- 							<option value="0" style="padding: 5px;">상태</option> -->
<!-- 							<option value="1">적극적으로 지원하는 중</option> -->
<!-- 							<option value="2">가끔 지원함</option> -->
<!-- 							<option value="3" style="padding: 5px;">지원하고 있지 않지만 제안을 받는다면 고려할 것</option> -->
<!-- 							<option value="4">원하고 있지 않고 기회가 생겨도 거절할 것</option> -->
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
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
	<!-- newList -->
	<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 10px; height: 370px; margin-bottom: 20px;
			text-align: center; padding-top: 10px; font-size: 22px;">
		<div style="text-align: left; padding-left: 15px; padding-bottom: 7px; font-weight: bold; color: #0073b1;">
			<i class="fas fa-check" style="margin-right: 15px;"></i>신규 채용공고
		</div>
		<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;">
	   		<c:if test="${newList.size() >= 1 }">
	   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
	   					margin-left: -290px;">
				<c:forEach items="${newList }" varStatus="i" var="rRVo">
					<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
							margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
						<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
								border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
								data-code="${rRVo.recruit_code }">
							<div class="table_div" style="margin-left: 24px;">
								<c:choose>
									<c:when test="${ fn:contains(newImgList.get(i.index), 'http') }">
										<img src="${newImgList.get(i.index) }" width="200"> 
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${newIdList.get(i.index) }&division=pf" width="200">
									</c:otherwise>	
								</c:choose>												
							</div> <br>
							<strong>
								<c:choose>
									<c:when test="${rRVo.recruit_title.length() > 18 }">
										${rRVo.recruit_title.substring(0, 18) }...
									</c:when>
									<c:otherwise>
										${rRVo.recruit_title }
									</c:otherwise>
								</c:choose>
							</strong> <br>
							${newNmList.get(i.index) } <br>
							${rRVo.job_local } <br>
							${rRVo.job_type }
						</div>
						<div style="padding-top: 10px; color: #2f7b15;">
							${newTimeList.get(i.index) } 전
						</div>
					</div></li>
				</c:forEach>
				</ul>
			</c:if>
		</div>
		<div style="text-align: center; font-size: 13px; padding-top: 15px;">
			<i onmouseover="" class="fas fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i><i onmouseover="" class="far fa-circle fafa"></i>				
		</div>
	</div>
	<!-- newList -->
</div>			
</td>
</tr>
</table><br><br>
	
	1122<i class="fas fa-user-tie"></i><i class="fas fa-map-marker-alt"></i>

</div></div></div>		
		
<script type="text/javascript">
////////////////////////////newList

// div_newList 마우스오버 시 false - 슬라이드 멈춤.
var newSlide_flag = true;	

// 자동 슬라이드
var newSlide_width = 290;
var newList_num = 1;

function fn_newSlide(){
	if(newSlide_flag == false){
		return;
	}
	
	if(newList_num > 6){
//			clearInterval(slide_switch);
		$("#content_newList").css("margin-left", "0px");
		newList_num = 0;
	}
	
	newList_num++;
	
	$("#content_newList").stop(true, true);
	var moveX = parseInt($("#content_newList").css("margin-left"));
	
	if( moveX > -2000 ){
		// 버튼 class 바꾸기.
		if(newList_num == 1){
			$(".fafa:eq(6)").attr("class", "far fa-circle fafa");
			$(".fafa:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle fafa");
		}else{
			$(".fafa:eq("+ (newList_num-2) +")").attr("class", "far fa-circle fafa");
			$(".fafa:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle fafa");
		}
		
		$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
	}
}	

//////////////////////////// newList

$(document).ready(function(){
// 	console.log("flag? : ${alphabet_flag }");

		//////////////////////////// newList
		// newList 슬라이드
		newList_slide = setInterval("fn_newSlide()", 4000);
		
		// newList 마우스오버 - 슬라이드 멈춤.
		$("#div_newList").on("mouseover", function(){
			newSlide_flag = false;
		});
		$("#div_newList").on("mouseout", function(){
			newSlide_flag = true;
		});		
		
		// newList 슬라이드 버튼 클릭.
		$(".fafa").on("click", function(){
// 			alert($(this).index());
			$(".fafa:eq("+ (newList_num-1) +")").attr("class", "far fa-circle fafa");
			$(this).attr("class", "fas fa-circle fafa");	
			
			// 이동할 칸 수. (move_page)
			var move_page = ($(this).index()) - (newList_num-1);
			
			// newList_num 변경.
			newList_num = ($(this).index())+1;
			
			// 슬라이드 이동.
			$("#content_newList").stop(true, true);
			var moveX = parseInt($("#content_newList").css("margin-left"));
			
			if( moveX > -3000 ){
				$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
			}
		});
		
		// 채용공고 클릭.
		$(".recr").on("click", function(){
			window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=personal';
		});		
		
		//////////////////////////// newList

	$("#txt_com").on("click", function(){
		$("#txt_com").css("border-color", "#0174b0");
	});
	
	// 임시 확인 버튼
	$("#btn_check").on("click", function(){
		alert($("#sel_rank").val());
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
	
	// 방향키 위/아래. 이상하게 'text'에서 방향키 아래 이벤트가 안되네.
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


// 저장 버튼 클릭
$("#btn_save").on("click", function(){
	// 회사 유효성 체크.	
	if($("#corp_id").val() == ''){
		alert("회사를 선택해주세요.");
		
		// 회사 text로 focus 변경.
		$("#txt_com").focus();
		return;				
	}
	
	// 채용공고명 유효성 체크.
	if($("#txt_title").val() == ''){
		alert("채용공고명을 입력해주세요.");
		
		// txt_title로 focus 변경.
		$("#txt_title").focus();
		return;
	}
	
	$("#recruit_title").val($("#txt_title").val());
	
	// 업무분야 유효성 체크.
	if($("#job_type").val() == ""){
		alert("업무분야를 3순위까지 선택해주세요.");
		
		// 해당 위치로 스크롤 이동.
 		$(window).scrollTop(($("#lb_type").offset().top) - 20);
		return;
	}
	
	// 업무내용 유효성 체크.
	if($("#txt_content").val() == ''){
		alert("업무내용을 입력해주세요.");
		
		// 해당 위치로 focus 이동.
		$("#txt_content").focus();
		return;
	}
	
	$("#recruit_contents").val($("#txt_content").val());
	
	$("#recruit_period").val($("#sel_period option:selected").val());
	$("#personnel").val($("#sel_personnel option:selected").val());
	$("#job_rank").val($("#sel_rank option:selected").val());
	$("#emp_type").val($("#sel_emp option:selected").val());
	
	// 간편지원
	if($("input:checkbox[id='cb_move']").is(":checked") == true){
		$("#app_type").val("t");
	}else{
		$("#app_type").val("f");
	}	
	
	// 값 확인 (회사, 채용공고명, 업무분야, 업무내용, 모집기간, 모집인원, 직급, 고용형태)
// 	alert("회사 : " + $("#corp_id").val());
// 	alert("채용공고명 : " + $("#recruit_title").val());
// 	alert("업무분야 : " + $("#job_type").val());
// 	alert("업무내용 : " + $("#recruit_contents").val());
// 	alert("모집기간 : " + $("#recruit_period").val());
// 	alert("모집인원 : " + $("#personnel").val());
// 	alert("직급 : " + $("#job_rank").val());
// 	alert("고용형태 : " + $("#emp_type").val());
// 	alert("간편지원 : " + $("#app_type").val());
	
	$("#frm").submit();
});


</script>	
	
</body>
</html>






