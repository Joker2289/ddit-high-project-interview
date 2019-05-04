<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css" />



<div class="empl_div">

	<div class="empl_head_div">
		<h4 class="empl_head_title"><i class="fas fa-user-tie"></i> 사원     ${ employeeCnt }명</h4> 
	</div>
	
	<!-- 차트 조작 버튼 div -->
	<div class="chart_button_div">
		<button class="btn btn-primary chart_button"> <i class="fas fa-chevron-left"></i> 이전 </button>
		<button class="btn btn-primary chart_button">다음 <i class="fas fa-chevron-right"></i> </button>
	</div>
	
	<!-- 차트 div -->
	<div class="chart_area">
		<%@ include file="/WEB-INF/views/corporation/module/chart.jsp"%>
	</div>
	
</div>

<script>
	


</script>

<!-- <div class="progress">
		  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
		    60%
		  </div>
		</div> -->