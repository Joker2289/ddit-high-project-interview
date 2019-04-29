<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="js/jquery.form.js"></script>
	<link href="/css/recruit/recruit.css" type="text/css" rel="stylesheet">
	<title>채용공고｜11</title>
<style>
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
/*   min-width: 160px; */
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

${corporationInfo.logo_path}
<div class="container">
<div class="row">

<div class="whiteBox"  style=" width:1140px; height: 170px; border-radius: 4px;" >
	<img src="${corporationInfo.bg_path}" alt="이미지를 찾을 수 없습니다." width="1138px" height="170px" style="border-radius: 4px;"></img><br>
		<div style="position: relative; top: -50px; left: 30px; height: 105px; width: 172px;border-radius: 4px; border: 1px solid #AAAAAA;">
			
	        <img src="${corporationInfo.logo_path}"  height="103" width="170" style="border-radius: 4px; alt="이미지를 찾을 수 없습니다."/><br> 
	       
	    </div>	
    </div>
</div>  
</div>
<div class="whiteBox"  style="margin-top:1px ; width:1140px; height: 150px">
	<div style="margin-left: 220px; margin-top: 10px" > 
		<label for="corporationNm" style="font-size: 200%" > ${corporationInfo.corp_name} </label> 
			<div style="float: right; margin-right: 10px; ">
				
				<div class="dropdown" style="margin-right: -120px;">
				  <span>• • •</span>
  					<div style="margin-right: 40px;margin-left: -40px" class="dropdown-content">
    					<c:if test="${SESSION_MEMBERVO.mem_id ne corporationInfo.corp_id }">
    							<a>신고</a><br>
    						<li class="dropdownAccordion otherDropdown" style="width: 155px;">
    							<a href="javascript:corporation_follow('${ SESSION_MEMBERVO.mem_id }', '${ corporationInfo.corp_id }');" style="padding: 0 15px 0 0; width: 140px;"> 
    								+ 팔로우
    							</a>
    						</li>
    					</c:if>
    					<c:if test="${SESSION_MEMBERVO.mem_id eq corporationInfo.corp_id }">
		  					<a>배경 변경</a><br>
		  					<a style="margin-top: 10px;">로고 변경</a>
	  					</c:if>
  					</div>
				</div>
				${SESSION_MEMBERVO.mem_id ne corporationInfo.corp_id }
				${SESSION_MEMBERVO.mem_id}
				${corporationInfo.corp_id }
				${followUnfollow}
    </form>
			</div>
			<br>
		<label for="addr1">${corporationInfo.addr1 }</label> 
	</div>
	<div style="margin-top: 10px; margin-left: 30px;">
		<label> ${corporationInfo.corp_profile } </label>
		<br>  
		<div style="display: flex;">
		<button value="웹사이트 가기 ↗" name="corp_url" onclick="window.open('http://www.naver.com')" style="border: 1px solid #3CA0FF; background-color: #FFFFFF;font-weight: bolder;color:#8282EB;margin-top: 10px;">웹사이트 가기↗</button>
		<button style="border: 1px solid #3CA0FF; background-color: #FFFFFF;font-weight: bolder;color:#8282EB;margin-top: 10px;margin-left: 905px;" onclick="location.href='/companyReview?corp_id=${corporationInfo.corp_id}'">회사 정보</button>
		</div>
	</div>
</div>

<!-- ------------------------------------		이미지 업로드--------------------------------------------	 -->
<!--   		<form action="./logo_change_btn" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data" accept-charset="UTF-8"> -->
<!--         이름 : <input type="text" name="name" id="cmd" value="namevla"><br> -->
<!--         파일 : <input type="file" name="file"><br> <input -->
<!--          type="submit" name="업로드" value="제출"><br> -->


<!------------------------------------------- 비동기식 업로드 ---------------------------------------------------------->
<form name="serverInfoForm" id="serverInfoForm" method="post" action="/serverInfoUpload.do" enctype = "multipart/form-data">

        <input type="file" name="agentInstallFile" id="agentInstallFile" style="background-color: black;" value="asdf">

        <input type="submit"  class="btn" value="전송">
</form>




</body>
<script>

		
function corporation_follow(mem_id, ref_keyword) {
	
	$.ajax({
		url : "/corporation_follow",
		data : {"mem_id" : mem_id, "ref_keyword" : ref_keyword, "division" : "11" },
		success : function(data) {
			
			$('#top_area').html(data);
			console.log(data);
		}
	});
	
}		

function follow_unfollow(mem_id, ref_keyword){
	
	$.ajax({
		url : "/follow_unfollow",
		data : {"mem_id" : mem_id, "ref_keyword" : ref_keyword, "division" : "11"},
		success : fuction(data) {
			
			$('#top_area').html(data);
			console.log(data);
		}
	});
}


</script>



</html>

