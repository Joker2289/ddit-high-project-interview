<%@page import="com.sun.javafx.css.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div style="width: 219px;border-radius:5px; box-shadow: 0px 2px 4px #aaa; font-size: large;font-weight:400;padding: :3px 2px 0 30px"> 
    	<div style="background-color: #FFFFFFFF; height: 35px; border-top-left-radius: 5px;border-top-right-radius: 5px;  border: 1px solid #AAAAAA; padding: 10">
			<a href="<%=request.getContextPath()%>/corp/corporation?corp_id=${ corporationInfo.corp_id }"> <label style="margin-top: 5px">&emsp;홈</label></a><br> 
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px; height: 35px; border: 1px solid #AAAAAA;">
			<a href="javascript:insert_intro_page('${ corporationInfo.corp_id }')"> <label style="margin-top: 5px">&emsp;소개</label></a><br>
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px ; height: 35px;   border: 1px solid #AAAAAA;">
			<a href="javascript:insert_recr_page('${ corporationInfo.corp_id}')"> <label style="margin-top: 5px"> &emsp;채용</label></a><br>
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px; height: 35px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;  border: 1px solid #AAAAAA;">
			<a href="javascript:insert_empl_page('${ corporationInfo.corp_id}')"> <label style="margin-top: 5px"> &emsp;직원</label></a><br>
		</div>
	</div>
	

<script>

/* 소개 탭 클릭 */
function insert_intro_page(corp_id){
	
	$.ajax({
		url : "${cp}/corp/insert_intro_page",
		data : {"corp_id" : corp_id },
		success : function(data) {

			$('#content_area').html(data);			
		}
	});
}

/* 채용 탭 클릭 */
function insert_recr_page(corp_id){
	
	$.ajax({
		url : "${cp}/corp/insert_recr_page",
		data : {"corp_id" : corp_id },
		success : function(data) {
			$('#content_area').html(data);
		}
	});
}

/* 직원 탭 클릭 */
function insert_empl_page(corp_id){
	$.ajax({
		url : "${cp}/corp/insert_empl_page",
		data : { "corp_id" : corp_id },
		success : function(data) {
			
			$('#content_area').html(data);
			
		}
	});
}


</script>	
	