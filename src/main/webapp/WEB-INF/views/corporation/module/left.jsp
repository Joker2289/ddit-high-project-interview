<%@page import="com.sun.javafx.css.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div style="width: 150px; "> 
    	<div style="border: 1px solid; height: 35px;">
			<a href="<%=request.getContextPath()%>/corporation">홈</a><br> 
		</div>
		<div style="border: 1px solid; margin-top: -1px; height: 35px;">
			<a href="<%=request.getContextPath()%>/corporationIntroduction">소개</a><br>
		</div>
		<div style="border: 1px solid; margin-top: -1px; height: 35px;">
			<a href="<%=request.getContextPath()%>/corporationRecruitment">채용</a><br>
		</div>
		<div style="border: 1px solid; margin-top: -1px; height: 35px;">
			<a href="<%=request.getContextPath()%>/corporationEmployee">직원</a><br>
		</div>
	</div>
	