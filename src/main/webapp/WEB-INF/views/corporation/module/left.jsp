<%@page import="com.sun.javafx.css.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div style="width: 219px;border-radius:5px; box-shadow: 0px 2px 4px #aaa; font-size: large;font-weight:400;padding: :3px 2px 0 30px"> 
    	<div style="background-color: #FFFFFFFF; height: 35px; border-top-left-radius: 5px;border-top-right-radius: 5px;  border: 1px solid #AAAAAA; padding: 10">
			<a href="<%=request.getContextPath()%>/corporation"> <label style="margin-top: 5px">&emsp;홈</label></a><br> 
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px; height: 35px; border: 1px solid #AAAAAA;">
			<a href="<%=request.getContextPath()%>/corporationIntroduction" style="vertical-align:baseline;ma"> <label style="margin-top: 5px">&emsp;소개</label></a><br>
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px ; height: 35px;   border: 1px solid #AAAAAA;">
			<a href="<%=request.getContextPath()%>/corporationRecruitment"><label style="margin-top: 5px"> &emsp;채용</label></a><br>
		</div>
		<div style="background-color: #FFFFFFFF; margin-top: -1px; height: 35px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;  border: 1px solid #AAAAAA;">
			<a href="<%=request.getContextPath()%>/corporationEmployee"><label style="margin-top: 5px"> &emsp;직원</label></a><br>
		</div>
	</div>
	