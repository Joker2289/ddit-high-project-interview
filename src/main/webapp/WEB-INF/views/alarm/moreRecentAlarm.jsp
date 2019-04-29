<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${nextRecentAlarm }" var="nextrecentAlarm">
  <div class="recentAlarm_contents" id="recentAlarm_contents${nextrecentAlarm.alarm_code }" data-code="${nextrecentAlarm.alarm_code }" style="min-height: 80px; border-bottom: 1px solid #ddd;">
    <div id="alarm${nextrecentAlarm.alarm_code }">
     <div class="profile_img" style="float: left;">
       <c:choose>
         <c:when test="${nextrecentAlarm.profile_path != null && nextrecentAlarm.mem_division == '1' }">
           <img class="user_profile_img" style="border: 1px solid #ddd;" src="${ cp }/view/imageView?mem_id=${nextrecentAlarm.send_id }&division=pf">
         </c:when>
         <c:when test="${nextrecentAlarm.profile_path != null && nextrecentAlarm.mem_division == '2' }">
           <img class="user_profile_img" style="border: 1px solid #ddd;" src="${nextrecentAlarm.profile_path }">
         </c:when>
         <c:otherwise>
           <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
         </c:otherwise>
       </c:choose>
     </div>
     <div class="alarm_view" id="alarm_view${nextrecentAlarm.alarm_code }" data-code="${nextrecentAlarm.alarm_code }" style="float: left;">
       <c:choose>
         <c:when test="${nextrecentAlarm.division == '28' && nextrecentAlarm.alarm_separate == '01' }">
           <h4 style="height: 30px; padding-top: 5px;">
             <a href="/postdetail?post_code=${nextrecentAlarm.ref_code }&mem_id=${nextrecentAlarm.mem_id }&ref_code=${nextrecentAlarm.ref_code }">
               <c:if test="${fn:length(nextrecentAlarm.send_name) >= 8 }">
                 ${fn:substring(nextrecentAlarm.send_name,0, 8) }... 님이 회원님의 게시글을 추천함
               </c:if> 
               <c:if test="${fn:length(nextrecentAlarm.send_name) < 8 }">
               	${nextrecentAlarm.send_name }님이 회원님의 게시글을 추천함
               </c:if>
             </a>
           </h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '28' && nextrecentAlarm.alarm_separate == '02' }">
           <h4 style="height: 30px; padding-top: 5px;">
             <a href="/postdetail?post_code=${nextrecentAlarm.ref_code }&mem_id=${nextrecentAlarm.mem_id }&ref_code=${nextrecentAlarm.ref_code }">
               <c:if test="${fn:length(nextrecentAlarm.send_name) >= 8 }">
                 ${fn:substring(nextrecentAlarm.send_name,0, 8) }... 님이 회원님의 게시글에 댓글을 남김
               </c:if> 
               <c:if test="${fn:length(nextrecentAlarm.send_name) < 8 }">
               	${nextrecentAlarm.send_name } 님이 회원님의 게시글에 댓글을 남김
               </c:if>
             </a>
           </h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '29' && nextrecentAlarm.alarm_separate == '03' }">
           <h4 style="height: 30px; padding-top: 5px;">
             <a href="/postdetail?post_code=${nextrecentAlarm.ref_code }&mem_id=${nextrecentAlarm.mem_id }&ref_code=${nextrecentAlarm.ref_code }">
               <c:if test="${fn:length(nextrecentAlarm.send_name) >= 8 }">
                 ${fn:substring(nextrecentAlarm.send_name,0, 8) }... 님이 회원님의 댓글을 추천함
               </c:if> 
               <c:if test="${fn:length(nextrecentAlarm.send_name) < 8 }">
               	${nextrecentAlarm.send_name } 님이 회원님의 댓글을 추천함
               </c:if>
             </a>
           </h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '25' && nextrecentAlarm.alarm_separate == '04' }">
           <h4 style="height: 30px; padding-top: 5px;">
             <a href="/profileHome?user_id=${nextrecentAlarm.send_id }">${nextrecentAlarm.send_name } 님이 회원님에게 일촌을 신청함</a>
           </h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '25' && nextrecentAlarm.alarm_separate == '05' }">
           <h4 style="height: 30px; padding-top: 5px;">
             <a href="/profileHome?user_id=${nextrecentAlarm.send_id }">${nextrecentAlarm.send_name } 님이 회원님의 일촌신청을 수락함</a>
           </h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '14' && nextrecentAlarm.alarm_separate == '06' }">
           <!-- 회원일 경우 회원 프로필로 링크 연결 -->
           <c:if test="${nextrecentAlarm.mem_division == 1 }">
             <h4 style="height: 30px; padding-top: 5px;">
               <a href="/profileHome?user_id=${nextrecentAlarm.send_id }">${nextrecentAlarm.send_name } 님이 회원님을 팔로우함</a>
             </h4>
           </c:if>
           <!-- 회사일 경우 회사 페이지로 링크 연결 -->
           <c:if test="${nextrecentAlarm.mem_division == 2 }">
             <h4 style="height: 30px; padding-top: 5px;">
               <a href="/corporation?corp_id=${nextrecentAlarm.send_id }">
                 <c:if test="${fn:length(nextrecentAlarm.send_name) >= 8 }">
                   ${fn:substring(nextrecentAlarm.send_name, 0, 8) }... 님이 회원님을 팔로우함
               	</c:if> 
                 <c:if test="${fn:length(nextrecentAlarm.send_name) < 8 }">
               	  ${nextrecentAlarm.send_name } 님이 회원님을 팔로우함
                 </c:if>
               </a>
             </h4>
           </c:if>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '2' && nextrecentAlarm.alarm_separate == '07' }">
           <h4 style="height: 30px; padding-top: 5px;">${nextrecentAlarm.send_name } 님이 채용공고에 지원함</h4>
         </c:when>
         <c:when test="${nextrecentAlarm.division == '34' && nextrecentAlarm.alarm_separate == '08' }">
           <a href="/recr_detail?recruit_code=${nextrecentAlarm.ref_code }">
             <h4 style="height: 30px; padding-top: 5px;">
			  <c:if test="${fn:length(nextrecentAlarm.send_name) >= 8 }">
			    ${fn:substring(nextrecentAlarm.send_name, 0, 8) }...님으로부터 새로운 채용공고가 검색됨
			  </c:if> 
			  <c:if test="${fn:length(nextrecentAlarm.send_name) < 8}">
			    ${nextrecentAlarm.send_name }님으로부터 새로운 채용공고가 검색됨
			  </c:if> 
			</h4>
           </a>
         </c:when>
       </c:choose>
     </div>
     
     <!-- 알림 관리버튼 드롭다운 -->
     <div class="dropdown col-time" style="float: right;">
       <div>
         <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
         </button>
         <ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel" style="margin-top: -30px;">
           <button id="btn_deleteAlarm${nextrecentAlarm.alarm_code }" type="button" class="btn_controll-list btn_deleteAlarm" data-code="${nextrecentAlarm.alarm_code }" data-division="recent">
             <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
           </button><br>
           <button id="btn_offAlarm" type="button" class="btn_controll-list">
             <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
           </button><br>
           <button id="btn_unfollow${nextrecentAlarm.alarm_code }" type="button" class="btn_controll-list btn_unfollow" data-code="${nextrecentAlarm.alarm_code }" data-division="recent" data-id="${recentAlarm.send_id }" data-name="${recentAlarm.send_name }">
             <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
           </button>
         </ul>
       </div>
       <p>
         <c:choose>
           <c:when test="${nextrecentAlarm.resultMinute <= 1 }">
             <span style="color: #8D9191;">방금 전</span>
           </c:when>
           <c:when test="${nextrecentAlarm.resultMinute < 60 }">
             <span style="color: #8D9191;">${recentAlarm.resultMinute }분</span>
           </c:when>
           <c:when test="${nextrecentAlarm.resultMinute < 1440 }">
             <span style="color: #8D9191;">${fn:split((nextrecentAlarm.resultMinute/60), '.')[0] }시간</span>
           </c:when>
           <c:when test="${nextrecentAlarm.resultMinute < 43200 }">
             <span style="color: #8D9191;">${fn:split((nextrecentAlarm.resultMinute/1440),'.')[0] }일</span>
           </c:when>
           <c:when test="${nextrecentAlarm.resultMinute < 518400 }">
             <span style="color: #8D9191;">${fn:split((nextrecentAlarm.resultMinute/43200),'.')[0] }달</span>
           </c:when>
         </c:choose>
       </p>
     </div>
   </div>
 </div>
</c:forEach>

<script>

	var recentCount = parseInt('${recentCount}');
	var previousCount = parseInt('${previousCount}');
	
	console.log("total recent count >>> " + recentCount);
	console.log("recentAlarm count >>> " + $(".recentAlarm_contents").length);
	
	
	if($(".recentAlarm_contents").length < recentCount){
		$("#btn_moreRecent").show();
	} else {
		$("#btn_moreRecent").hide();
	}
	
	if($(".recentAlarm_contents").length < previousCount){
		$("#btn_morePrevious").show();
	} else {
		$("#btn_morePrevious").hide();
	}
	
</script>