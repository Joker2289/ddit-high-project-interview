<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">${usersVo.user_name }</h4>
</div>
<div class="modal-body">
	<h4 style="margin-bottom: 20px; font-size: 17px;">연락처</h4>
	<c:if test="${not empty usersVo.zipcode}">
		<label style="font-size: 17px; font-weight: 700;"><span style="font-size: 20px; color: #666666;"><i class="fas fa-home" style="width: 40px;"></i></span>주소</label><br>
		<label style="padding-left: 40px;font-size: 15px; color: #0073b1;">${usersVo.zipcode } ${usersVo.addr1 } ${usersVo.addr2 }</label><br><br>
	</c:if>
	<c:if test="${not empty usersVo.email}">
		<label style="font-size: 17px; font-weight: 700;"><span style="font-size: 20px; color: #666666;"><i class="fas fa-envelope-open-text" style="width: 40px;"></i></span>이메일</label><br>
		<label style="padding-left: 40px;font-size: 15px; color: #0073b1;">${usersVo.email }</label><br><br>
	</c:if>
	
	<c:if test="${not empty usersVo.telno}">
		<label style="font-size: 17px; font-weight: 700;"><span style="font-size: 20px; color: #666666;"><i class="fas fa-mobile-alt" style="width: 40px;"></i></span>전화번호</label><br>
		<label style="padding-left: 40px;font-size: 15px; color: #0073b1;">${usersVo.telno }</label><br><br>
	</c:if>
	
	<c:if test="${not empty usersVo.user_birth}">
		<fmt:formatDate value="${usersVo.user_birth}" pattern="yyyy년MM월dd일" var="birth"/>
		<label style="font-size: 17px; font-weight: 700;"><span style="font-size: 20px; color: #666666;"><i class="fas fa-birthday-cake" style="width: 40px;"></i></span>생년월일</label><br>
		<label style="padding-left: 40px;font-size: 15px; color: #0073b1;">${birth }</label><br><br>
	</c:if>
</div>