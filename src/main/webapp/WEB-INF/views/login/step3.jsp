<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		step3
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					<!-- step3 -->
					<form id="step3">
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Corporation Name is reauired">
							<span class="label-input100">최근 다닌 회사</span>
							<input class="input100" type="text" name="corporate_name" placeholder=" Corporation Name">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Job Position is reauired">
							<span class="label-input100">직군</span>
							<input class="input100" type="text" name="job_position" placeholder=" Job Position">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Job Rank is reauired">
							<span class="label-input100">직급</span>
							<input class="input100" type="text" name="job_rank" placeholder=" Job Rank">
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
			
			//step3 - user
			var step3 = $("#step3").serializeObject();  //.serialize();
			console.log("step3 : " + JSON.stringify(step3));
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/step3",
	  			method : "post",
	  			data : JSON.stringify(step3),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data+"4페이지로 가자");
	  				$(".jk-modal").html(data);
	  			}
	  		});
	  		
		});
	  		
		</script>
		
		
		
		
    
		
	
