<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">경력</h4>
</div>
<div class="modal-body">
<form action="/careerInsert" method="post" id="careerInsertFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">회사 </label>
				<input class="form-control" type="text" name="corporate_name" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
			</div>
			<ul class="dropdown-menu searchDropDown">
  				<c:forEach items="${corpVoList }" var="corpVo">
  					<li><a class="corp_nameClick" title="${fn:split(corpVo.addr1,' ')[0]}">${corpVo.corp_name }</a></li>
  				</c:forEach>
			</ul>
			<div class="modalHalfRight">
				<label class="essential">회사코드 </label>
				<input class="form-control" type="text" name="career_code">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<div class="modalHalfRight">
					<label class="essential">지역 </label>
					<input class="form-control" type="text" name="corp_local">
				</div>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">직군</label>
				<input type="text" name="job_position" class="form-control addr1"/>
			</div>
			<div class="modalHalfRight">
				<label>직급 </label>
				<select class="form-control" name="job_rank" style="height: 30px; padding: 0 0 0 0;">
					<option value="" hidden=""> 직급 선택 </option>
					<option value="회장">회장</option>
					<option value="부회장">	부회장</option>               
					<option value="사장">	사장</option>               
					<option value="부사장">	부사장</option>               
					<option value="전무이사">	전무이사</option>               
					<option value="상무이사">	상무이사</option>               
					<option value="이사">		이사</option>               
					<option value="부장">		부장</option>               
					<option value="차장">		차장</option>               
					<option value="과장">		과장</option>               
					<option value="계장">		계장</option>               
					<option value="대리">		대리</option>               
					<option value="주임">		주임</option>
					<option value="사원">		사원</option>
					<option value="인턴">		인턴</option>              
				</select>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft" style="height: 20px;">
			<div class="checkbox" style="margin: 0 0 0 0;">
				<label><input type="checkbox" class="resign_dateIng"checked="checked"> 현재 이 업무로 근무 중</label></div>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">시작일 </label>
				<input class="form-control select_date"  name="join_date" type="text" >
			</div>
			<div class="modalHalfRight resign_date">
				<label class="essential">종료일 </label>
				<input class="form-control select_date" name="resign_date" type="text" >
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px;">
			<div style="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;"></textarea>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="modalHalfRight">
				<label style="display: block;">미디어 </label>
				<label>외부 문서, 사진, 사이트 동영상 프레젠테이션 링크 </label>
			</div>
			<div class="modalHalfRight" style="height: 30px; display: flex;">
				<label class="btn btn-default fileUpload" style="font-size: 14px; width:64px; height: 31px; padding: 6px 12px 6px 12px;">업로드</label>
				<button class="btn btn-default" style="height: 31px; padding: 0 10px 0 10px;" data-toggle="collapse" href="#link" aria-expanded="false" aria-controls="background">링크</button>
				
			</div>
		</div>
		<div class="collapse" id="link" style="margin-top: 10px; border: 0px;">
      		<div class="well modalHalfLeft" style="padding: 0 0 0 0; border-top: 0px;">
				<div class="input-group">
     					<input class="form-control" type="text" name="persnal_url" style="width:283px; height: 31px;"/>
				    <span class="input-group-btn" style="height: 33px;">
				    	<button class="btn btn-default" type="button" style="height: 31px;margin-top: -1px;">등록</button>
				    </span>
			    </div>
      		</div>
      	</div>
      	<div class="modalRow" style="padding-bottom: 15px;">
			<div  class="fileListBox" style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${SESSION_MEMBERVO.mem_id }" name="user_id">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="careerSave">저장</button>
</div>

<script>

	// 검색시 다른 곳 클릭할때 숨기기 기능
	$(document).on("click", function(e){
		if (!$(e.target).closest(".searchDropDown").hasClass("searchDropDown")){
	       	$(".searchDropDown").hide();
		}
	});
	
	// 현 직장일경우 종료일 숨기기 기능(체크박스)
	$(".resign_date").hide();
	
	$(".resign_dateIng").on("click",function(){
		if($(".resign_dateIng").is(":checked")){
			$(".resign_date").hide();
		}else{
			$(".resign_date").show();
		}
	});
	
	// 회사입력 클릭시 인풋 값 
	$(".corp_nameClick").on("click",function(){
		 $("input[name=corporate_name]").val($(this).text());
		 $("input[name=corp_local]").val($(this).attr('title'));
		 $(".searchDropDown").hide();
	});
		
	 //	회사입력창에서 키 입력시 검색(기존 회사 데이터에서) 
	 $("input[name=corporate_name]").keyup(function() {
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
	$("#careerSave").on("click",function(){
		if($("input[name=corporate_name]").val().trim()==""){
			alert("회사이름을 입력해주세요");
			$("input[name=corporate_name]").focus();
			return false;
		}
		if($("input[name=career_code]").val().trim()==""){
			alert("회사코드를 입력해주세요");
			$("input[name=career_code]").focus();
			return false;
		}
		if($("input[name=corp_local]").val().trim()==""){
			alert("회사 주소를 입력해주세요");
			$("input[name=corp_local]").focus();
			return false;
		}
		if($("input[name=job_position]").val().trim()==""){
			alert("직군을 입력해주세요");
			$("input[name=job_position]").focus();
			return false;
		}
		if($("input[name=join_date]").val().trim()==""){
			alert("시작일을 입력해주세요");
			$("input[name=join_date]").focus();
			return false;
		}
		
		if($(".resign_dateIng").is(":checked")){
			$("input[name=resign_date]").remove();
		}else{
			if($("input[name=resign_date]").val().trim()==""){
				alert("종료일을 입력해주세요");
				$("input[name=resign_date]").focus();
				return false;
			}
		}
		
 		$("#careerInsertFrm").submit();
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