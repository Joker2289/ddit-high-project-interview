<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="chart_div">

	<div class="chart_title"> ${ chart_title } </div>

	<c:forEach items="${ chart_List }" var="chart">
	
		<div class="chart_subject_div">
			<a class="chart_subject">${ chart.chart_subject }</a> / <a class="chart_value">${ chart.chart_value }명</a>
		</div>
		<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="${ (chart.chart_value / sum_value) * 100 }"
				aria-valuemin="0" aria-valuemax="${ sum_value }" style="width: ${ (chart.chart_value / sum_value) * 100 }%;">${ chart.chart_value }명</div>
		</div>
		
	</c:forEach>
	
	
	

</div>

<script>
	
</script>


