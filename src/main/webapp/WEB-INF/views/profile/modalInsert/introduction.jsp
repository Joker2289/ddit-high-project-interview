<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">소개 수정</h4>
</div>
<div class="modal-body">
<form action="/asldfkj;alskdf;laskjf;lajksdlfjk" method="post">
	<div class="profileHomeBackgroundPicture modalBackground" style="background-image: url(/background?mem_id=${SESSION_DETAILVO.user_id});"></div>
	<div class="pictureInsert">
		<button id="backgroundBtn">
			<span><i class="fas fa-pencil-alt"></i></span>
		</button>
		<input type="file" multiple="multiple" name="backgroundFile" id="backgroundFile" style="display: none;">
	</div>
	<div style="min-height: 328px;">
		<div class="profileHomeProfilePicture modalprofile" style="background-image: url(/profile?mem_id=jin); margin-top: 80px;"></div>
		<div class="pictureInsert" style="margin-left: 157px; margin-top: -30px;">
			<button id="profileBtn">
				<span><i class="fas fa-pencil-alt"></i></span>
			</button>
			<input type="file" multiple="multiple" name="profileFile" id="profileFile" style="display: none;">
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">이름 </label>
				<input class="form-control" type="text" name="user_name">
			</div>
			<div class="modalHalfRight">
				<label class="essential">생년월일 </label>
				<input class="form-control" id="userBirth" type="text" name="user_birth">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">우편번호 </label>
			    <div class="input-group">
			      <input class="form-control zipcode" name="zipcode" type="text" style="width:283px; height: 31px;" disabled="disabled" />
			      <span class="input-group-btn" style="height: 33px;">
			        <button class="btn btn-default zipcodeSearch" type="button" style="height: 31px;margin-top: -1px;">검색</button>
			      </span>
			    </div>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">주소 </label>
				<input type="text" name="addr1" class="form-control addr1" disabled="disabled"/>
			</div>
			<div class="modalHalfRight">
				<label class="essential">상세주소 </label>
				<input type="text" name="addr2" class="form-control addr2" />
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">이메일 </label>
				<input class="form-control" name="email" type="text">
			</div>
			<div class="modalHalfRight">
				<label>전화번호 </label>
				<input class="form-control" name="telno" type="text">
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px;">
			<div style="modalHalfLeft">
				<label>간단소개글 </label>
				<textarea class="form-control" rows="3" name="profile_contents" style="width: 682px; height: 80px;"></textarea>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="modalHalfRight">
				<label style="display: block;">미디어 </label>
				<label>외부 문서, 사진, 사이트 동영상 프레젠테이션 링크 </label>
			</div>
			<div class="modalHalfRight" style="height: 30px;">
				<button class="btn btn-default fileUpload" style="height: 31px; padding: 0 10px 0 10px;">업로드</button>
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
	</div>
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="usersSave">저장</button>
</div>

<script>
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();

   // 배경이미지 실시간 변경하기
   function readBackgroundURL(input) { 
		if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('.modalBackground').css('background-image', 'url('+e.target.result+')'); 
		} 
		reader.readAsDataURL(input.files[0]); 
		} 
	}
   // 배경이미지 파일 변경시 
    $("#backgroundFile").change(function(){ 
		readBackgroundURL(this); 
	});
	
   // 배경이미지 변경 버튼 클릭시 파일업로드 하기
	$("#backgroundBtn").on("click",function(){
		$("#backgroundFile").click();
	});
	
   // 프로필이미지 실시간 변경하기
   function readProfileURL(input) { 
		if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('.modalprofile').css('background-image', 'url('+e.target.result+')'); 
		} 
		reader.readAsDataURL(input.files[0]); 
		} 
	}
	 
    // 프로필이미지 파일 변경시 
    $("#profileFile").change(function(){ 
		readProfileURL(this); 
	});
    
    // 프로필이미지 변경 버튼 클릭시 파일업로드 하기
	$("#profileBtn").on("click",function(){
		$("#profileFile").click();
	});
   
	// 미디어 업로드 버튼 클릭시 파일업로드 하기
	$(".fileUpload").on("click",function(){
		$(".fileUpload").parent().append('<input type="file" multiple="multiple" name="filesVo" style="display: none;">');
		$(".fileUpload").parent().children().last().click();
	});
	
	// 우체국 API
	$(".zipcodeSearch").on("click",function(){
		daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	   var addr = ''; 
	                   var extraAddr = ''; 

	                   if (data.userSelectedType === 'R') { 
	                       addr = data.roadAddress;
	                   } else { 
	                       addr = data.jibunAddress;
	                   }

	                   if(data.userSelectedType === 'R'){
	                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                           extraAddr += data.bname;
	                       }
	                       if(data.buildingName !== '' && data.apartment === 'Y'){
	                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                       }
	                       if(extraAddr !== ''){
	                           extraAddr = ' (' + extraAddr + ')';
	                       }
	                   }

	                   $(".zipcode").val(data.zonecode);
	                   $(".addr1").val(addr);
	                   $(".addr2").focus();
	            }
	        }).open();
	    });
	});
	
	$("#userBirth").datepicker({
        dateFormat: "yy-mm-dd" //Input Display Format 변경
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
    
    //초기값을 오늘 날짜로 설정
	$("#userBirth").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
</script>