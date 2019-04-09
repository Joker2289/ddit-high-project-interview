<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">특허</h4>
</div>
<div class="modal-body">
<form action="/patent_listInsert" method="post" id="patent_listInsertFrm" enctype="multipart/form-data">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">특허명 </label>
				<input class="form-control" type="text" name="patent_name" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
			</div>
			<div class="modalHalfRight">
				<label class="essential">특허발급 국가 </label>
				<select class="form-control" name="nation" style="height: 30px; padding: 0 0 0 0;">
					<option value="" hidden="">국가 선택</option>
					<option value="대한민국">대한민국</option>
					<option value="뉴질랜드">뉴질랜드</option>
					<option value="대만">대만</option>
					<option value="라오스">라오스</option>
					<option value="말레이시아">말레이시아</option>
					<option value="몽골">몽골</option>
					<option value="미얀마">미얀마</option>
					<option value="방글라데시">방글라데시</option>
					<option value="베트남">베트남</option>
					<option value="스리랑카">스리랑카</option>
					<option value="싱가포르">싱가포르</option>
					<option value="인도">인도</option>
					<option value="인도네시아">인도네시아</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
					<option value="캄보디아">캄보디아</option>
					<option value="태국">태국</option>
					<option value="파키스탄">파키스탄</option>
					<option value="필리핀	">필리핀</option>
					<option value="호주">호주</option>
					<option value="홍콩">홍콩</option>
					<option value="유럽">유럽</option>
					<option value="그리스">그리스</option>
					<option value="네덜란드">네덜란드</option>
					<option value="덴마크">덴마크</option>
					<option value="독일">독일</option>
					<option value="루마니아">루마니아</option>
					<option value="벨기에	">벨기에</option>
					<option value="불가리아">불가리아</option>
					<option value="세르비아">세르비아</option>
					<option value="스웨덴">스웨덴</option>
					<option value="스위스">스위스</option>
					<option value="스페인">스페인</option>
					<option value="슬로바키아">슬로바키아</option>
					<option value="영국">영국</option>
					<option value="오스트리아">오스트리아</option>
					<option value="이탈리아">이탈리아</option>
					<option value="체코">체코</option>
					<option value="크로아티아">크로아티아</option>
					<option value="폴란드">폴란드</option>
					<option value="프랑스">프랑스</option>
					<option value="핀란드">핀란드</option>
					<option value="헝가리	">헝가리</option>
					<option value="북미">북미</option>
					<option value="미국">미국</option>
					<option value="캐나다">캐나다</option>
					<option value="중동">중동</option>
					<option value="사우디아라비아">사우디아라비아</option>
					<option value="아랍에미리트">아랍에미리트</option>
					<option value="알제리">알제리</option>
					<option value="오만">오만</option>
					<option value="요르단">요르단</option>
					<option value="이라크">이라크</option>
					<option value="이란">이란</option>
					<option value="이스라엘">이스라엘</option>
					<option value="이집트">이집트</option>
					<option value="카타르">카타르</option>
					<option value="쿠웨이트">쿠웨이트</option>
					<option value="터키">터키</option>
					<option value="튀니지">튀니지</option>
					<option value="아프리카">아프리카</option>
					<option value="가나">가나</option>
					<option value="남아프리카공화국">남아프리카공화국</option>
					<option value="모잠비크">모잠비크</option>
					<option value="수단">수단</option>
					<option value="에티오피아">에티오피아</option>
					<option value="우간다">우간다</option>
					<option value="짐바브웨">짐바브웨</option>
					<option value="케냐">케냐</option>
					<option value="코트디부아르">코트디부아르</option>
					<option value="탄자니아">탄자니아</option>
					<option value="중남미">중남미</option>
					<option value="과테말라">과테말라</option>
					<option value="도미니카공화국">도미니카공화국</option>
					<option value="멕시코">멕시코</option>
					<option value="베네수엘라">베네수엘라</option>
					<option value="브라질">브라질</option>
					<option value="아르헨티나">아르헨티나</option>
					<option value="에콰도르">에콰도르</option>
					<option value="칠레">칠레</option>
					<option value="콜롬비아">콜롬비아</option>
					<option value="쿠바">쿠바</option>
					<option value="파나마">파나마</option>
					<option value="파라과이">파라과이</option>
					<option value="페루">페루</option>
					<option value="러시아	">러시아</option>
					<option value="벨라루스">벨라루스</option>
					<option value="아제르바이잔">아제르바이잔</option>
					<option value="우즈베키스탄">우즈베키스탄</option>
					<option value="우크라이나">우크라이나</option>
					<option value="카자흐스탄">카자흐스탄</option>
					<option value="키르기스스탄">키르기스</option>
				</select>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">특허출원번호</label>
				<input class="form-control" type="text" name="patent_no">
			</div>
			<div class="modalHalfRight">
				<label class="essential">발명자</label>
				<input class="form-control" type="text" name="inventer" value="${SESSION_MEMBERVO.mem_id }">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">취득일</label>
				<input class="form-control select_date" type="text" name="patent_date">
			</div>
			<div class="modalHalfRight">
				<label>특허 URL</label>
				<input class="form-control" type="text" name="patent_url">
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
	<button type="button" class="btn btn-primary" id="patent_listSave">저장</button>
</div>
<script>
	// 입력 제어
	$("#patent_listSave").on("click",function(){
		if($("input[name=patent_name]").val().trim()==""){
			alert("특허명을 입력해주세요");
			$("input[name=patent_name]").focus();
			return false;
		}
		if($("input[name=nation]").val().trim()==""){
			alert("특허발급 국가를 입력해주세요");
			$("input[name=nation]").focus();
			return false;
		}
		if($("input[name=patent_no]").val().trim()==""){
			alert("특허출원번호를 입력해주세요");
			$("input[name=patent_no]").focus();
			return false;
		}
		if($("input[name=inventer]").val().trim()==""){
			alert("발명자를 입력해주세요");
			$("input[name=inventer]").focus();
			return false;
		}
		if($("input[name=patent_date]").val().trim()==""){
			alert("취득일을 입력해주세요");
			$("input[name=patent_date]").focus();
			return false;
		}
		
 		$("#patent_listInsertFrm").submit();
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