<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate value="${award_historyVo.award_date}" pattern="yy/MM/dd" var="fmtAward_date"/>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">수상 이력</h4>
</div>
<div class="modal-body">
<form action="/award_historyUpdate" method="post" id="award_historyUpdateFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">상 이름</label>
				<input class="form-control" type="text" name="award_name" value="${award_historyVo.award_name}">
			</div>
			<div class="modalHalfRight">
				<label class="essential">발급 기관</label>
				<input class="form-control" type="text" name="award_org" value="${award_historyVo.award_org}">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">수상 일자</label>
				<input class="form-control select_date" type="text" name="award_date" value="${award_historyVo.award_date}">
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px; height: 100px;">
			<div class="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;">${award_historyVo.contents}</textarea>
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${award_historyVo.award_code }" name="award_code">
</form>
</div>
<div class="modal-footer">
	<a class="btn btn-default" style="margin-right: 599px;" href="/award_historyDelete?award_code=${award_historyVo.award_code }">삭제</a>
	<button type="button" class="btn btn-primary" id="award_historySave">저장</button>
</div>
<script>

	// 입력 제어
	$("#award_historySave").on("click",function(){
		if($("input[name=award_name]").val().trim()==""){
			alert("상 이름을 입력해주세요");
			$("input[name=award_name]").focus();
			return false;
		}
		if($("input[name=award_org]").val().trim()==""){
			alert("발급 기관을 입력해주세요");
			$("input[name=award_org]").focus();
			return false;
		}
		if($("input[name=award_date]").val().trim()==""){
			alert("수상 일자를 입력해주세요");
			$("input[name=award_date]").focus();
			return false;
		}
		
 		$("#award_historyUpdateFrm").submit();
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
	
	$("input[name=award_date]").datepicker('setDate', '${fmtAward_date}');
</script>