<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step3.png"  width="500" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					<!-- step4 -->
					<form id="step3">
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">연락처</span>
							<input class="input100" type="text" name="telno" placeholder=" '-' 빼고 입력해주세요">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">우편번호</span>
							<input class="input100" type="text" id="zipcode" name="zipcode" placeholder=" 우편번호" readonly>
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom2">
							<button id="zipcodeBtn" class="jk-btn-long" type="button">조회</button>
						</div>			
						
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">주소</span>
							<input class="input100" type="text" id="addr1" name="addr1" placeholder=" 주소 입력">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">상세주소</span>
							<input class="input100" type="text" id="addr2" name="addr2" placeholder=" 상세주소 입력">
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
			
		
			//step3 
			$("#nextStep").on("click", function(){
				var step3 = $("#step3").serializeObject();  //.serialize();
				
				$.ajax({
		  			
		  			url : "${cp}/signUp/goStep4",
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
		  		} else {
		  			
		  			
		  		}
			});
		
		});
	  		
		</script>

		
		
		
    
		
	
