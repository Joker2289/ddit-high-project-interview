<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate value="${education_infoMap.education_infoVo.admission}" pattern="yy/MM/dd" var="fmtAdmission"/>
<fmt:formatDate value="${education_infoMap.education_infoVo.graduation}" pattern="yy/MM/dd" var="fmtGraduation"/>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">학력</h4>
</div>
<div class="modal-body">
<form action="/educationUpdate" method="post" id="educationUpdateFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">대학교 </label>
				<input class="form-control" type="text" name="school_name" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" value="${education_infoMap.education_infoVo.school_name}">
			</div>
			<ul class="dropdown-menu searchDropDown">
			</ul>
			<div class="modalHalfRight">
				<label class="essential">학위 </label>
				<input class="form-control" type="text" name="degree_name" value="${education_infoMap.education_infoVo.degree_name}">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">전공</label>
				<input class="form-control" type="text" name="major" value="${education_infoMap.education_infoVo.major}">
			</div>
			<div class="modalHalfRight">
				<label class="essential">학점 </label>
				<input class="form-control" type="text" name="grade" value="${education_infoMap.education_infoVo.grade}">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">입학년도 </label>
				<input class="form-control select_date"  name="admission" type="text" value="${education_infoMap.education_infoVo.admission}">
			</div>
			<div class="modalHalfRight">
				<label class="essential">졸업년도 </label>
				<input class="form-control select_date" name="graduation" type="text" value="${education_infoMap.education_infoVo.graduation}">
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px;">
			<div style="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;">${education_infoMap.education_infoVo.contents}</textarea>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="modalHalfLeft">
				<label style="display: block;">미디어 </label>
				<label>외부 문서, 사진, 사이트 동영상 프레젠테이션 링크 </label>
			</div>
			<div class="modalHalfRight" style="height: 30px; display: flex;">
				<label class="btn btn-default fileUpload" style="font-size: 14px; width:64px; height: 31px; padding: 6px 12px 6px 12px;">업로드</label>
			</div>
		</div>
      	<div class="modalRow" style="padding-bottom: 15px;">
			<div  class="fileListBox" style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
				<c:forEach items="${education_infoMap.filesVoList }" var="files" > 
					<div class="files" style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold">
						<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
						<input type="hidden" name="file_name" value="${files.file_name}">
						<input type="hidden" name="file_path" value="${files.file_path}">
						<label class="btn btn-link delBtn" style="font-size: 14px; width:64px; height: 31px; padding: 3px 12px 6px 0;">X</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${education_infoMap.education_infoVo.education_code }" name="education_code">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="educationSave">저장</button>
</div>

<script>

	$.ajax({
		type: 'GET',
		url : "/schoolNameAPI",
		dataType : "JSON",
		data : {},
		success : function(result) {
			var str = '';
			for (var i=0; i < result.content.length; i++) {
				$('.searchDropDown').append('<li><a class="school_nameClick">'+result.content[i].schoolName +'</a></li>');
			}
		}
	});  
	
	// 검색시 다른 곳 클릭할때 숨기기 기능
	$(document).on("click", function(e){
		if (!$(e.target).closest(".searchDropDown").hasClass("searchDropDown")){
	       	$(".searchDropDown").hide();
		}
	});

	// 학교입력 클릭시 인풋 값 
	$(document).on("click",".school_nameClick",function(){
		 $("input[name=school_name]").val($(this).text());
		 $(".searchDropDown").hide();
	});
		
	 //	학교입력창에서 키 입력시 검색(API 데이터에서) 
	 $("input[name=school_name]").keyup(function() {
		 $('.searchDropDown').css("display","block");
            var k = $(this).val();
            $(".searchDropDown > li").hide();
            var temp = $(".searchDropDown > li:contains('" + k + "')");
            $(temp).show();
     });
	// 파일 업로드시 삭제 라벨 생성
	$(document).on("change","input[name=filesVo]",function(){
	
		var fileValue = $(this).val().split("\\");
		var fileName = fileValue[fileValue.length-1];
	
		$(".fileListBox").append('<div class="files" style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold"><label style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold">'+fileName+'</label><label class="btn btn-link fileVodelBtn"style="font-size: 14px; width:64px; height: 31px; padding: 3px 12px 6px 0;">X</label></div>');
		
	});

	// 기존파일 삭제
	$(document).on("click",".delBtn", function(){
		$(this).parents("div.files").remove();
	});
	
	// 새파일 삭제
	$(document).on("click",".fileVodelBtn", function(){
		$(".fileUpload").parent().children().last().remove();
		$(this).parents("div.files").remove();
	});
	// 미디어 업로드 버튼 클릭시 파일업로드 하기
	$(".fileUpload").on("click",function(){
		$(".fileUpload").parent().append('<input type="file" multiple="multiple" name="filesVo" style="display: none;">');
		$(".fileUpload").parent().children().last().click();
		
	});
	
	// 입력 제어
	$("#educationSave").on("click",function(){
		if($("input[name=school_name]").val().trim()==""){
			alert("학교명을 입력해주세요");
			$("input[name=school_name]").focus();
			return false;
		}
		if($("input[name=degree_name]").val().trim()==""){
			alert("학위를 입력해주세요");
			$("input[name=degree_name]").focus();
			return false;
		}
		if($("input[name=major]").val().trim()==""){
			alert("전공을 입력해주세요");
			$("input[name=major]").focus();
			return false;
		}
		if($("input[name=grade]").val().trim()==""){
			alert("학점을 입력해주세요");
			$("input[name=grade]").focus();
			return false;
		}
		if($("input[name=admission]").val().trim()==""){
			alert("시작일을 입력해주세요");
			$("input[name=admission]").focus();
			return false;
		}
		
		if($("input[name=graduation]").val().trim()==""){
			alert("종료일을 입력해주세요");
			$("input[name=graduation]").focus();
			return false;
		}
		
 		$("#educationUpdateFrm").submit();
	});
	
	// 캘린더 오류 구문
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	
	// 캘린더
	$(".select_date").datepicker({
        dateFormat: "yy/mm/dd" //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"] //달력의 월 부분 텍스트
        ,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ["일","월","화","수","목","금","토"] //달력의 요일 부분 텍스트
        ,dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"] //달력의 요일 부분 Tooltip 텍스트
        //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });   
	
	$("input[name=admission]").datepicker('setDate', '${fmtAdmission}');
	$("input[name=graduation]").datepicker('setDate', '${fmtGraduation}');
    
</script>