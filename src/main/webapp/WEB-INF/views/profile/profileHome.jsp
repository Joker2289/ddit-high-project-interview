<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
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
		    		data : {"user_id" :  "${usersVo.user_id}" },
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/css/profile/profileHome.css" rel="stylesheet">    
<div class="container">
<div class="row">
<div>
	<div class="row profileHomeBox">
		<div class="col-md-9 mainAllBox">
			<div class="whiteBox introduceBox">
				<div class="profileHomeBackgroundPicture" style="background-image: url(/background?mem_id=${usersVo.user_id});"></div>
				<div style="min-height: 328px;">
					<div class="profileHomeProfilePicture" style="background-image: url(/profile?mem_id=${usersVo.user_id});"></div>
					<div style="width: 791px; padding:24px; margin-top: -72px;">
						<span style="font-size: 20px;padding-left: 717px; color: #0073B1;"><i class="fas fa-pencil-alt"></i></span>
						<div class="memberBox" style="display: flex;">
							<div style="width: 500px;">
								<label class="member" >${usersVo.user_name }</label>
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
						
						<c:if test="${(not empty usersVo.profile_contents) or (not empty usersVo.profile_contents)}">
							<div class="userContentsSkip" style="border-top: 1px solid #CDCFD2; margin-top: 20px; padding-top: 10px;">
								<p>${usersVo.profile_contents }</p>
								<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
									<c:forEach items="${userFilesList }" var="files" > 
										<div style="height: 25px; margin-right: 10px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
											<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
										</div>
									</c:forEach>
								</div>
								<c:if test="${fn:length(usersVo.profile_contents) > 187}">
									<button class="btn btn-link userContentsShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
								</c:if>
								
							</div>
						</c:if>
						
					</div>
				</div>
			</div>
			
			<div class="whiteBox" style="padding: 20px 20px 20px 20px;">
				<h3 style="margin: 0 0 20px 0 ">경력 사항</h3>
				<c:forEach items="${career_infoList }" var="career_infoVo">
					<fmt:formatDate value="${career_infoVo.join_date}" pattern="yyyyMMdd" var="joinDate"/>
					<fmt:formatDate value="${career_infoVo.resign_date }" pattern="yyyyMMdd" var="resignDate"/>
					<fmt:parseNumber value="${(resignDate.time - joinDate.time) / (1000*60*60*24)}" integerOnly="true" var="ingDate" />
					<ul class="list-unstyled">
						<li class="list-unstyled">
							<a style="display: flex;">
								<div class="logoPicture" style="background-image: url(/profile?mem_id=10); width: 50px; height: 50px;"></div>
								<div style="margin-left: 30px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${career_infoVo.job_rank }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.9);">${career_infoVo.corporate_name }</label></br>
									<label>${endDate} ${strDate } ${ingDate }</label></br>
									<label>${career_infoVo.corp_local }</label></br>
									<label>${career_infoVo.job_position }</label></br>
								</div>
							</a>
						</li>
					</ul>
						
  					
   				</c:forEach>
			</div>
			<div class="whiteBox">
				학력사항
			</div>
		</div>
		<div class="col-md-3" style="padding-left: 5px;">
			<div class="whiteBox" style="width: 314px; min-height: 481px;">
			asdfasdfasdfasdffffffd.sfasdfasfdasfasd
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 744px;">
    <div class="modal-content" style="width: 744px; min-width: 100px; min-height: 100px;">
		
	</div>
    </div>
	</div>
</div>
</div>
</div>		