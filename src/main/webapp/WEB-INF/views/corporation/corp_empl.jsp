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
		<h4 class="empl_head_title"><i class="fas fa-user-tie"></i> 사원 <a class="employeeCnt">${ employeeCnt }명</a></h4> 
	</div>
	
	<!-- 차트 조작 버튼 div -->
	<div class="chart_button_div">
		<button class="btn btn-primary chart_button" onclick="beforeChart('${ corp_id }', '${ corp_code }', '${ list_index }');"> <i class="fas fa-chevron-left"></i> 이전 </button>
		<button class="btn btn-primary chart_button" onclick="nextChart('${ corp_id }', '${ corp_code }', '${ list_index }');">다음 <i class="fas fa-chevron-right"></i> </button>
	</div>
	
	<!-- 차트 div -->
	<div class="chart_area">
		<%@ include file="/WEB-INF/views/corporation/module/chart.jsp"%>
	</div>
	
</div>

<script>

/* 이전 차트 */
function beforeChart(corp_id, corp_code, list_index){
	list_index--;
	showChart(corp_id, corp_code, list_index);
}
	
/* 다음 차트 */
function nextList(corp_id, corp_code, list_index){
	list_index++;
	showChart(corp_id, corp_code, list_index);
}

/* 차트 조회 */
function showChart(corp_id, corp_code, list_index){
	$.ajax({
	  url : '/corp/showChart',
      data : {"corp_id" : corp_id, "corp_code" : corp_code, "list_index" : list_index },
      success : function(data) {
    	  
    	  $('#chart_area').html(data);
    	  
      }
    });
}




</script>

