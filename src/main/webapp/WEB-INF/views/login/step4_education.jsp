<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step4_education.png"  width="500" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					<!-- step4 -->
					<form id="step4">
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "College Name is reauired">
							<span class="label-input100">학교</span>
							<input class="input100" type="text" name="school_name" placeholder=" College Name">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Degree Name is reauired">
							<span class="label-input100">학위</span>
							<input class="input100" type="text" name="degree_name" placeholder=" Degree Name">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Major is reauired">
							<span class="label-input100">전공</span>
							<input class="input100" type="text" name="major" placeholder=" Major">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">입학년도</span>
							<input type="text" id="fromDate" name="admission" class="custom-select">
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">졸업년도</span>
							<input type="text" id="toDate" name="graduation" class="custom-select">
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">학점</span>
							
							<select name="grade" class="custom-select">
								 <option value="" hidden> Select Grade </option>
								<option value="4.5">	A+</option>
								<option value="4.0">	A</option>               
								<option value="3.7">	A-</option>               
								<option value="3.5">	B+</option>               
								<option value="3.0">	B</option>               
								<option value="2.7">	B-</option>               
								<option value="2.5">	C+</option>               
								<option value="2.0">	C</option>               
								<option value="1.7">	C-</option>               
								<option value="1.5">	D+</option>               
								<option value="1.0">	D</option>               
								<option value="0.7">	D-</option>               
								<option value="0">		F</option>              
							</select>
						</div>
						<div class="wrap-input-custom2">
							<button id="step_career" class="jk-btn-long3" type="button">학생이 아닙니다</button>
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
		
		$(document).ready(function(){
			
		
	  		$("#fromDate").datepicker({
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
	            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	        });                    
	        
	        //초기값을 오늘 날짜로 설정
	  		$("#fromDate").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	  		
	  		$("#toDate").datepicker({
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
	            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	        });                    
	        
	        //초기값을 오늘 날짜로 설정
	  		$("#toDate").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		
	  		
	  		
			//step4 - user
			$("#nextStep").on("click", function(){
				var step4 = $("#step4").serializeObject();  //.serialize();
				console.log("step4 : " + JSON.stringify(step4));
				
				$.ajax({
		  			
		  			url : "${cp}/signUp/goStep5FromEducation",
		  			method : "post",
		  			data : JSON.stringify(step4),
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
		  		} else {
		  			
		  			
		  		}
			});
			
		  	//경력정보 입력 단계로 이동
			$("#step_career").on('click', function(){
				
		  		$.ajax({
		  			
		  			url : "${cp}/signUp/returnStepCareer",
		  			method : "post",
		  			success : function(data){
		  				$(".jk-modal").html(data);
		  			}
		  		});
		  		
			});
		});
	  		
	  		
		</script>
		
		
		
		
    
		
	
