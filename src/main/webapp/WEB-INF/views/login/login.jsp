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
	<!-- jQuery UI CSS파일 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<!-- jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<!-- jQuery UI 라이브러리 js파일 --> 
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>    
	
	
	<!-- AutoComplete(자동완성)	 css, script -->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- kakao 로그인	 script -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
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
						  User
						</button>
						
					
<!-- 						<a href="#" class="txt3"> -->
<!-- 							Sign Up -->
<!-- 						</a> -->
						
						<span class="txt1 p-b-17">
						</span>
						


						<button type="button" id="signupCorp" class="btn btn-primary jk-sign-btn" >
						  Corpation
						</button>
						
						
						
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<!-- <a href="http://www.facebook.com" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="https://twitter.com/?lang=ko" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="http://www.google.com" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a> -->
						
						<a id="custom-login-btn" class="login100-social-item" href="javascript:kakaoLogin();">
							<img src="${cp}/css/login/images/kakaolink_btn_medium.png" width="100" />
							<!-- <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/> -->
						</a>
						
						<%-- <a id="custom-login-btn" class="login100-social-item" href="https://kauth.kakao.com/oauth/authorize?client_id=5bc077e20fdb3cf12fec5e1abbccc2bc&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
							<img src="${cp}/css/login/images/kakaolink_btn_medium.png" width="100" />
						</a> --%>
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
	
	
<%-- 	<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>  --%>
	

	<!-- 쿠키 관련 -->
	<script src="<%=request.getContextPath()%>/js/cookieUtil.js"></script>
	<script src="<%=request.getContextPath()%>/js/js.cookie.js"></script>
	
	
	<%@ include file="/WEB-INF/views/login/signup_modal.jsp" %>
	
	<script>
	
	
		// API KEY : 47f91cddcc83e3f0e48917969701abe1
		
		
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('47f91cddcc83e3f0e48917969701abe1');
	    function kakaoLogin() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({
	    	
	        success: function(authObj) {
	        	
	          alert(JSON.stringify(authObj));
	          console.log(authObj);
	          
	           Kakao.API.request({
	           
	        	  url: '/v1/user/me',
	              success: function(res) {
	            	  
	        	  alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
	              alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
	  
	              console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
	              console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 
	              console.log(res.profile_image);
	              console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
	              // res.properties.nickname으로도 접근 가능 )
	              console.log(res.created);
	              console.log(res.status);
	              console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
	  
	              //$('#kakao_id').val(res.properties.id);
	              //$('#kakao_nickname').val(res.properties.nickname);  
	  
	             var d = new Date();
	  
	             document.write(res.properties.nickname+"님 환영합니다.");
	             document.write('');
	             document.write('접속시간 : '+ d.getFullYear()+'/'+d.getMonth()+'/'+d.getDate()+'/'+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds());
	  
	             document.write('');
	             document.write(res.id);
	              
	  
	           
	  
	          }
	  
	          	
	         
	          }) 
	         
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	      
	    };
	    
	    
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
  			
			$.ajax({
				url	: "${cp}/signUp/goStep1",
				success : function(data){
					
					console.log(data);
					$(".jk-modal").html(data);
					
					
				}
			});
  			
  		});
  		
  		//회원가입 기업 클릭
  		$('#signupCorp').on('click',function(){
  			
  		});
  	});
  

  	
  	
  </script>



</body>
</html>