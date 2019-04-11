<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<!-- 			<section style="text-align: center;"> -->
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br> <br>
				<%@ include file="/WEB-INF/views/corporation/module/write.jsp"%>

				
				
		

	<div class="input-group" style="margin-top: -178px; margin-left: 240px;border: 1px solid #AAAAAA;border-radius: 4px;background-color: #FFFFFF;box-shadow: 0px 2px 5px #aaa;">
	          <button id="btn-write_modal" class="btn-write_modal"  style="height: 72.6px; margin-top: -9px;"><span class="span-text"><a parent="#accordion" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></span></button>
	          <button id="btn-upload-img" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#img" aria-expanded="false" aria-controls="img"><i class="far fa-images"></i></a></span></button>
	          <button id="btn-upload-video" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#video" aria-expanded="false" aria-controls="video"><i class="far fa-play-circle"></i></a></span></button>
	          <button id="btn-upload-document" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="far fa-file-alt"></i></a></span></button>
	          
	          <form id="frm_writePost" action="/corporation" method="post">
				<div class="collapse" id="collapseExample" >
				  <div class="well">
				    <textarea id="post_contents" name="post_contents" rows="5" cols="33" style="width: 550px;"></textarea>
				    <br>
				    <div align="center"><button type="submit" id="btn_write_upload" name="btn_write_upload" style="background-color: #FFFFFF;border: 1px solid #AAAAAA;box-shadow: 0px 2px 5px #aaa;border-radius: 4px;font-size: 120%;">글 등록</button></div>
				  </div><hr>
  				</div>
			 </form>
			
				<div class="collapse" id="video" >
				  <div class="well">
				    <div align="right">
				    	<input type="text" id="video_path" name="video_path" style="width: 420px;" />
				    	<button style="background-color: #FFFFFF;border: 1px solid #AAAAAA;box-shadow: 0px 2px 5px #aaa;border-radius: 4px;font-size: 120%;margin-right: 10px;">경로 입력</button>
				    </div>
				  </div><hr>
  				</div>
		
	</div>
	
	
			
			</div>
		</div>
	</div>

${postList}

	-------------------
<script>	
$(function () {
	$("#btn_write_upload").on("click", function () {
	$("#post_contents").val(post_contents);
				$("#frm_writePost").submit();
		});
});


</script>

</body>

</html>