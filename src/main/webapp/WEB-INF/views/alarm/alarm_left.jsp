<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div id="alarm_leftmenu" class="col-md-3">
      <div id="alarm_leftmenuBox" class="whiteBox">
        <div class="alarm-left" style="padding: 5px; text-align: center;">
          <h4>알림</h4>
          <c:choose>
            <c:when test="${newAlarmCount == 'no' }">
	          <h4 style="color: #8D9191;font-weight: bold;">새로운 알림이 없습니다.</h4>
            </c:when>
            <c:otherwise>
	          <h4 style="color: #8D9191;font-weight: bold;"><span>${newAlarmCount }</span>개의 새로운<br>알림이 있습니다.</h4>
            </c:otherwise>
          </c:choose>
          
        </div>
	  </div>
  	</div>