<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>JK Board - Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/css/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/css/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/css/login/css/main.css">
	<link rel="stylesheet" type="text/css" href="/css/login/css/item.css">
	<link rel="stylesheet" type="text/css" href="/css/modal.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/css/login/images/code.jpeg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="/login" method="post">
					<span class="login100-form-title p-b-49">
						InterView
					</span>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" id="mem_id" name="mem_id" placeholder=" Your ID">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Pass word</span>
						<input class="input100" type="password" id="pass" name="pass" placeholder=" Your Password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<!-- 체크박스 -->
					<div class="row">
						<input type="checkbox" id="md_3">
	  					<label for="md_3" class="green"></label>
	  				</div>
	  				
	  				<!-- 로그인 버튼 -->
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="signin">
								LOGIN
							</button>
						</div>
					</div>
					
					<div class="flex-col-c p-t-70">
					
						<button type="button" id="signupUser" class="btn btn-primary jk-sign-btn">
						  Sign Up User
						</button>
						
					
<!-- 						<a href="#" class="txt3"> -->
<!-- 							Sign Up -->
<!-- 						</a> -->
						
						<span class="txt1 p-b-17">
						</span>
						
<!-- 						<a href="#" class="txt3"> -->
<!-- 							Forgot ID & PW? -->
<!-- 						</a> -->

						<button type="button" id="signupCorp" class="btn btn-primary jk-join-btn" >
						  Sign Up Corp
						</button>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="http://www.facebook.com" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="https://twitter.com/?lang=ko" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="http://www.google.com" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	
<!--===============================================================================================-->
	<script src="/css/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/css/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/css/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/css/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/css/login/js/main.js"></script>
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>

	<!-- 쿠키 관련 -->
	<script src="<%=request.getContextPath()%>/js/cookieUtil.js"></script>
	<script src="<%=request.getContextPath()%>/js/js.cookie.js"></script>
	
	<%@ include file="/WEB-INF/views/login/signup_modal.jsp" %>
	
	<script>
  	$(document).ready(function(){
  		
  		
  		//쿠키 설정
  		if(Cookies.get("mem_id")){
  			$("#mem_id").val(Cookies.get("mem_id"));
  			$("#md_3").prop("checked", true);		
  		}
  		
  		$("#signin").click(function(){
  			
  			if($("#md_3").prop("checked")){
  				Cookies.set("mem_id", $("#mem_id").val(), {expires : 30});
  				Cookies.set("md_3", "y", {expires : 30});			
  			} 
  			else {
  				Cookies.remove("mem_id");
  				Cookies.remove("md_3");
  			}
  		
  			$("form").submit();
  			
  		});
  		
  		
  		//회원가입 유저 클릭
  		$('#signupUser').on('click',function(){
  			$('.jk-modalsasun').css('display','block');
  			$('#modal-head').html('<h1>User - STEP 1</h1>');
  			$('#modal-body').html('<form id="step1"><div class="wrap-input-custom validate-input m-b-50"data-validate="Username is reauired"><span class="label-input100">ID</span><input class="input100"type="text"name="id"placeholder=" Your ID"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Password is required"><span class="label-input100">Pass word</span><input class="input100"type="password"name="pass"placeholder=" Your Password"><span class="focus-input100"data-symbol="&#xf190;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Username is reauired"><span class="label-input100">Your Name</span><input class="input100"type="text"name="name"placeholder=" Your Name"><span class="focus-input100"data-symbol="&#xf206;"></span></div><div class="wrap-input-custom validate-input m-b-50"data-validate="Username is reauired"><span class="label-input100">e-mail</span><input class="input100"type="text"name="email"placeholder=" e-mail"><span class="focus-input100"data-symbol="&#xf206;"></span></div><input type="hidden"name="division"value="1"><input type="hidden"name="step"value="1"></form>');
  			//$('#modal-footer').html('<button id="nextStep"class="jk-join-btn"type="button">다음</button><button id="close"class="jk-close-btn"type="button">닫기</button>');
  			
  		});
  		
  		//회원가입 기업 클릭
  		$('#signupCorp').on('click',function(){
  			
  		});
  		
  		
  		
  	});
  

  	
  	
  </script>



</body>
</html>