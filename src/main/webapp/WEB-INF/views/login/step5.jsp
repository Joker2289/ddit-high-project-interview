<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		step4
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
					
					<form id="step5">
						
						사진이 있으면 회원님이 맞는지 쉽게 알 수 있습니다
						
						<input type="file" class="form-control" id="profile" name="profile" placeholder="사진">
						
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
		
		
		$("#nextStep").on("click", function(){

				var form = $("#step5")[0];
				var formData = new FormData(form);
			
		  		$.ajax({
		  			
		  			url : "${cp}/signUp/finalStep",
		  			enctype: 'multipart/form-data',
		  			method : "post",
		  			data : formData,
		  			processData: false,
		  	        contentType: false,
		  	        cache: false,
		  	        timeout: 600000,
		  			success : function(data){
		  				console.log(data);
		  				$('.jk-modalsasun').css('display','none');
		  				alert("회원가입을 축하드립니다!!");
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
		
		
		
		
    
		
	
