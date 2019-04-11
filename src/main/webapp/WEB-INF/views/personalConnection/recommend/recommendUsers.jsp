<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${userList }" var="user">
	<li>
		<div class="whiteBox">
			<div style="width: 108px;height: 108px;background-image:url(/profile?mem_id=${user.user_id});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 30px;border: 4px solid #E3EEF2;border-radius: 100px;"></div>
			<div><strong>${user.user_name}</strong></div>
			<div>${user.introduce}</div>
		</div>
		
	</li>
</c:forEach>