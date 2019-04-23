<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach items="${nextRecentAlarm }" var="recentAlarm">
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
         <c:when test="${recentAlarm.division == '28' && recentAlarm.alarm_separate == '01' }">
           <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님의 게시글을 추천함</h4>
         </c:when>
         <c:when test="${recentAlarm.division == '28' && recentAlarm.alarm_separate == '02' }">
           <h4 style="height: 30px; padding-top: 5px;">${recentAlarm.send_name } 님이 회원님의 게시글에 댓글을 남김</h4>
         </c:when>
         <c:when test="${recentAlarm.division == '29' && recentAlarm.alarm_separate == '03' }">
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