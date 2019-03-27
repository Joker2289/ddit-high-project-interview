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
			
			사진이 있으면 회원님이 맞는지 쉽게 알 수 있습니다
			
			<input type="file" class="form-control" id="profile" name="profile" placeholder="사진">
			
		</form>
		
		
	
