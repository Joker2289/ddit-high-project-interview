<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">추천서</h4>
</div>
<div class="modal-body">
<form action="/project_careerInsert" method="post" id="project_careerInsertFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">추천아이디 </label>
				<input class="form-control" type="text" name="recom_id">
			</div>
			<div class="modalHalfRight">
				<label class="essential">프로젝트 리더 </label>
				<input class="form-control" type="text" name="project_leader" value="${SESSION_MEMBERVO.mem_id }">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft" style="height: 20px;">
			<div class="checkbox" style="margin: 0 0 0 0;">
				<label><input type="checkbox" class="end_dateIng" checked="checked"> 현재 이 프로젝트 진행중</label></div>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">시작일</label>
				<input class="form-control select_date" type="text" name="start_date">
			</div>
			<div class="modalHalfRight end_date">
				<label class="essential">종료일</label>
				<input class="form-control select_date" type="text" name="end_date">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label>프로젝트 URL</label>
				<input class="form-control" type="text" name="project_url">
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px; height: 100px;">
			<div class="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;"></textarea>
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${SESSION_MEMBERVO.mem_id }" name="user_id">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="project_careerSave">저장</button>
</div>
<script>

	//현 프로젝트일경우 종료일 숨기기 기능(체크박스)
	$(".end_date").hide();
	
	$(".end_dateIng").on("click",function(){
		if($(".end_dateIng").is(":checked")){
			$(".end_date").hide();
		}else{
			$(".end_date").show();
		}
	});
	// 입력 제어
	$("#project_careerSave").on("click",function(){
		if($("input[name=project_name]").val().trim()==""){
			alert("프로젝트명을 입력해주세요");
			$("input[name=project_name]").focus();
			return false;
		}
		if($("input[name=project_leader]").val().trim()==""){
			alert("프로젝트 리더를 입력해주세요");
			$("input[name=project_leader]").focus();
			return false;
		}
		if($("input[name=start_date]").val().trim()==""){
			alert("시작일을 입력해주세요");
			$("input[name=start_date]").focus();
			return false;
		}
		
		if($(".end_dateIng").is(":checked")){
			$("input[name=end_date]").remove();
		}else{
			if($("input[name=end_date]").val().trim()==""){
				alert("종료일을 입력해주세요");
				$("input[name=end_date]").focus();
				return false;
			}
		}
		
 		$("#project_careerInsertFrm").submit();
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
        ,beforeShow: function(input) {

		    var i_position= $(input).position();
		    var i_offset= $(input).offset(); 
		    i_position.top = i_position.top + 120; 
		    
		    setTimeout(function(){
	
		       $('#ui-datepicker-div').css({'top':i_position.top+"px", 'bottom':'', 'left':i_offset.left+ "px"});   
	
		    })
		}               
    });                    
</script>