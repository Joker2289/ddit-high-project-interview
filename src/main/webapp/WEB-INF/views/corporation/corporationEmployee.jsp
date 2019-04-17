<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<!-- Downloaded chart.css -->
<link rel="stylesheet" href="chart.css">

<!-- RawGit CDN chart.css -->
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />

</head>
<body>
	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br>
				
 				<div style="margin-top: -157px; margin-left: 240px; border : 1px solid;width: 370px; height: 300px;">

출신학교
<div class="charts">
<!--   <span>chart--default</span> -->
  <div class="charts__chart chart--p100 chart--default" data-percent></div><!-- /.charts__chart -->
<!--   <span>chart--blue</span> -->
  <div class="charts__chart chart--p80 chart--blue" data-percent></div><!-- /.charts__chart -->
<!--   <span>chart--green</span> -->
  <div class="charts__chart chart--p60 chart--green" data-percent></div><!-- /.charts__chart -->
<!--   <span>chart--red</span> -->
  <div class="charts__chart chart--p${ecount } chart--red" data-percent></div><!-- /.charts__chart -->
<!--   <span>chart--yellow</span> -->
  <div class="charts__chart chart--p20 chart--yellow" data-percent></div><!-- /.charts__chart -->
<!--   <span>chart--grey</span> -->
  <div class="charts__chart chart--p5 chart--grey" data-percent></div><!-- /.charts__chart -->
</div>
${eec.get(0).school_name }
${eec2.get(0)}
 				</div> 
			</div>
		</div>
	</div>




</body>
</html>