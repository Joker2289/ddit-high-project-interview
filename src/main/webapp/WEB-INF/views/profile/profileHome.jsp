<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(e) {
	
	$(".profileDropdown").on("click",function(){
		$.ajax({
    		type : "POST",
	    		url : "/profileDropdown",
	    		dataType : "HTML",
	    		data : { },
    		success : function(result) {
    			$(".profileDropdownBox").append(result);
    		}
    	}); 
	});
	
});


</script>
<link href="/css/profile/profileHome.css" rel="stylesheet">    
<div class="container">
<div class="row">
<div style="margin-top: 101px;">
	<div class="row profileHomeBox">
		<div class="col-md-9 mainAllBox">
			<div class="whiteBox introduceBox">
				<div class="profileHomeBackgroundPicture" style="background-image: url(/background?mem_id=${memberVO.mem_id});"></div>
				<div style="min-height: 328px;">
					<div class="profileHomeProfilePicture" style="background-image: url(/profile?mem_id=${memberVO.mem_id});"></div>
					<div style="width: 791px; padding:24px; margin-top: -72px;">
						<span style="font-size: 20px;padding-left: 717px; color: #0073B1;"><i class="fas fa-pencil-alt"></i></span>
						<div class="memberBox">
							<label class="member" >MINKYU JIN</label>
							<span><i class="fas fa-graduation-cap"></i></span>
							<label class="memberRight">공주대학교</label>
							
							<label class="member simpleInfo" style="font-size: 20px; font-weight: 100;">공주대학교 학생</label>
							<span><i class="fas fa-address-card"></i></span>
							<label class="memberRight">연락처 보기</label>
							
							<label class="member" ></label>
							<span><i class="fas fa-users"></i></span>
							<label class="memberRight">1촌 보기</label>
						</div>
						<div class="btn-group profileBtn">
						  <button style="width: 194px; height: 40px;font-size: 18px;" type="button" class="btn btn-primary profileDropdown">
						    프로필 항목 등록 <span class="caret"></span>
						  </button>
						</div>
						<button class="btn btn-default" style="height: 40px;">...</button>
						<div class="profileDropdownBox">
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3" style="padding-left: 5px;">
			<div class="whiteBox" style="width: 314px; min-height: 481px;">
			asdfasdfasdfasdffffffdsfasdfasfdasfasd
			</div>
		</div>
	</div>
	
	
</div>
</div>
</div>		