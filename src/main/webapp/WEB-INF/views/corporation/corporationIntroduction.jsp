<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container">
	<div class="row">
		<div style="margin-top: 101px;">
			<!-- 			<section style="text-align: center;"> -->
			<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
			<br>
			<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
			<br>

			<div style="position: relative; top: -177px; left: 180px;margin-top: 20px;border: 1px solid;width: 650px; height: 200px;">
				<label>한눈에 보기</label><br>
				<label> 회사 소개 ${corporationVo.corp_profile }</label><br>
				<label> 회사 URL ${corporationVo.corp_url }</label><br>
				<label> 회사 URL ${corporationVo.corp_url }</label><br>
				<label> 업계 ${corporationVo.industry_type }</label><br>
				<label> 회사 규모 ${corporationVo.corp_size }</label><br>
				<label> 회사 규모 ${corporationVo.corp_size }</label><br>
				<label> 회사 주소 ${corporationVo.add1 }</label><br>
				<label> 회사 유형 ${corporationVo.type }</label><br>
			</div>
			
			
			<div style="position: relative; top: -177px; left: 180px;margin-top: 10px;border: 1px solid;width: 650px; height: 200px;">
				<label>위치</label>
				
			</div>
		</div>
	</div>
</div>



</body>
</html>