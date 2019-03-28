<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>${memberVO.mem_id }</title>
</head>

<body>
<form id="frm"
	action="${pageContext.request.contextPath }/corporation"
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
		
	<form action="${pageContext.request.contextPath }/corporation" method="post" id="frm2">
	    <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:400px; height:60px;"></textarea>
	    <br><input type="button" id="savebutton" value="서버전송" />
	</form>
	

	
		
	
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
	
	$(function(){
	    //전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	     
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    })
	})


</script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>


</body>
</html>