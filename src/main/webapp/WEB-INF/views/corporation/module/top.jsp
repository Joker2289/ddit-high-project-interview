<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<div style="border: 1px solid;  height: 170px" >
	<img src="http://img.jobkorea.kr/images/logo/200/w/h/whwpwhwp_200.gif" alt="이미지를 찾을 수 없습니다." width="1168" height="170"></img><br>
	<div style="position: absolute;">
		<div style="border: 1px solid; position: relative; top: -50px; left: 30px; height: 105px; width: 105px;">
<%-- 		${getCorpInfo.logo_path } --%>
	        <img src="http://img.jobkorea.kr/images/logo/200/w/h/whwpwhwp_200.gif"  height="103" width="103" alt="이미지를 찾을 수 없습니다."/><br> 
	    </div>	
    </div>
</div>  
<div style="border: 1px solid;margin-top:-1px; height: 150px">
	<div style="margin-left: 155px; margin-top: 10px" > 
		<label for="corporationNm"> ${corporationInfo.corp_name} </label> 
			<div style="float: right; margin-right: 10px; ">
				<input type="button" value="+팔로우" name="follow" onclick="follow">
				<input type="button" value="..." name="report&follw" /> <br> 
			</div>
			<br>
		<label for="addr1">${corporationInfo.addr1 }</label> <br>
	</div>
	<div style="margin-top: 20px; margin-left: 30px;">
		<label> ${corporationInfo.corp_profile } </label>
		<br>  
		<br>  
		<input type="button" value="웹사이트 가기 ↗" name="corp_url"
			onclick="window.open('http://www.naver.com')" /> <br>
	</div>
</div>
