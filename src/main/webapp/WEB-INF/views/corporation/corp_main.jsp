<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>

<!-- Kakao map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>

<!-- 외부 css -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- <link href="/css/timeline/writemodal.css" rel="stylesheet"> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- css -->
<link href="/css/corporation/top.css" rel="stylesheet">
<link href="/css/corporation/corp_main.css" rel="stylesheet">
<link href="/css/corporation/corp_intro.css" rel="stylesheet">
<link href="/css/corporation/corp_recr.css" rel="stylesheet">
<link href="/css/corporation/corp_empl.css" rel="stylesheet">


</head>
<body>
	
	<!-- top -->
	<div class="container" style="margin-top: 70px;">
		<div id="top_area">
			<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
		</div>
			
	</div>
	
	<!-- body -->
	<div class="container">
		
		<div class="col-md-3 left">
			<div id="left_area" class="left_area" style="position:relative;">
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
			</div>
		</div>
		
		<div class="col-md-9 content">
			<div id="content_area" class="content_area">
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
			</div>
		</div>
		
	</div>





	
<script>	

//스크롤 이벤트 발생 시
$(window).scroll(function () {
   
   var currentTop = $(window).scrollTop();
   
   console.log(currentTop);
   
   
   /* 왼쪽 left_area 스크롤 따라오기 */
   if($(window).scrollTop() > 520){
 	  
	   console.log('dd');
      $("#left_area").stop().animate({top: (currentTop-450) + "px"}, 800);
      
   } else {
      $("#left_area").stop().animate({top: 0 + "px"}, 800);
   }
   
  
});

</script>

</body>

</html>