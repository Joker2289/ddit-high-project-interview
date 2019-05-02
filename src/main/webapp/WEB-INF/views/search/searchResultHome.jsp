<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/searchResult/searchResultHome.css" rel="stylesheet">
<div class="container">
	<div class="row">
		<div class="col-md-10" style="border: 0px solid #333333; height: 100px;">
			<div id="div_box" class="whiteBox">
			<input id="search_word" type="hidden" value="${search_word }">
			
				
				
				<div class="col-result">
					<div class="col-corpResult_top" style="border-bottom: 1px solid #ddd;">
						<h4 style="color: #8D9191; padding-left: 10px; padding-bottom: 10px; font-weight: bold; margin-bottom: 0px; padding-top: 10px; display: inline-block; width: 88%;">업체 검색결과  ${corpCount }건</h4>
						<button id="btn_allCorp" class="btn_more_result">모두 보기</button>
					</div>
					<div class="result_corp">
						<%@ include file="/WEB-INF/views/search/corpSearchResult.jsp" %>
					</div>
					
					<div class="result_user">
						<div class="col-userResult_top" style="border-bottom: 1px solid #ddd;">
							<h4 style="color: #8D9191;padding-left: 10px;padding-bottom: 10px; font-weight: bold; margin-bottom: 0px; padding-top: 10px; display: inline-block; width: 88%;">관련 인물 검색결과 ${userCount }건</h4>
							<button id="btn_allUser" class="btn_more_result">모두 보기</button>
						</div>
						<div class="result_user_container">
						<%@ include file="/WEB-INF/views/search/userSearchResult.jsp" %>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
	var search_word   = $("#search_word").val();
	var userCount 	  = ${userCount};
	var corpCount 	  = ${corpCount};
	var currUserCount = $(".user_info").length;
	var currCropCount = $(".corp_info").length;	
	
	if(userCount == currUserCount){
		$("#btn_allUser").hide();
	}
	if(corpCount == currCropCount){
		$("#btn_allCorp").hide();
	}
	
	//회사 팔로우
	var corp_id = "";
	$(document).on("click", ".btn_follow", function() {
		corp_id = $(this).attr("data-corp");
		
		$.ajax({
			type : 'POST',
			url : '/corp_follow',
			data : {"target_id" : corp_id}
		});
		$(this).attr('class', 'btn_unfollow');
		$(this).attr('value', '팔로우 중');

	});
	
	//회사 언팔로우
	$(document).on("click", ".btn_unfollow", function() {
		corp_id = $(this).attr("data-corp");
		
		$.ajax({
			type : 'POST',
			url : '/corp_unfollow',
			data : {"target_id" : corp_id}
		});
		$(this).attr('class', 'btn_follow');
		$(this).attr('value', '팔로우');
	});
	
	//일촌맺기
	var user_id = "";
	$(document).on("click", ".btn_connect", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_connect',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_disconnect');
		$(this).attr('value', '일촌수락 대기');
	});

	//일촌끊기
	$(document).on("click", ".btn_disconnect", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_disconnect',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_connect');
		$(this).attr('value', '일촌 맺기');
	});
	
	//일촌수락 대기 -> 취소
	$(document).on("click", ".btn_waiting", function() {
		user_id = $(this).attr("data-user");
		
		$.ajax({
			type : 'POST',
			url : '/user_waiting_delete',
			data : {"target_id" : user_id}
		});
		$(this).attr('class', 'btn_connect');
		$(this).attr('value', '일촌 맺기');
	});
	
	//회사 모두보기 이벤트
	$("#btn_allCorp").on("click", function() {
		$("#btn_allCorp").hide();
		
		$.ajax({
			type : 'POST',
			url : '/corpsearchresult',
			data : {"search_word" : search_word},
			success : function(data) {
				console.log(data);
				$(".result_corp").html(data);
            }
		});
		
	});
	
	//회원 모두보기 이벤트
	$("#btn_allUser").on("click", function() {
		$("#btn_allUser").hide();
		
		$.ajax({
			type : 'POST',
			url : '/usersearchresult',
			data : {"search_word" : search_word},
			success : function(data) {
				console.log(data);
				$(".result_user_container").html(data);
            }
		});
		
	});
	
</script>