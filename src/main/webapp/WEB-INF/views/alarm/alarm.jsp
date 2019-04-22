<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/css/alarm/alarm.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
  <div class="row">
    <%@ include file="/WEB-INF/views/alarm/alarm_left.jsp" %>
  
	<div class="col-md-6" style="margin-right: -25px; ">
	  <div class="row">
	  
		<div class="col-md-12">
		  <div id="division" class="whiteBox" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_recent" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		      <h4 style="margin-bottom: 5px; margin-top: 5px;">최근</h4>
		    </div>
			<div class="alarm_contents" style="min-height: 80px; border-bottom: 1px solid #ddd;">
			  <div class="profile_img" style="float: left;">
			    <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
			  </div>
			  <div class="alarm_view" style="float: left;">
			    <h4 style="height: 30px; padding-top: 5px;">박정권 님 외 1명이 회원님의 게시글을 추천함</h4>
			  </div>
			  <div class="dropdown" style="float: right;">
			    <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			      <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
			    </button>
				<ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel">
				  <button id="btn_deleteAlarm" type="button" class="btn_controll-list">
				    <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
				  </button><br>
				  <button id="btn_offAlarm" type="button" class="btn_controll-list">
				    <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
				  </button><br>
				  <button id="btn_unfollow" type="button" class="btn_controll-list">
				    <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
				  </button>
				</ul>
			  </div>
			</div>
		  </div>
		  
		  <div id="division" class="whiteBox" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_recent" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		      <h4 style="margin-bottom: 5px; margin-top: 5px;">이전</h4>
		    </div>
			<div class="alarm_contents" style="min-height: 80px; border-bottom: 1px solid #ddd;">
			  <div class="profile_img" style="float: left;">
			    <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
			  </div>
			  <div class="alarm_view" style="float: left;">
			    <h4 style="height: 30px; padding-top: 5px;">박정권 님 외 1명이 회원님의 게시글에 댓글을 남김</h4>
			  </div>
			  <div class="alarm_contoll" style="float: right;">
			    <button class="btn_alarmControll" style="width: 30px;"><i class="fas fa-ellipsis-h" style="font-size: 18px;"></i></button>
			  </div>
			</div>
		  </div>
		</div>
		
	  </div>
	</div>
  	
    <%@ include file="/WEB-INF/views/timeline/timeline_right.jsp" %>
  </div>
</div>
    