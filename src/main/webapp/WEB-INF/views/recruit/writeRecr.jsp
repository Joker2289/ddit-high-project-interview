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
							적합한 후보자를 찾을 수 있도록 직무 내용을 입력해주세요.
						</strong> <br>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 20px;">
						<strong>회사11</strong><br>
						<table border="1">
							<tr>
								<td>
									<div style="width: 100px; height: 40px; text-align: center; padding-top: 8px;">
										<i class="fas fa-building" style="font-size: 22px;"></i>
									</div>
								</td>
								<td style="padding-left: 10px;">
									<input type="text" style="width: 400px; height: 50px; border: 1px solid; border-color: #a6a6a6;
											border-radius: 3px; padding: 5px;" id="txt_com" />
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
							 					data-job="${jobList.get(i.index - 1) }">
							 				<i class="far fa-circle"></i>
							 				&nbsp;${jobList.get(i.index - 1) }
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
						<select id="sel_1st">
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
						<select id="sel_2nd">
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
	
	<br><br>11




	<table border="0" style="margin-bottom: 60px; margin-top: 22px; padding: 0px; margin-left: -2px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<h4 style="font-size: 22px; margin-left: 25px; margin-top: 14px;">직업 세부정보 입력1</h4>
					</div>
					<div class="whiteBox" style="width: 795px; border-top: 0px; margin-top: 0px; padding: 10px;">
						<table border="1" style="width: 775px;">
							<tr>
								<td>
									회사<br>
									<div style="border: 1px solid;">
										<i class="fas fa-building"></i>
										<input type="text">
									</div>
								</td>
								<td>
									직무<br>
									<div style="border: 1px solid;">
										<i class="fas fa-user-tie"></i>
										<input type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									위치<br>
									<div style="border: 1px solid;">
										<i class="fas fa-map-marker-alt"></i>
										<input type="text">
									</div>
								</td>
								<td>
									업무<br>
									<div style="border: 1px solid;">
										<input type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									고용 형태<br>
									<div style="border: 1px solid;">
										<i class="fas fa-map-marker-alt"></i>
										<input type="text">
									</div>
								</td>
								<td>
									회사 업계<br>
									<div style="border: 1px solid;">
										<input type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									업무 설명<br>
									<div style="border: 1px solid;">
										<i class="fas fa-map-marker-alt"></i>
										<input type="text">
									</div>
								</td>
								<td>
									기타<br>
									<div style="border: 1px solid;">
										<input type="text">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>			
			</td>
			<td style="vertical-align: top; margin-left: 0px;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 330px; margin-left: -14px; font-size: 20px; padding-bottom: 7px;
							padding-top: 7px; padding-left: 7px;">
						적합한 후보자를 찾을 수 있도록 ...
					</div>
					<div class="whiteBox" style="width: 330px; margin-left: -14px; margin-top: -1px; padding-bottom: 2px;">
						<table border="0" style="margin-left: 10px; width: 310px; margin-top: 10px;">
							<c:forEach begin="1" end="${appList.size() }" varStatus="i">
								<tr>
									<td id="app${i.index }" onmouseover="" style="cursor: pointer; 
											border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 7px; 
											padding-top: 0px; padding-left: 4px;">
										<img src="${corpImgList_app.get(i.index - 1) }" width="150"><br>
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
	
	
	
	
	<br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
		
</div></div></div>		
		
		
<script type="text/javascript">
$(document).ready(function(){
	console.log("docu");
	
	$("#txt_com").on("click", function(){
		$("#txt_com").css("border-color", "#0174b0");
	});
	
	// 임시 확인 버튼
	$("#btn_check").on("click", function(){
		
	});
});


</script>	
	
</body>
</html>






