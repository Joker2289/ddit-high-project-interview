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
		     		
					<!-- step3 -->
					<form id="step3">
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Corporation Name is reauired">
							<span class="label-input100">최근 다닌 회사</span>
							<input class="input100" type="text" id="corporate_name" name="corporate_name" placeholder=" Corporation Name">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom validate-input m-b-50" data-validate = "Job Position is reauired">
							<span class="label-input100">직군</span>
							<input class="input100" type="text" id="job_position" name="job_position" placeholder=" Job Position">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">직 급</span>
							<select name="jab_rank" class="custom-select">
								<option value="" hidden> 직급 선택 </option>
								<option value="회장">		회장</option>
								<option value="부회장">	부회장</option>               
								<option value="사장">		사장</option>               
								<option value="부사장">	부사장</option>               
								<option value="전무이사">	전무이사</option>               
								<option value="상무이사">	상무이사</option>               
								<option value="이사">		이사</option>               
								<option value="부장">		부장</option>               
								<option value="차장">		차장</option>               
								<option value="과장">		과장</option>               
								<option value="계장">		계장</option>               
								<option value="대리">		대리</option>               
								<option value="주임">		주임</option>
								<option value="사원">		사원</option>
								<option value="인턴">		인턴</option>              
							</select>
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">입사일</span>
							<input type="text" id="fromDate" name="join_date" class="custom-select">
						</div>
						
						<div class="wrap-input-custom2">
							<span class="label-input100-custom">퇴사일</span>
							<input type="text" id="toDate" name="resign_date" class="custom-select">
						</div>
						
					</form> 
					
					<div class="wrap-input-custom2">
						<button id="step4" class="jk-btn-long2" type="button">아직 학생 이세요??</button>
					</div>			 
			 
			 </div>
		 </div>  
	     
	     <div class="jk-row">
		     <div id="modal-footer" class="jk-modal-footer">
		     		<button id="nextStep" class="jk-join-btn" type="button">다음</button>
	    			<button id="close" class="jk-close-btn" type="button">닫기</button>  
		     </div>
	   	 </div>
		
		
		<script>
 		$("#job_position").keyup(function(){
			 
			 var keyword_job_position = $("#job_position").val();

			 
			    $("#job_position").autocomplete({
			    	
			        source : function(request, response){
			         $.ajax({
			             type:"post",
			             //dataType:"json",                  					  	//data를 json으로 return 받음.
			             url:"/signUp/searchPosition",          					//json으로 데이터를 반환해야한다.
			             data:{"keyword" : keyword_job_position},
			             //contentType : "application/json; charset=uft-8",
			             success:function(data){
			               response($.map(data, function(item){     				//function의 item에 data가 바인딩된다.
			               return{
			                                         //기본적으로 label과 value를 사용하지만 custom 변수를 선언해서 사용 가능하다. ui.item.변수명으로 사용가능함.
			                                         //data는 반환한 배열, data[i].USER_INFO 및 아래 선언된 KEY값이 들어가있다.
			                
			                label:item.position,
			                value:item.position
			              
			               }
			              }));
			             },
			             error: function(jqxhr, status, error){
			                  alert(jqxhr.statusText + ",  " + status + ",   " + error);
			                  alert(jqxhr.status);
			                  alert(jqxhr.responseText);
			             }
			            });
			        },
			        
			        autoFocus:true,             //첫번째 값을 자동 focus한다.
			        matchContains:true,
			        minLength:1,               //1글자 이상 입력해야 autocomplete이 작동한다.
			        delay:100,                 //milliseconds
			        select:function(event,ui){         //ui에는 선택된 item이 들어가있다.(custom 변수 포함)
			         $("#job_position").val(ui.item.label);
			         selectedUser = ui.item.label;
			         
			         //fn_regist()가 중복실행되서 처리함.
			         var flag = false;
			         $("#job_position").keydown(function(e){   //엔터키를 통해 등록 script를 실행(선택시의 enter와는 별개로 작동한다.)
			          if(e.keyCode == 13){
			           if(!flag){
			             fn_regist();    //등록 함수(선택한 후 엔터키 입력시 실행될 function)
			            flag = true;
			           }
			          }
			         });
			        },
			        focus:function(event, ui){return false;} //한글입력시 포커스이동하면 서제스트가 삭제되므로 focus처리
			      
			    });
	
		 });
 		
 		
 		
 		$("#corporate_name").keyup(function(){
			 
			 var keyword_corporate_name = $("#corporate_name").val();

			 
			    $("#corporate_name").autocomplete({
			    	
			        source : function(request, response){
			         $.ajax({
			             type:"post",
			             //dataType:"json",                  					  	//data를 json으로 return 받음.
			             url:"/signUp/searchCorp",          					//json으로 데이터를 반환해야한다.
			             data:{"keyword" : keyword_corporate_name},
			             //contentType : "application/json; charset=uft-8",
			             success:function(data){
			               console.log(data);	 
			            	 
			               response($.map(data, function(item){     				//function의 item에 data가 바인딩된다.
			               return{
			                                         //기본적으로 label과 value를 사용하지만 custom 변수를 선언해서 사용 가능하다. ui.item.변수명으로 사용가능함.
			                                         //data는 반환한 배열, data[i].USER_INFO 및 아래 선언된 KEY값이 들어가있다.
			                
			                label:item.corp_name,
			                value:item.corp_name
			              
			               }
			              }));
			             },
			             error: function(jqxhr, status, error){
			                  alert(jqxhr.statusText + ",  " + status + ",   " + error);
			                  alert(jqxhr.status);
			                  alert(jqxhr.responseText);
			             }
			            });
			        },
			        
			        autoFocus:true,             //첫번째 값을 자동 focus한다.
			        matchContains:true,
			        minLength:1,               //1글자 이상 입력해야 autocomplete이 작동한다.
			        delay:100,                 //milliseconds
			        select:function(event,ui){         //ui에는 선택된 item이 들어가있다.(custom 변수 포함)
			         $("#corporate_name").val(ui.item.label);
			         selectedUser = ui.item.label;
			         
			         //fn_regist()가 중복실행되서 처리함.
			         var flag = false;
			         $("#corporate_name").keydown(function(e){   //엔터키를 통해 등록 script를 실행(선택시의 enter와는 별개로 작동한다.)
			          if(e.keyCode == 13){
			           if(!flag){
			             fn_regist();    //등록 함수(선택한 후 엔터키 입력시 실행될 function)
			            flag = true;
			           }
			          }
			         });
			        },
			        focus:function(event, ui){return false;} //한글입력시 포커스이동하면 서제스트가 삭제되므로 focus처리
			      
			    });
	
		 });
		
		$("#fromDate").datepicker({
            dateFormat: "yy-mm-dd" //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"] //달력의 월 부분 텍스트
            ,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ["일","월","화","수","목","금","토"] //달력의 요일 부분 텍스트
            ,dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"] //달력의 요일 부분 Tooltip 텍스트
        });                    
        
        //초기값을 오늘 날짜로 설정
  		$("#fromDate").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
  		
  		$("#toDate").datepicker({
            dateFormat: "yy-mm-dd" //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"] //달력의 월 부분 텍스트
            ,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ["일","월","화","수","목","금","토"] //달력의 요일 부분 텍스트
            ,dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"] //달력의 요일 부분 Tooltip 텍스트
        });                    
        
  		
        //초기값을 오늘 날짜로 설정
  		$("#toDate").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		
  		
  		$("#nextStep").on('click', function(){
			
			//step3 - user
			var step3 = $("#step3").serializeObject();  //.serialize();
			console.log("step3 : " + JSON.stringify(step3));
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/goStep5From3",
	  			method : "post",
	  			data : JSON.stringify(step3),
	  			contentType : "application/json; charset=uft-8",
	  			success : function(data){
	  				console.log(data+"5페이지로 가자");
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
		
		//학력정보 입력 단계로 이동
		$("#step4").on('click', function(){
			
	  		$.ajax({
	  			
	  			url : "${cp}/signUp/returnStep4",
	  			method : "post",
	  			success : function(data){
	  				console.log(data+"4페이지로 가자");
	  				$(".jk-modal").html(data);
	  			}
	  		});
	  		
		});
		</script>
		
		
		
		
    
		
	
