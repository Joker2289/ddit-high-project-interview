<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">외국어</h4>
</div>
<div class="modal-body">
<form action="/languageUpdate" method="post" id="languageUpdateFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">외국어</label>
				<input class="form-control" type="text" name="lang_kind" value="${languageVo.lang_kind }">
			</div>
			<div class="modalHalfRight">
				<label class="essential">점수</label>
				<input class="form-control" type="text" name="grade" value="${languageVo.grade }">
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${languageVo.lang_code }" name="lang_code">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="languageSave">저장</button>
</div>
<script>
	// 입력 제어
	$("#languageSave").on("click",function(){
		
		if($("input[name=lang_kind]").val().trim()==""){
			alert("외국어를 입력해주세요");
			$("input[name=lang_kind]").focus();
			return false;
		}
		
		if($("input[name=grade]").val().trim()==""){
			alert("점수를 입력해주세요");
			$("input[name=grade]").focus();
			return false;
		}
		
 		$("#languageUpdateFrm").submit();
	});
	
</script>