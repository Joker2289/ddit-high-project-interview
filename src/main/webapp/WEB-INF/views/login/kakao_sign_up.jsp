<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 로그인시 전송 폼 -->
<form id="kakaoLoginGo_sign_up" action="/kakaoLogin" method="post">
	 <input type="hidden" id="mem_id_kakao_sign_up" name="mem_id">
</form>
	   	 
		
<script>

$(document).ready(function(){
	alert("회원가입을 축하드립니다");
	
	
	<c:if test="${ kakao_id != null }">
		
	
		$('#mem_id_kakao').val('${ kakao_id }');
		
		var test = $('#mem_id_kakao').val();
		
		$('#kakaoLoginGo').submit();
		
		$('.jk-modalsasun').css('display','none');
		
	</c:if>
	
});
</script>
		
		
		
		
    
		
	
