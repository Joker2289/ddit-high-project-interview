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
	  
		<div class="col-md-12" style="width: 575px;">
		
		  <!-- 최근 알림 --><!-- recentList -->
		  <div id="division_recent" class="whiteBox division_recent" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_recent-area">
		      <div class="alarm_recent" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		        <h4 style="margin-bottom: 5px; margin-top: 5px;">최근</h4>
		      </div>
		      
		      <c:forEach items="${recentList }" var="recentAlarm">
		        <div class="recentAlarm_contents" id="recentAlarm_contents${recentAlarm.alarm_code }" data-code="${recentAlarm.alarm_code }" style="min-height: 80px; border-bottom: 1px solid #ddd;">
		          <div id="alarm${recentAlarm.alarm_code }">
		  	        <div class="profile_img" style="float: left;">
		  	          <c:choose>
		  	            <c:when test="${recentAlarm.profile_path != null }">
		  	              <img class="user_profile_img" style="border: 1px solid #ddd;" src="${recentAlarm.profile_path }">
		  	            </c:when>
		  	            <c:otherwise>
		  	              <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
		  	            </c:otherwise>
		  	          </c:choose>
		  	        </div>
		  	        <div class="alarm_view" id="alarm_view${recentAlarm.alarm_code }" data-code="${recentAlarm.alarm_code }" style="float: left;">
		  	          <c:choose>
		  	            <c:when test="${recentAlarm.division == '15' && recentAlarm.alarm_separate == '01' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님의 게시글을 추천함</h4>
		  	            </c:when>
		  	            <c:when test="${recentAlarm.division == '29' && recentAlarm.alarm_separate == '02' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님의 게시글에 댓글을 남김</h4>
		  	            </c:when>
		  	            <c:when test="${recentAlarm.division == '15' && recentAlarm.alarm_separate == '03' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님의 댓글을 추천함</h4>
		  	            </c:when>
		  	            <c:when test="${recentAlarm.division == '25' && recentAlarm.alarm_separate == '04' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님에게 일촌을 신청함</h4>
		  	            </c:when>
		  	            <c:when test="${recentAlarm.division == '14' && recentAlarm.alarm_separate == '05' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님을 팔로우함</h4>
		  	            </c:when>
		  	            <c:when test="${recentAlarm.division == '02' && recentAlarm.alarm_separate == '06' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 채용공고에 지원함</h4>
		  	            </c:when>
		  	          </c:choose>
		  	        </div>
		  	        
		  	        <!-- 알림 관리버튼 드롭다운 -->
		  	        <div class="dropdown" style="float: right;">
		  	          <div>
		  	            <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  	              <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
		  	            </button>
		  	            <ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel" style="margin-top: -30px;">
		  		          <button id="btn_deleteAlarm${recentAlarm.alarm_code }" type="button" class="btn_controll-list btn_deleteAlarm" data-code="${recentAlarm.alarm_code }" data-division="recent">
		  		            <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
		  		          </button><br>
		  		          <button id="btn_offAlarm" type="button" class="btn_controll-list">
		  		            <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
		  		          </button><br>
		  		          <button id="btn_unfollow${recentAlarm.alarm_code }" type="button" class="btn_controll-list btn_unfollow" data-code="${recentAlarm.alarm_code }" data-division="recent" data-id="${recentAlarm.send_id }" data-name="${recentAlarm.send_name }">
		  		            <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
		  		          </button>
		  		        </ul>
		  	          </div>
		  	          <p>
                        <c:choose>
                          <c:when test="${recentAlarm.resultMinute <= 1 }">
                            <span style="color: #8D9191;">방금 전</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 60 }">
                              <span style="color: #8D9191;">${recentAlarm.resultMinute }분</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 1440 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/60), '.')[0] }시간</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 43200 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/1440),'.')[0] }일</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 518400 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/43200),'.')[0] }달</span>
                          </c:when>
                        </c:choose>
		  	          </p>
		  	        </div>
		  	      </div>
		  	    </div>
		      </c:forEach>
		    </div>
		    
		    <!-- 더보기 버튼 -->
		    <div class="col-moreAlarm">
	    	  <button class="btn_moreAlarm" id="btn_moreRecent">
	    	    <span style="font-size: 17px;">더보기 </span>
	    	  </button>
		    </div>
		  </div>
		  
		  <!-- 이전 알림 --><!-- previousList -->
		  <div id="division_previous" class="whiteBox" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_previous-area">
		      <div class="alarm_previous" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		        <h4 style="margin-bottom: 5px; margin-top: 5px;">이전</h4>
		      </div>
		      
			  <c:forEach items="${previousList }" var="previousAlarm">
		        <div class="previousAlarm_contents" id="alarm_contents${previousAlarm.alarm_code }" data-code="${previousAlarm.alarm_code }" style="min-height: 80px; border-bottom: 1px solid #ddd;">
			      <div id="alarm${recentAlarm.alarm_code }">
			        <div class="profile_img" style="float: left;">
			          <c:choose>
			            <c:when test="${previousAlarm.profile_path != null }">
			              <img class="user_profile_img" style="border: 1px solid #ddd;" src="${previousAlarm.profile_path }">
			            </c:when>
			            <c:otherwise>
			              <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
			            </c:otherwise>
			          </c:choose>
			        </div>
			        <div class="alarm_view" id="alarm_view${previousAlarm.alarm_code }" data-code="${previousAlarm.alarm_code }" style="float: left;">
			          <c:choose>
			            <c:when test="${previousAlarm.division == '15' && previousAlarm.alarm_separate == '01' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 회원님의 게시글을 추천함</h4>
			            </c:when>
			            <c:when test="${previousAlarm.division == '29' && previousAlarm.alarm_separate == '02' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 회원님의 게시글에 댓글을 남김</h4>
			            </c:when>
			            <c:when test="${previousAlarm.division == '15' && previousAlarm.alarm_separate == '03' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 회원님의 댓글을 추천함</h4>
			            </c:when>
			            <c:when test="${previousAlarm.division == '25' && previousAlarm.alarm_separate == '04' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 회원님에게 일촌을 신청함</h4>
			            </c:when>
			            <c:when test="${previousAlarm.division == '14' && previousAlarm.alarm_separate == '05' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 회원님을 팔로우함</h4>
			            </c:when>
			            <c:when test="${previousAlarm.division == '02' && previousAlarm.alarm_separate == '06' }">
			              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 채용공고에 지원함</h4>
			            </c:when>
			          </c:choose>
			        </div>
			      
			        <!-- 알림 관리버튼 드롭다운 -->
			        <div class="dropdown" style="float: right; min-width: 45px; max-width: 45px;">
			          <div>
			            <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			              <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
			            </button>
			            <ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel" style="margin-top: -30px;">
			    	        <button id="btn_deleteAlarm" type="button" class="btn_controll-list" data-code="${previousAlarm.alarm_code }" data-division="previous">
			    	          <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
			    	        </button><br>
			    	        <button id="btn_offAlarm" type="button" class="btn_controll-list">
			    	          <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
			    	        </button><br>
			    	        <button id="btn_unfollow" type="button" class="btn_controll-list" data-code="${previousAlarm.alarm_code }" data-division="previous" data-id="${previousAlarm.send_id }" data-name="${previousAlarm.send_name }">
			    	          <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
			    	        </button>
			    	      </ul>
			          </div>
			    	  <p>
                        <c:choose>
                          <c:when test="${previousAlarm.resultMinute <= 1 }">
                            <span style="color: #8D9191;">방금 전</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 60 }">
                              <span style="color: #8D9191;">${previousAlarm.resultMinute }분</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 1440 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/60), '.')[0] }시간</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 43200 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/1440),'.')[0] }일</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 518400 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/43200),'.')[0] }달</span>
                          </c:when>
                        </c:choose>
			          </p>
			        </div>
			      </div>  
			    </div>
		      </c:forEach>
		    </div>
		    
			<div class="col-moreAlarm">
	    	  <button class="btn_moreAlarm" id="btn_morePrevious">
	    	    <span style="font-size: 17px;">더보기 </span>
	    	  </button>
		    </div>
		    
		  </div>
		</div>
		
	  </div>
	</div>
  	
    <%@ include file="/WEB-INF/views/alarm/alarm_right.jsp" %>
  </div>
