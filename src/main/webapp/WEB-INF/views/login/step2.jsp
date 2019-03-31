<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<h1> 이메일 인증 </h1>
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
		     		
					<!-- step2 (인증번호 인증) -->
					<form id="step2">
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Security Code is reauired">
							<span class="label-input100">인종 코드를 입력해주세요</span>
						</div>
					
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Security Code is reauired">
							<span class="label-input100">인증 코드</span>
							<input class="input100" type="text" id="securityCode" name="securityCode" placeholder=" Security Code">
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
		
		
		$("#nextStep").on('click', function(){
			
			//아이디
			if($("#securityCode").val().trim() == "") {
				alert("인증번호를 입력해주세요	");
				$("#securityCode").focus();
				return false;
			}
		
			
			//step2 - user
			var step2 = $("#step2").serializeObject();  //.serialize();
			console.log("step2 : " + JSON.stringify(step2));
			$.ajax({
	  			
	  			url : "${cp}/signUp/error_code",
	  			method : "post",
	  			data : JSON.stringify(step2),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				if(data == "error"){
	  					alert("인증 번호가 틀렸습니다");
	  					return;
	  				}
	  				if(data == "success"){
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
	  			}
	  		});  		
			
					$.ajax({
			  			
			  			url : "${cp}/signUp/goStep3",
			  			method : "post",
			  			data : JSON.stringify(step2),
			  			contentType : "application/json; charset=uft-8",
			  			success : function(data){
			  				console.log(data + "3페이지로 가자");
			  				
			  				if(data == "error"){
			  					alert("인증 번호가 틀렸습니다");
			  					return;
			  				}
			  				
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
	  		
		</script>
		
		
		
		
    
		
	
