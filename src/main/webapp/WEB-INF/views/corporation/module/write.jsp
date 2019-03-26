<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
	
    <table border="1">
		<tr>
			<form id="frm" 
				  action="${pageContext.request.contextPath }/corporation/corporationHome" 
				  method="post">
				<textarea id="content" name="content" rows="2" style="width:36.5%;"></textarea>
			</form>
		</tr>
		<tr >
			<th>
				<a href="">사진공유</a>
				<a href="">동영상공유</a>
				<a href="">문서공유</a>
				<input id="insertBtn" name="insertBtn" type="submit" value="글쓰기">
			</th>
		</tr>
	</table>
	
	<script>
	//글쓰기 버튼 이벤트
	$("#insertBtn").on("click", function(){
		//글내용
		if($("#content").val().trim() == ""){
			alert("내용을 입력해 주세요.");
			$("#content").focus();
			return false;
		}
		$("#frm").submit();
	});
	</script>