<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <br>
    <br>
    <br>
<label for="cover">bg_img사진</label>
	<img
		src="${pageContext.request.contextPath }/">
	<br>
	<label for="logo">corp_logo사진</label>
	<img src="${pageContext.request.contextPath }/">
	<br>
	<label for="corporationNm">회사 이름 : </label>
	<label>${corporationVo.corp_name }</label>
	<input  type="button" value="..." name="report&follw"/>
	<br>
	<label for="addr1">회사 주소 : </label>
	<label>${corporationVo.addr1 }</label>
	<br>
	<input type="button" value="+팔로우" name="follow" onclick="follow">
	<input type="button" value="웹사이트 가기 ↗" name="corp_url" onclick="window.open('http://www.naver.com')"/>
	<br>