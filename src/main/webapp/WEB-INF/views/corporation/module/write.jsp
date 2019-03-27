<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>${memberVO.mem_id }</title>
</head>

<body>
<form id="frm"
	action="${pageContext.request.contextPath }/module/write"
	method="post">
	<input type="hidden" id="mem_id" name="mem_id">
	<table border="1">
		<tr>
			<textarea id="post_contents" name="post_contents" rows="2" style="width: 36.5%;"></textarea>
		</tr>
		<tr>
			<th><a href="">사진공유</a> <a href="">동영상공유</a> <a href="">문서공유</a>
				<input id="insertBtn" name="insertBtn" type="button" value="글쓰기">
			</th>
		</tr>
	</table>
</form>

<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		console.log(111);
		$("#insertBtn").on("click", function(){
			$("#mem_id").val("${memberVO.mem_id}");
			
			$("#frm").submit();
		});
	});
	
</script>
</body>
</html>