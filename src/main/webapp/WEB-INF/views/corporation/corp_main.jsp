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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="/css/timeline/writemodal.css" rel="stylesheet">

<!-- css -->
<link href="/css/corporation/corp_main.css" rel="stylesheet">
<link href="/css/corporation/corp_intro.css" rel="stylesheet">

<style>
textarea {
	font-size: 100%;
	letter-spacing: 1px;
}

textarea {
	padding: 10px;
	line-height: 1.5;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px 1px #999;
}
</style>



</head>
<body>
	
	<!-- top -->
	<div class="container">
		<div id="top_area">
			<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
		</div>
			
	</div>
	
	<!-- body -->
	<div class="container">
		
		<div class="col-md-3 left">
			<div class="left_area">
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

            
$(function () {
	$("#btn_write_upload").on("click", function () {
		$("#post_contents2").val($("#post_contents").val());
				$("#frm_writePost").submit();
		});
});

$(function () {
	$("#btn_video_path").on("click", function () {
		$("#video_path").val();
				$("#frm_video").submit();
		});
});


</script>

</body>

</html>