<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css" />



<div class="chart_area_div">

	<div class="chart_head_div">
		<h4 class="chart_head_title"><i class="fas fa-user-tie"></i> 사원 <a class="employeeCnt">${ employeeCnt }명</a></h4> 
	</div>
	
	<!-- 차트 조작 버튼 div -->
	<div class="chart_button_div">
		<a class="btn btn-primary chart_button" onclick="beforeChart('${ corp_id }', '${ corp_code }');"> <i class="fas fa-chevron-left"></i> 이전 </a>
		<a class="btn btn-primary chart_button" onclick="nextChart('${ corp_id }', '${ corp_code }');">다음 <i class="fas fa-chevron-right"></i> </a>
	</div>
	
	<!-- 차트 div -->
	<div id="chart_area" class="chart_area">
		<%@ include file="/WEB-INF/views/corporation/module/chart.jsp"%>
	</div>
	
</div>

<div id="empl_area_div" class="empl_area_div">
	<%@ include file="/WEB-INF/views/corporation/module/employee_list.jsp"%>
</div>

<script>

var chart_index = 1;
var corp_id = "${ corp_id }";
var corp_code = "${ corp_code }"; 
var parameter = "allList";


/* 이전 차트 */
function beforeChart(corp_id, corp_code){
	
	if(chart_index == 1){
		chart_index = 4;
	} else {
		chart_index--;
	}
	
	
	console.log(chart_index);
	showChart(corp_id, corp_code);
}
	
/* 다음 차트 */
function nextChart(corp_id, corp_code){
	
	if(chart_index == 4) {
		chart_index = 1;		
	} else {
		chart_index++;
	}
	
	console.log(chart_index);
	showChart(corp_id, corp_code);
}

/* 차트 조회 */
function showChart(corp_id, corp_code){
	$.ajax({
	  url : '/corp/showChart',
      data : {"corp_id" : corp_id, "corp_code" : corp_code, "chart_index" : chart_index },
      success : function(data) {
    	  
    	  $('#chart_area').html(data);
    	  
      }
    });
}


/* 직원 리스트 조회 */
function showEmployeeList(corp_id, corp_code, parameter) {
	
	//팔로우 시 직원리스트 페이지 다시 뿌려줘야하므로 parameter를 전역변수로 두고 넘겨줘야한다 - 그상태 그페이지를 다시 출력해야하므로
	this.parameter = parameter
	
	$.ajax({
	  url : '/corp/showEmployeeList',
      data : {"corp_id" : corp_id, "corp_code" : corp_code, "chart_index" : chart_index, "parameter" : parameter },
      success : function(data) {
    	  
    	  $('#empl_area_div').html(data);
    	  
      }
    });
	
}




</script>

