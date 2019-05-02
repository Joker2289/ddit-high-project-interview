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
						<div class="wrap-input-custom validate-input m-b-50">
							<span class="label-input100">대표전화</span>
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
						
						<input type="hidden" name="location_data" id="location_data">
						
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
		            	
		            	// 주소 - 좌표 변환.
		            	changeAddr(data.roadAddress);
		            	
		            	//상세주소 input focus
		            	$("#addr2").focus();

			        }
			     }).open();
			});
			
		
	  		
			//step4 
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
	  		
		function changeAddr(addr){
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();			
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {

			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			        
	            	var corp_lat = (coords.getLat())+"";
	            	corp_lat = corp_lat.substr(0, 8);
	            	
	            	var corp_lng = (coords.getLng())+"";
	            	corp_lng = corp_lng.substr(0, 9);			        
			        
	            	$("#location_data").val(corp_lat+"/"+corp_lng);
// 	            	alert(corp_lat+"/"+corp_lng);
			    } 
			});    			
		}
	  		
		</script>
		
		
		
		
    
		
	
