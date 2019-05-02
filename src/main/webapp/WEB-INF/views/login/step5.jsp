<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		<div class="jk-row">
	  	 	<div id="modal-head" class="jk-modal-head">
	  	 		
	  	 		<img src="${ cp }/images/step5.png"  width="550" height="80">
	  	 		
	  	 	</div>
  	 	</div>
	  	 
	  	 
		<div class="jk-row">
		     <div id="modal-body" class="jk-modal-body">
		     		
		     		
		     		<div class="wrap-input-custom2 bt-padding20">
							<span class="label-custom">프로필을 등록하여 인맥들에게 알리세요</span>
					</div>
					
					<div class="wrap-input-custom3">
						<div class="image-radius">
							<img src="${ cp }/images/profile/basicProfile.png" id="profileImg" width="250px" height="250px">
						</div>
					</div>
					
					
					
					
					<form id="step5">
						<div class="filebox wrap-input-custom3">
							<input class="upload-name" value="파일 선택" disabled="disabled"> 
							
							<label for="ex_filename">업로드</label>
							<input type="file" id="ex_filename" name="profile" class="upload-hidden" placeholder="사진" onchange="LoadImg(this);">
						</div>
					</form>
					
			 </div>
		 </div>  
	     
	     <div class="jk-row">
		     <div id="modal-footer" class="jk-modal-footer">
		     		<button id="nextStep" class="jk-join-btn" type="button">가입완료</button>
	    			<button id="close" class="jk-close-btn" type="button">닫기</button>  
		     </div>
	   	 </div>
	   	 
	   	 
	   	 
		
		<script>
		
		var fileTarget = $('.filebox .upload-hidden'); 
		
		fileTarget.on('change', function(){ 
			// 값이 변경되면 
			if(window.FileReader){ 
				// modern browser
				var filename = $(this)[0].files[0].name; } 
			else { 
				// old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); 
				// 파일명만 추출 
			} 
			// 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename); 
		});

		
		//업로드 이미지 미리보기
		function LoadImg(data){
			
			if(data.files && data.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$("#profileImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(data.files[0]);
			}
		}
		
		//가입완료 버튼 클릭
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
		  				
		  				if(data == '회원'){
		  					alert("회원가입을 축하드립니다!!");
		  				} else{
		  					alert("업체코드는  " + data + "  입니다");
		  				}
		  				
		  				$('.jk-modalsasun').css('display','none');
		  				
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
		
		
		
		
    
		
	
