<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step2.png"  width="500" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
		     		
					<!-- step2 (인증번호 인증) -->
					<form id="step2" class="validate-form">
						<div class="wrap-input-custom2 bt-padding40">
							<span class="label-custom">회원님의 email로 전송된 인증 코드를 입력 해주세요</span>
						</div>
						
					
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Security Code is reauired">
							<span class="label-input100">인증 코드</span>
							<input class="input100" type="text" id="securityCode" name="securityCode" placeholder=" Security Code">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom2">
							<button id="codeCheck" class="jk-btn-long" type="button">인증체크</button>
						</div>		
					</form>
					
					
			 </div>
		 </div>  
	     
	     <div class="jk-row">
		     <div id="modal-footer" class="jk-modal-footer">
		     		<button id="nextStep" class="jk-join-btn" type="button">Next</button>
	    			<button id="close" class="jk-close-btn" type="button">Close</button>  
		     </div>
	   	 </div>
	   	 
		<script>
		var check = false;
		
		$("#codeCheck").on('click', function(){
			
			//인증번호 체크
			if($("#securityCode").val().trim() == "") {
				alert("인증번호를 입력해주세요	");
				$("#securityCode").focus();
				return false;
			}

			//step2
			var step2 = $("#step2").serializeObject(); 
			console.log("step2 : " + JSON.stringify(step2));
			
			$.ajax({
	  			url : "/signUp/error_code",
	  			method : "post",
	  			data : JSON.stringify(step2),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				if(data == "error"){
	  					alert("인증 번호가 틀렸습니다");
	  					$("#codeCheck").html("인증실패");
	  					$("#codeCheck").css("background", "#D94739");
	  				}
	  				if(data == "success"){
	  					alert("인증 완료");
	  					$("#codeCheck").html("인증완료");
	  					$("#codeCheck").css("background", "#7DB150");
	  					check = true;
	  				}
	  			}
	  		});  	
			
		});
		
		$("#nextStep").on('click', function(){
			
			if(check){
				$.ajax({
		  			url : "${cp}/signUp/goStep3",
		  			method : "post",
		  			data : JSON.stringify(step2),
		  			contentType : "application/json; charset=uft-8",
		  			success : function(data){
		  				console.log(data + "3페이지로 가자");
		  				
		  				$(".jk-modal").html(data);
		  			}
		  		});
			}
			else{
				alert("이메일 인증을 완료해주세요");
			}
			
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
	  		
		</script>
		
		
		
		
    
		
	
