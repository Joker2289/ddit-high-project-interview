<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">보유기술</h4>
</div>
<div class="modal-body">
<form action="/possesion_skillsInsert" method="post" id="possesion_skillsInsertFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">보유기술 </label>
				<input class="form-control" type="text" name="pskill_name" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
			</div>
			<ul class="dropdown-menu searchDropDown">
			</ul>
			<div class="modalHalfRight">
				<label class="essential">발급처 </label>
				<input class="form-control" type="text" name="issue_org">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">발급일자</label>
				<input class="form-control select_date" type="text" name="issue_date">
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px;">
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
	<button type="button" class="btn btn-primary" id="possesion_skillsSave">저장</button>
</div>
<script>
	 $.ajax({
		type: 'GET',
		url : "/skillNameAPI",
		dataType : "JSON",
		data : {},
		success : function(result) {
			var str = '';
			for (var i=0; i < result.item.length; i++) {
				$('.searchDropDown').append('<li><a class="pskill_nameClick">'+result.item[i].jmfldnm +'</a></li>');
			}
		}
	});  
	 
	// 검색시 다른 곳 클릭할때 숨기기 기능
	$(document).on("click", function(e){
		if (!$(e.target).closest(".searchDropDown").hasClass("searchDropDown")){
	       	$(".searchDropDown").hide();
		}
	});

	// 보유스킬입력 클릭시 인풋 값 
	$(document).on("click",".pskill_nameClick",function(){
		 $("input[name=pskill_name]").val($(this).text());
		 $(".searchDropDown").hide();
	});
		
	 //	보유스킬입력창에서 키 입력시 검색(API 데이터에서) 
	 $("input[name=pskill_name]").keyup(function() {
		 $('.searchDropDown').css("display","block");
            var k = $(this).val();
            $(".searchDropDown > li").hide();
            var temp = $(".searchDropDown > li:contains('" + k + "')");
            $(temp).show();
     });
	 
	
	// 입력 제어
	$("#possesion_skillsSave").on("click",function(){
		if($("input[name=pskill_name]").val().trim()==""){
			alert("보유기술을 입력해주세요");
			$("input[name=pskill_name]").focus();
			return false;
		}
		if($("input[name=issue_org]").val().trim()==""){
			alert("발급처를 입력해주세요");
			$("input[name=issue_org]").focus();
			return false;
		}
		if($("input[name=issue_date]").val().trim()==""){
			alert("발급일자를 입력해주세요");
			$("input[name=issue_date]").focus();
			return false;
		}
		
 		$("#possesion_skillsInsertFrm").submit();
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
    
</script>