</div>

<script>

	$("#btn_moreRecent").hide();
	$("#btn_morePrevious").hide();
	var recentCount = parseInt(${recentCount});
	var previousCount = parseInt(${recentCount});
	
	if($(".recentAlarm_contents").length < recentCount){
		$("#btn_moreRecent").show();
	}
	
	if($(".recentAlarm_contents").length < previousCount){
		$("#btn_morePrevious").show();
	}
	
	var recentPageNum = 2;
	var lastRecentAlarm = "";
	$("#btn_moreRecent").on("click", function() {
		lastAlarm = $(".recentAlarm_contents").attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/nextrecentalarm',
			data : {"alarm_code" : lastRecentAlarm, "pageNum" : recentPageNum},
			success : function(data) {
				
				recentPageNum++;
				if(data != ""){
					$(".alarm_recent-area").append(data);
				}
			   
			}
		});
	});
	
	var previousPageNum = 2;
	var lastPreviousAlarm = "";
	$("#btn_previousRecent").on("click", function() {
		lastAlarm = $(".previousAlarm_contents").attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/nextpreviousalarm',
			data : {"alarm_code" : lastPreviousAlarm, "pageNum" : previousPageNum},
			success : function(data) {
				
				previousPageNum++;
				if(data != ""){
					$(".alarm_previous-area").append(data);
				}
			   
			}
		});
	});
	
	var delete_code = "";
	$(".btn_deleteAlarm").on("click", function() {
		delete_code = $(this).attr('data-code');
		
		if($(this).attr('data-division') == 'recent'){
			$.ajax({
				type : 'POST',
				url : '/deletealarm',
				data : {"alarm_code" : delete_code},
				success : function(data) {
					
					console.log("recent >> "+data);
					$('#alarm'+delete_code).remove();
					$('#recentAlarm_contents'+delete_code).append('<div><h4 style="margin-top:15px;">해당 알림을 삭제했습니다.</h4></div>');
				}
			});
		} else {
			$.ajax({
				type : 'POST',
				url : '/deletealarm',
				data : {"alarm_code" : delete_code},
				success : function(data) {
					
					console.log("recent >> "+data);
					$('#alarm'+delete_code).remove();
					$('#previousAlarm_contents'+delete_code).append('<div><h4 style="margin-top:15px;">해당 알림을 삭제했습니다.</h4></div>');
				}
			});
		}
	});
	
	var mem_id = "";
	var send_name = "";
	var alarm_code = "";
	$(".btn_unfollow").on("click", function() {
		mem_id 	   = $(this).attr('data-id');
		send_name  = $(this).attr('data-name');
		alarm_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/unfollow',
			data : {"target_id" : mem_id},
			success : function(data) {
	            
	        	$('#alarm'+alarm_code).remove();
	        	$('#recentAlarm_contents'+alarm_code).append('<div><h4 style="margin-top:15px;">' + send_name + '님을 언팔로우 했습니다.</h4></div>');
	            
			 }
		});
	});
	
</script>