<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
    <table border="1">
		<tr>
			<form id="frm" 
				  action="${pageContext.request.contextPath }/corporation/corporationHome" 
				  method="post">
				<textarea id="content" name="content" rows="2" style="width:36.5%;"></textarea>
		</tr>
		<tr >
			<th>
				<a href="">사진공유</a>
				<a href="">동영상공유</a>
				<a href="">문서공유</a>
				<input id="insertBtn" name="insertBtn" type="submit" value="글쓰기">
			</th>
			</form>
		</tr>
	</table>
	
	<script>

	</script>