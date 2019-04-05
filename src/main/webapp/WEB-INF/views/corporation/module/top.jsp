<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<div style="border: 1px solid;  height: 170px" >
	<img src="/images/logo/HTML-500.png" alt="이미지를 찾을 수 없습니다." width="1168" height="170"></img><br>
	<div style="position: absolute;">
		<div style="border: 1px solid; position: relative; top: -50px; left: 30px; height: 105px; width: 105px;">
	        <img src="/images/logo/ruda.png"  height="103" width="103" alt="이미지를 찾을 수 없습니다."/><br>
	    </div>	
    </div>
</div>  
<div style="border: 1px solid;margin-top:-1px; height: 150px">
	<div style="margin-left: 155px; margin-top: 10px" > 
		<label for="corporationNm"> 500 error </label> <label>${SESSION_MEMBERVO.mem_id }</label>
			<div style="float: right; margin-right: 10px; ">
				<input type="button" value="+팔로우" name="follow" onclick="follow">
				<input type="button" value="..." name="report&follw" /> <br> 
			</div>
			<br>
		<label for="addr1">대전광역시 중구 중앙로 76 영민빌딩 2층</label> <label>${SESSION_MEMBERVO.mem_id }</label> <br>
	</div>
	<div style="margin-top: 20px; margin-left: 30px;">
		<label> 안녕하세요 500error 입니다. 저희 회사는 error를 자주 냅니다.${SESSION_MEMBERVO.mem_id } </label>
		<br>  
		<br>  
		<input type="button" value="웹사이트 가기 ↗" name="corp_url"
			onclick="window.open('http://www.naver.com')" /> <br>
	</div>
</div>
