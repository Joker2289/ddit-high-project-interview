<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
		
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
		
		
		<button id="nextStep" class="jk-join-btn" type="button">다음</button>
	    <button id="close" class="jk-close-btn" type="button">닫기</button>
		
		<!-- --------------------------------------------------------------- -->
		
		<!-- step2 (인증번호 인증) -->
		<form id="step2">
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "Security Code is reauired">
				<span class="label-input100">인종 코드를 입력해주세요</span>
			</div>
		
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "Security Code is reauired">
				<span class="label-input100">인증 코드</span>
				<input class="input100" type="text" name="securityCode" placeholder=" Security Code">
				<span class="focus-input100" data-symbol="&#xf206;"></span>
			</div>
		</form>
		
		<!-- --------------------------------------------------------------- -->
		
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
		
		<!-- --------------------------------------------------------------- -->
		
		<!-- step4 -->
		<form id="step4">
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "College Name is reauired">
				<span class="label-input100">학교</span>
				<input class="input100" type="text" name="school_name" placeholder=" College Name">
				<span class="focus-input100" data-symbol="&#xf206;"></span>
			</div>
			
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "Degree Name is reauired">
				<span class="label-input100">학위</span>
				<input class="input100" type="text" name="degree_name" placeholder=" Degree Name">
				<span class="focus-input100" data-symbol="&#xf206;"></span>
			</div>
			
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "Major is reauired">
				<span class="label-input100">전공</span>
				<input class="input100" type="text" name="major" placeholder=" Major">
				<span class="focus-input100" data-symbol="&#xf206;"></span>
			</div>
			
				<input type="text" class="datepicker"> 
			
				<input type="text" class="datepicker"> 
			
			<div class="wrap-input-custom validate-input m-b-50" data-validate = "Grade is reauired">
				<span class="label-input100">학점</span>
				<input class="input100" type="text" name="grade" placeholder=" Grade">
				<span class="focus-input100" data-symbol="&#xf206;"></span>
			</div>
		</form>
		
		
		<script>
			    $(".datepicker").datepicker({
			                   dateFormat: "yy-mm-dd" //Input Display Format 변경
			                   ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			                   ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			                   ,changeYear: true //콤보박스에서 년 선택 가능
			                   ,changeMonth: true //콤보박스에서 월 선택 가능                
			                   ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			                   ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			                   ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			                   ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			                   ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			                   ,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"] //달력의 월 부분 텍스트
			                   ,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //달력의 월 부분 Tooltip 텍스트
			                   ,dayNamesMin: ["일","월","화","수","목","금","토"] //달력의 요일 부분 텍스트
			                   ,dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"] //달력의 요일 부분 Tooltip 텍스트
			                   ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			                   ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			               });                    
			               
			               //초기값을 오늘 날짜로 설정
			     $(".datepicker").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		</script>
		
		<!-- --------------------------------------------------------------- -->
		
		<!-- step5 -->
		<form id="step5">
			
			사진이 있으면 회원님이 맞는지 쉽게 알 수 있습니다
			
			<input type="file" class="form-control" id="profile" name="profile" placeholder="사진">
			
		</form>
		
		<!-- --------------------------------------------------------------- -->
		
		<input id="fromDate" type="text">
			
		<input id="toDate" type="text">
		
		<div class="container">
		    <div class="col-md-5"> 
		        <div class="form-group">
		            <div class="input-group date" id="datetimepicker6">
		                <input type="text" class="form-control" />
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-5">
		        <div class="form-group">
		            <div class="input-group date" id="datetimepicker7">
		                <input type="text" class="form-control" />
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>
		    </div>
		</div>
		
		
    
		
	
