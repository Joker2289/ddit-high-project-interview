<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step3_corp.png"  width="500" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					<!-- step3 -->
					<form id="step3">
						
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">업계</span>
							<input class="input100" type="text" id="industry_type" name="industry_type" placeholder=" 회사 업계 작성">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
					
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">회사유형</span>
							<select name="corp_type" class="custom-select">
								<option value="" hidden> 			회사유형 선택 </option>
								<option value="개인사업">		개인사업</option>
								<option value="교육기관">		교육기관</option>               
								<option value="비상장기업">	비상장기업</option>               
								<option value="비영리">		비영리</option>               
								<option value="상장기업">		상장기업</option>               
								<option value="자영업">		자영업</option>               
								<option value="정부기관">		정부기관</option>               
								<option value="합명회사">		합명회사</option>               
							</select>
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">회사 규모</span>
							<select name="corp_size" class="custom-select">
								<option value="" hidden> 회사 규모 선택 </option>
								<option value="직원 50명 미만">		직원 50명 미만</option>
								<option value="직원 50명-100명">	직원 50명-100명</option>               
								<option value="직원 101명-200명">		직원 101명-200명</option>               
								<option value="직원 201명-300명">	직원 201명-300명</option>               
								<option value="직원 301명-400명">	직원 301명-400명</option>               
								<option value="직원 401명-500명">	직원 401명-500명</option>               
								<option value="직원 501명-1000명">		직원 501명-1000명</option>               
								<option value="직원 1000명 이상">		직원 1000명 이상</option>               
								<option value="직원 5000명 이상">		직원 5000명 이상</option>               
								<option value="직원 10000명 이상">		직원 10000명 이상</option>               
							</select>
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">창립일</span>
							<input type="text" id="corp_birth" name="corp_birth" class="custom-select">
						</div>
						
					</form> 
					
			 </div>
		 </div>  
	     
	     <div class="jk-row">
		     <div id="modal-footer" class="jk-modal-footer">
		     		<button id="nextStep" class="jk-join-btn" type="button">다음</button>
	    			<button id="close" class="jk-close-btn" type="button">닫기</button>  
		     </div>
	   	 </div>
		
		
		<script>
		
		$("#corp_birth").datepicker({
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
  		$("#corp_birth").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
  		     
  		$("#nextStep").on('click', function(){
			
			//step3 - user
			var step3 = $("#step3").serializeObject();  //.serialize();
			console.log("step3 : " + JSON.stringify(step3));
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/goStep4_corp",
	  			method : "post",
	  			data : JSON.stringify(step3),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data);
	  				$(".jk-modal").html(data);
	  			}
	  		});
	  		
		});
		
		//닫기 버튼 클릭
	  	$('#close').on('click',function(){
	  		
	  		var result = confirm("지금 까지 입력한 정보가 삭제 됩니다");
	  		
	  		if(result){
	  			$.ajax({
	  	  			
	  	  			url : "${cp}/signUp/cancel",
	  	  			method : "post",
	  	  			contentType : "application/json; charset=uft-8",
	  	  			success : function(data){
	  	  				console.log(data);
	  	  				
	  	  			}
	  	  		});
	  			
				$('.jk-modalsasun').css('display','none');
	  		} 
	  		
		});
		</script>
		
		
		
		
    
		
	
