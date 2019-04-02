<%@page import="ch.qos.logback.classic.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <!DOCTYPE html> 
<html>
<head> 
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<%-- <title>${memberVO.mem_id }</title> --%>
	



</head> 

<body>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// 	$(document).ready(function(){
// 		console.log(111);
// 		$("#insertBtn").on("click", function(){
// 			$("#mem_id").val("${memberVO.mem_id}");
			
// 			$("#frm").submit();
// 		});
// 	});

	
	$(function(){
	    //전역변수선언
	var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor2",
	        sSkinURI: "/SE2/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	            fOnBeforeUnload : function(){
	        }
	        }, 
	          fOnAppLoad : function(){
	              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	             editor_object.getById["smarteditor2"].exec("UPDATE_CONTENTS_FIELD", []);
	          },
	          fCreator: "createSEditor"
	    });
	     
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor2"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    });
	});
 


</script>


<div style="position: relative; top: -177px; left: 180px; "> 
	<form id="frm" action="${pageContext.request.contextPath}/corporation" method="post" >
		<textarea rows="10" cols="30" id="smarteditor2" name="smarteditor2" style="width:650px; height:350px; "></textarea>
		<input type="button" id="savebutton" value="저장"/>
		<input type="button" value="취소"/>
	</form>
</div>



</body> 
 </html> 