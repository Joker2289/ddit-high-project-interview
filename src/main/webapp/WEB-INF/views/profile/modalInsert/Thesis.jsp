<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">논문·저서</h4>
</div>
<div class="modal-body">
<form action="/thesis_listInsert" method="post" id="thesis_listInsertFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">논문·저서</label>
				<input class="form-control" type="text" name="thesis_name">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">발행인출판사 </label>
				<input class="form-control" type="text" name="publisher">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label>논문저서URL</label>
				<input class="form-control" type="text" name="thesis_url">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">저자 </label>
				<input class="form-control" type="text" name="writer" value="${SESSION_MEMBERVO.mem_id }">
			</div>
			<div class="modalHalfRight">
				<label class="essential">발표출판일 </label>
				<input class="form-control select_date"  name="publication_date" type="text" >
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px; height: 100px;">
			<div style="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;"></textarea>
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${SESSION_MEMBERVO.mem_id }" name="user_id">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="thesis_listSave">저장</button>
</div>

<script>
	// 입력 제어
	$("#thesis_listSave").on("click",function(){
		if($("input[name=thesis_name]").val().trim()==""){
			alert("논문·저서 명을 입력해주세요");
			$("input[name=thesis_name]").focus();
			return false;
		}
		if($("input[name=publisher]").val().trim()==""){
			alert("발행인출판사를 입력해주세요");
			$("input[name=publisher]").focus();
			return false;
		}
		if($("input[name=writer]").val().trim()==""){
			alert("저자를 입력해주세요");
			$("input[name=writer]").focus();
			return false;
		}
		if($("input[name=publication_date]").val().trim()==""){
			alert("발표출판일을 입력해주세요");
			$("input[name=publication_date]").focus();
			return false;
		}
		
 		$("#thesis_listInsertFrm").submit();
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