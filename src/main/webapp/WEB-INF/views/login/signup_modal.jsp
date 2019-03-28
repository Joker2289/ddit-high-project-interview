<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

  <div class="jk-modalsasun">
  	 <div class="jk-modal">
  
  
  	 <div class="jk-row">
	  	 <div id="modal-head" class="jk-modal-head">
	  	 		
	  	 </div>
  	 </div>
  	 
  	 
  	 <div class="jk-row">
	     <div id="modal-body" class="jk-modal-body">
			
		    
		 </div>
	 </div>  
	   
     <div class="jk-row">
	     <div id="modal-footer" class="jk-modal-footer">
	     	<button id="nextStep" class="jk-join-btn" type="button">다음</button>
	    	<button id="close" class="jk-close-btn" type="button">닫기</button>  
	     </div>
   	 </div>
   	 
   </div>
  
  </div>
  
  <script>
  	 var step = 1;
  
  	 //form 전송 object 타입으로 보낼때
     jQuery.fn.serializeObject = function() {
	    var obj = null;
	    try {
	        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
	            var arr = this.serializeArray();
	            if (arr) {
	                obj = {};
	                jQuery.each(arr, function() {
	                    obj[this.name] = this.value;
	                });
	            }//if ( arr ) {
	        }
	    } catch (e) {
	        alert(e.message);
	    } finally {
	    }
	 
	    return obj;
	};
	
	//닫기 버튼 클릭
  	$('#close').on('click',function(){
  		step = 1;
  		$('.jk-modalsasun').css('display','none');
	});
  	



	//다음 버튼 클릭
  	$('#nextStep').on('click', function(){
  		
  		if(step == 1) {
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
	  				step++;
	  				//$("#modal-footer").html('<button id="nextStep"class="jk-join-btn"type="button">다음</button><button id="close"class="jk-close-btn"type="button">닫기</button>');
	  				$("#modal-body").html('<form id="step2"><div class="wrap-input-custom validate-input m-b-50"data-validate="Security Code is reauired"><span class="label-input100">인종코드를입력해주세요</span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Security Code is reauired"><span class="label-input100">인증코드</span><input class="input100"type="text"name="securityCode"placeholder=" Security Code"><span class="focus-input100"data-symbol="&#xf206;"></span></div></form>');
	  			}
	  		});
  		}
	  		
  		if(step == 2) {
	  		//step2 - user
			var step2 = $("#step2").serializeObject();  //.serialize();
			console.log("step2 : " + JSON.stringify(step2));
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/step2",
	  			method : "post",
	  			data : JSON.stringify(step2),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data);
	  				
	  				if(data == "error"){
	  					alert("인증 번호가 틀렸습니다");
	  					return;
	  				}
	  				
	  				step++;
	  				$("#modal-body").html('<form id="step3"><div class="wrap-input-custom validate-input m-b-50"data-validate="Corporation Name is reauired"><span class="label-input100">최근다닌회사</span><input class="input100"type="text"name="corporate_name"placeholder=" Corporation Name"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Job Position is reauired"><span class="label-input100">직군</span><input class="input100"type="text"name="job_position"placeholder=" Job Position"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Job Rank is reauired"><span class="label-input100">직급</span><input class="input100"type="text"name="job_rank"placeholder=" Job Rank"><span class="focus-input100"data-symbol="&#xf206;"></span></div></form>');
	  			}
	  		});
  		}
  		
  		if(step == 3) {
	  		//step3 - user
			var step3 = $("#step3").serializeObject();  //.serialize();
			console.log("step3 : " + JSON.stringify(step3));
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/step3",
	  			method : "post",
	  			data : JSON.stringify(step3),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data);
	  				
	  				step++;
	  				$("#modal-body").html('<form id="step4">사진이있으면회원님이맞는지쉽게알수있습니다<input type="file"class="form-control"id="profile"name="profile"placeholder="사진"></form>');
	  			}
	  		});
  		}
  		
  		if(step == 4) {
	  		//step3 - user
			//var step4 = $("#step4").serializeObject();  //.serialize();
			//console.log("step4 : " + JSON.stringify(step4));
			var form = $("#step4")[0];
			var formData = new FormData(form);
			
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/step4",
	  			enctype: 'multipart/form-data',
	  			method : "post",
	  			data : formData,
	  			processData: false,
	  	        contentType: false,
	  	        cache: false,
	  	        timeout: 600000,
	  			success : function(data){
	  				console.log(data);
	  				
	  				step++;
	  				$("#modal-body").html('<form id="step3"><div class="wrap-input-custom validate-input m-b-50"data-validate="Corporation Name is reauired"><span class="label-input100">최근다닌회사</span><input class="input100"type="text"name="corporate_name"placeholder=" Corporation Name"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Job Position is reauired"><span class="label-input100">직군</span><input class="input100"type="text"name="job_position"placeholder=" Job Position"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Job Rank is reauired"><span class="label-input100">직급</span><input class="input100"type="text"name="job_rank"placeholder=" Job Rank"><span class="focus-input100"data-symbol="&#xf206;"></span></div></form>');
	  			}
	  		});
  		}
  		
  		
	});
  </script>
  
  
 
 
 
 
 
