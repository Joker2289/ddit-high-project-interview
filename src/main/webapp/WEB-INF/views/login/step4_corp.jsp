<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step4_corp.png"  width="500" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					<!-- step4 -->
					<form id="step4">
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "College Name is reauired">
							<span class="label-input100">대표전화</span>
							<input class="input100" type="text" name="telno" placeholder=" Corp">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Degree Name is reauired">
							<span class="label-input100">우편번호</span>
							<input class="input100" type="text" id="zipcode" name="zipcode" placeholder=" Degree Name">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom">
							<button id="zipcodeBtn" class="btn btn-primary jk-sign-btn" type="button">우편번호 검색</button>
						</div>		
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Major is reauired">
							<span class="label-input100">주소</span>
							<input class="input100" type="text" id="addr1" name="addr1" placeholder=" Major">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Major is reauired">
							<span class="label-input100">상세주소</span>
							<input class="input100" type="text" id="addr2" name="addr2" placeholder=" Major">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
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
			
			//우편번호 검색 버튼 클릭 이벤트 : 다음 주소검색 팝업 open
			$("#zipcodeBtn").on("click", function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			            
			            console.log(data);
			            
			            //새 우편번호 : data.zonecode
			            $("#zipcode").val(data.zonecode);
			            
		            	//기본주소(도로주소) : data.roadAddress
			            $("#addr1").val(data.roadAddress);
		            	
		            	//상세주소 input focus
		            	$("#addr2").focus();
			        }
			     }).open();
			});
			
		
	  		
			//step4 - user
			$("#nextStep").on("click", function(){
				var step4 = $("#step4").serializeObject();  //.serialize();
				console.log("step4 : " + JSON.stringify(step4));
				
				$.ajax({
		  			
		  			url : "${cp}/signUp/goStep5_corp",
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
			$("#step3").on('click', function(){
				
		  		$.ajax({
		  			
		  			url : "${cp}/signUp/returnStep3",
		  			method : "post",
		  			success : function(data){
		  				console.log(data);
		  				$(".jk-modal").html(data);
		  			}
		  		});
		  		
			});
		});
	  		
	  		
		</script>
		
		
		
		
    
		
	
