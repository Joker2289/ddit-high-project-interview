<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		step1
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
		     		<!-- step1  -->
					<form id="step1">
						<div class="wrap-input-custom validate-input m-b-50"
							data-validate="Username is reauired">
							<span class="label-input100">ID</span><input class="input100"
								type="text" name="id" placeholder=" Your ID"><span
								class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						<div class="wrap-input-custom validate-input m-b-50"
							data-validate="Password is required">
							<span class="label-input100">Pass word</span><input class="input100"
								type="password" name="pass" placeholder=" Your Password"><span
								class="focus-input100" data-symbol="&#xf190;"></span>
						</div>
						<div class="wrap-input-custom validate-input m-b-50"
							data-validate="Username is reauired">
							<span class="label-input100">Your Name</span><input class="input100"
								type="text" name="name" placeholder=" Your Name"><span
								class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						<div class="wrap-input-custom validate-input m-b-50"
							data-validate="Username is reauired">
							<span class="label-input100">e-mail</span><input class="input100"
								type="text" name="email" placeholder=" e-mail"><span
								class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						<input type="hidden" name="division" value="1">
						<input type="hidden" name="step" value="1">
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
			//step1 - user
			var step1 = $("#step1").serializeObject();  //.serialize();
			console.log("step1 : " + JSON.stringify(step1));
			
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/step1",
	  			method : "post",
	  			data : JSON.stringify(step1),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data);
	  				
	  				if(data == "error"){
	  					alert("잘못된 이메일 주소 입니다");
	  					return;
	  				}
	  				
	  				$(".jk-modal").html(data);
	  			}
	  		});
		});
			
	  		
		</script>
		
		
		
		
    
		
	
