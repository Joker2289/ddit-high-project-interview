<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Inter View - Login</title>
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
	<!-- 지도 script. (회사주소 - 좌표 변환) -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>      
   
   
   <!-- AutoComplete(자동완성)    css, script -->
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!-- kakao 로그인 script -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   
</head>
<body>
   
   <div class="limiter">
      <div class="container-login100" style="background-image: url('/css/login/images/linkedin.png');">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form id="login"class="login100-form validate-form" action="/login" method="post">
               <span class="login100-form-title p-b-49" style="padding-bottom: 0px;">
                  <!-- InterView -->
                  <img src="${ cp }/images/INTERVIEW.png"  width="330" height="100" style="width: 400px;height: 200px;">
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
            </form>   
            
            
            <!-- 카카오 정보 담을 폼 -->
           	<form id="kakaoForm">
               <input type="hidden" id="kakaoId" name="kakaoId">
               <input type="hidden" id="kakaoName" name="kakaoName">
               <input type="hidden" id="kakaoProfile" name="kakaoProfile">
            </form>
            
            
            <!-- 로그인시 전송 폼 -->
            <form id="kakaoLoginGo" action="/kakaoLogin" method="post">
            	 <input type="hidden" id="mem_id_kakao" name="mem_id">
            </form>
            
            
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
               
               <div class="flex-col-c p-t-70" style="padding-top: 20px;">
               
                  <!-- <a href="#" class="txt3">
                     Sign Up
                  </a> -->
                  <div class="txt1 text-center p-b-20">
                     <span>
                        Sign Up
                     </span>
                  </div>
                  

                  <div class="flex-c-m">
                     <a href="javascript:signupUser();" class="login100-social-item-custom bg2">
                        <i class="fa fa-user"></i>
                     </a>
                     
                     <a href="javascript:signupCorp();" class="login100-social-item-custom bg4">
                        <i class="fa fa-building"></i>
                     </a>
                  </div>
                  
                  
               </div>

               <div class="txt1 text-center p-t-54 p-b-20" style="padding-top: 18px;padding-bottom: 18px;">
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
                  
                  <a id="custom-login-btn" href="javascript:kakaoLogin();">
                     <%-- <img src="${cp}/css/login/images/kakaolink_btn_medium.png" width="100" /> --%>
                     <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
                  </a>
                  
               </div>
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
   
    <!-- 다음 우편번호 API -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   
   
   <%-- <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>  --%> 
   

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
              
        	  Kakao.API.request({
            	  
                url: '/v2/user/me',
                success: function(res) {
                	 
               	
                	 
                    
                 console.log(JSON.stringify(res));       // kakao.api.request 에서 불러온 결과값 json형태로 출력
                 console.log(JSON.stringify(authObj));    // Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
                 console.log(res.id);                  // id출력
                 console.log(res.kakao_account.has_email);    
                 console.log(res.properties['nickname']);   // 닉네임 출력 
                 console.log(res.properties.nickname);      // 닉네임 출력
                 console.log(authObj.access_token);      // 토큰 값 출력
                 console.log(res.properties.profile_image);// 프로필 이미지
                 
                 //console.log(res.account.email);         // 콘솔 로그에 email 정보 출력
                 //console.log(res.kakao_account.gender);
                 //console.log(res.created);
                 //console.log(res.status);
                 
                 $("#kakaoId").val(res.id);
                   $("#kakaoName").val(res.properties.nickname);
                   $("#kakaoProfile").val(res.properties.profile_image);
                 
                   //step1 - user
                   var kakaoForm = $("#kakaoForm").serializeObject();  
                   console.log("kakaoForm : " + JSON.stringify(kakaoForm));
                   
                   
                   
                   $.ajax({
                      
                       url : "${cp}/signUp/kakaoLogin",
                       method : "post",
                       contentType : "application/json; charset=uft-8",
                       data : JSON.stringify(kakaoForm),
                       success : function(data){
                    	   
                    	  	console.log(data);
                    	   
                    	    if(data == "회원가입"){
                    			//모달창 키지   
                    		   	$('.jk-modalsasun').css('display','block');
                    		   
                    		   	$.ajax({
                   	            	url   : "${cp}/signUp/kakaoSignUp",
                   	            	success : function(data){
                   	               
	                   	               	$(".jk-modal").html(data);
                   	            	}
                   	           	});
                    	   }
                    	   
                    	   if(data == "로그인"){
                    		   $("#mem_id_kakao").val(res.id);
	                    	   $("#kakaoLoginGo").submit();                           
                    	   }

                    	   
                       }
                 });
             }
            
             }); 
            
           },
           fail: function(err) {
             alert(JSON.stringify(err));
           }
         });
       };
       
        //회원가입 유저 클릭
        function signupUser(){
         $('.jk-modalsasun').css('display','block');
           
         $.ajax({
            url   : "${cp}/signUp/goStep1",
            data : {"division" : "1"},
            success : function(data){
               
               console.log(data);
               $(".jk-modal").html(data);
            }
         });
        };
        
        function signupCorp() {
         $('.jk-modalsasun').css('display','block');
           
           $.ajax({
            url   : "${cp}/signUp/goStep1",
            data : {"division" : "2"},
            success : function(data){
               
               console.log(data);
               $(".jk-modal").html(data);
               
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
        
           $("#login").submit();
        });
        
		// 엔터키 눌렀을 때 로그인
		$("#mem_id").keypress(function(e){
			if(e.which == 13){
	           if($("#md_3").prop("checked")){
	               Cookies.set("mem_id", $("#mem_id").val(), {expires : 30});
	               Cookies.set("md_3", "y", {expires : 30});         
	            } 
	            else {
	               Cookies.remove("mem_id");
	               Cookies.remove("md_3");
	            }
	         
	            $("#login").submit();
			}
		});		
		$("#pass").keypress(function(e){
			if(e.which == 13){
	           if($("#md_3").prop("checked")){
	               Cookies.set("mem_id", $("#mem_id").val(), {expires : 30});
	               Cookies.set("md_3", "y", {expires : 30});         
	            } 
	            else {
	               Cookies.remove("mem_id");
	               Cookies.remove("md_3");
	            }
	         
	            $("#login").submit();
			}
		});		        
        
     });
     
     
  </script>



</body>
</html>