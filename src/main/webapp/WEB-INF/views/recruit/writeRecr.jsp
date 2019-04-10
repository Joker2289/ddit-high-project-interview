<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>111</title>
	<style type="text/css">
	</style>
	
</head>

<body>
<div class="container"><div class="row"><div>

	<!-- 레이아웃 잡는건 나중에.. -->
	<div class="col-md-12" >
		<div id="div_box" class="whiteBox" style="width: 1140px; margin-left: 10px; height: 62px; margin-bottom: 15px;
				text-align: center; padding-top: 10px; background-color: #edf1f5; border-bottom: 0px;
				font-size: 22px;">
			다른 곳에서는 찾을 수 없는 InterView만의 우수한 후보자들에게 다가가세요.	
		</div>
	</div>
	
	<table border="0" style="margin-bottom: 60px; margin-top: 22px; padding: 0px; margin-left: -2px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<h4 style="font-size: 22px; margin-left: 25px; margin-top: 14px;">직업 세부정보 입력</h4>
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
		

	});


</script>	
	
</body>
</html>






