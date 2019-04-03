<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".userContentsShow").on("click",function(e){
		if ($(e.target).closest(".userContentsSkip").hasClass('userContentsSkip')) {
			$(".userContentsShow").empty();
			$(".userContentsShow").append('더 보기 취소 <i class="fas fa-angle-up"></i>');
			$(".userContentsSkip").attr('class', 'userContentsSkipOn');
			
		}else {
			$(".userContentsShow").empty();
			$(".userContentsShow").append('더 보기 <i class="fas fa-angle-down"></i>');
			$(".userContentsSkipOn").attr('class', 'userContentsSkip');
		}
	});
	
	$(document).on("click", function(e){
		if($(e.target).closest(".profileBtn").hasClass("profileBtn")){
			
			$(".profileBtn").attr('class','btn btn-primary profileBtnOn');
			$.ajax({
	    		type : "POST",
		    		url : "/profileDropdown",
		    		dataType : "HTML",
		    		data : { },
	    		success : function(result) {
	    			$(".profileDropdownBox").append(result);
	    		}
	    	}); 
		}else if (!$(e.target).closest(".profileBtn").hasClass("profileBtn")){
	       	
	       	if($(e.target).closest(".profileBtnOn").hasClass("profileBtnOn")) {
	        	$(".profileDropdownBox").empty();
	        	$(".profileBtnOn").attr('class','btn btn-primary profileBtn');
	       		
	       	}else if (!$(e.target).closest(".dropdown-menu").hasClass("dropdown-menu")){
	       		$(".profileDropdownBox").empty();
	       		$(".profileBtnOn").attr('class','btn btn-primary profileBtn');
	       	}
		}
		
		if($(e.target).closest(".otherBtn").hasClass("otherBtn")){
			
			$(".otherBtn").attr('class','btn btn-default otherBtnOn');
			$.ajax({
	    		type : "POST",
		    		url : "/otherDropdown",
		    		dataType : "HTML",
		    		data : { },
	    		success : function(result) {
	    			$(".otherDropdownBox").append(result);
	    		}
	    	}); 
		}else if (!$(e.target).closest(".otherBtn").hasClass("otherBtn")){
	       	
	       	$(".otherBtnOn").attr('class','btn btn-default otherBtn');
       		$(".otherDropdownBox").empty();
		}
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
				<div class="profileHomeBackgroundPicture" style="background-image: url(/background?mem_id=${userVo.user_id});"></div>
				<div style="min-height: 328px;">
					<div class="profileHomeProfilePicture" style="background-image: url(/profile?mem_id=${userVo.user_id});"></div>
					<div style="width: 791px; padding:24px; margin-top: -72px;">
						<span style="font-size: 20px;padding-left: 717px; color: #0073B1;"><i class="fas fa-pencil-alt"></i></span>
						<div class="memberBox" style="display: flex;">
							<div style="width: 500px;">
								<label class="member" >${userVo.user_name }</label>
								<label class="member simpleInfo" style="font-size: 20px; font-weight: 100;">${introduce }</label>
							</div>
							
							<div style="height: 100px;">
								<c:if test="${not empty career_infoList}">
									<div>
										<span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-building"></i></span>
										<label class="memberRight">${career_infoList[0].corporate_name }</label>
									</div>
								</c:if>
								
								<c:if test="${not empty education_infoList}">
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-graduation-cap"></i></span>
									<label class="memberRight">${education_infoList[0].school_name }</label>
								</div>
								</c:if>
								
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"> <i style="width:30px;" class="fas fa-address-card"></i></span>
									<label class="memberRight">연락처 보기</label>
								</div>
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-users"></i></span>
									<label class="memberRight">1촌 ${peopleCount }명 보기</label>
								</div>
							</div>
						</div>
						<div>
							<div class="btn-group" role="group" aria-label="...">
							  <button style="width: 194px; height: 40px;font-size: 18px;" type="button" class="btn btn-primary profileBtn">
							    프로필 항목 등록 <span class="caret"></span></button>
						  	  <button class="btn btn-default otherBtn" style="height: 40px; margin-left: 10px;">...</button>
							</div>
						</div>
						<div class="profileDropdownBox">
							
						</div>
						<div class="otherDropdownBox">
							
						</div>
						
						<c:if test="${(not empty userVo.profile_contents) or (not empty userVo.profile_contents)}">
							<div class="userContentsSkip" style="border-top: 1px solid #CDCFD2; margin-top: 20px; padding-top: 10px;">
								<p>${userVo.profile_contents }</p>
								<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
									<c:forEach items="${filesList }" var="files" > 
										<div style="height: 25px; margin-right: 10px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
											<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
										</div>
									</c:forEach>
								</div>
								<c:if test="${fn:length(userVo.profile_contents) > 172}">
									<button class="btn btn-link userContentsShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
								</c:if>
								
							</div>
						</c:if>
						
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    <div class="modal-content">
		
	</div>
    </div>
	</div>
</div>
</div>
</div>		