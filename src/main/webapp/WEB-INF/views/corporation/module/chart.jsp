<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="chart_div">

	<div class="chart_title"> ${ chart_title } </div>

	<c:forEach items="${ chart_List }" var="chart" varStatus="index">
	
		<div class="chart_subject_div">
			<a class="chart_subject" onclick="showEmployeeList('${ corp_id }', '${ corp_code }', '${ chart.chart_subject }');">${ chart.chart_subject }</a> / <a class="chart_value">${ chart.chart_value }명</a>
		</div>
		<div class="progress">
			<div id="progress-bar${ index.count }" class="progress-bar" role="progressbar" aria-valuenow="${ (chart.chart_value / sum_value) * 100 }"
				aria-valuemin="0" aria-valuemax="${ sum_value }" style="width: ${ (chart.chart_value / sum_value) * 100 }%;">${ chart.chart_value }명</div>
		</div>
		
	</c:forEach>
	
	
	

</div>

<script>
	 
	 if( '${ chart_index }' == '1'){
		 
		 var i = 0;
		 
		 <c:forEach items="${ chart_List }" var="chart">
			i++;
			
		 	$('#progress-bar' + i).css('background-color', 'hsl( 480, 60%, '+ (10 + (i*5)) +'%)');
			
		 </c:forEach>
	 }
	 
	 if( '${ chart_index }' == '2'){
		 
		 var i = 0;
		 
		 <c:forEach items="${ chart_List }" var="chart">
			i++;
			
		 	$('#progress-bar' + i).css('background-color', 'hsl( 300, 60%, '+ (10 + (i*5)) +'%)');
			
		 </c:forEach>
	 }
	 
	if( '${ chart_index }' == '3'){
		 
		 var i = 0;
		 
		 <c:forEach items="${ chart_List }" var="chart">
			i++;
			
		 	$('#progress-bar' + i).css('background-color', 'hsl( 0, 60%, '+ (10 + (i*5)) +'%)');
			
		 </c:forEach>
	 }
	
	if( '${ chart_index }' == '4'){
		 
		 var i = 0;
		 
		 <c:forEach items="${ chart_List }" var="chart">
			i++;
			
		 	$('#progress-bar' + i).css('background-color', 'hsl( 40, 60%, '+ (10 + (i*5)) +'%)');
			
		 </c:forEach>
	 }
</script>


