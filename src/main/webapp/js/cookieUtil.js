/*
				-- complete
				0. java에서 쿼리 파싱하기
				
				
				-- todo
				1. javascript에서 쿼리 파싱하기

*/

/**
 * 
 * @param cookieName
 * 쿠키 이름으로 해당 쿠키 값을 조회
 */
function getCookieValue(cookieName) {
	
	//java
	
//	String[] cookieValue = null;
//	for(int i=0; i<cookieArray.length; i++) {
//		cookieValue = cookieArray[i].split("=");
//		
//		if(cookieValue[0].equals(cookieName)) {
//			break;
//		}
//	}
//	
//	return cookieValue[1];
	
	//javascript
	
	var cookieValue = "";																																										
	var cookieArray = document.cookie.split("; ");
	for(var i=0; i<cookieArray.length; i++){
		
		var cookie = cookieArray[i];
		if(cookieName == cookie.split("=")[0]){		//cookieName
			cookieValue = cookie.split("=")[1];		//cookieValue
			break;
		}
	}
	return cookieValue;
	
}

/**
 * 
 * @param cookieName	//쿠키 이름
 * @param cookieValue	//쿠키 값
 * @param expires		//쿠키 제한 일수 
 * 쿠키 생성
 */
function setCookie(cookieName, cookieValue, expires){
	//현재 날짜 기준으로 expires 날짜 만큼 유효한 cookie 생성
	//쿠키 생성 방법 : document.cookie = " cookie 문자열 포맷 ";
	//cookie 문자열 포맷 : cookieName = cookieValue; path=/; expires=gmtString
	
	//현재 날짜 생성
	var today = new Date();
	today.setDate(today.getDate() + parseInt(expires));
	
	document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString();
	
}

/**
 * 
 * @param cookieName
 * 쿠키 삭제
 */
function deleteCookie(cookieName) {
	var dt = new Date();			//오늘 날짜
	dt.setDate( dt.getDate() -1 ); 	//하루 전 날짜
	
	document.cookie = cookieName + "=; /path=/; expires=" + dt.toGMTString();
}