<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.sql.Time"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".skils").hide();
	$(".thesis").hide();
	$(".patent").hide();
	$(".project").hide();
	$(".award").hide();
	$(".language").hide();
	
	$(".modalA").on("click",function(){
		var modalStr = $(this).attr("title");
		var code = $(this).attr("role");
		
		console.log(code);
		$.ajax({
			type : "POST",
	    		url : "/modalUpdateView",
	    		dataType : "HTML",
	    		data : {"modalStr" :  modalStr, "code" : code },
			success : function(result) {
				
				$(".modal-content").html(result);
			}
		}); 
	});
	
	$(".telInfoA").on("click",function(){
		var user_id = $(this).attr("title");
		
		$.ajax({
			type : "POST",
	    		url : "/telInfo",
	    		dataType : "HTML",
	    		data : {"user_id" : user_id },
			success : function(result) {
				
				$(".modal-content").html(result);
			}
		}); 
	});
	
	$(".contentsBtn").on("click",function(e){
		if($(e.target).parents(".contentsDiv").children(".contents").hasClass("contents")){
			$(e.target).parents(".contentsDiv").children(".contentsBtn").empty();
			$(e.target).parents(".contentsDiv").children(".contentsBtn").append('더 보기 취소 ');
			$(e.target).parents(".contentsDiv").children(".contents").attr('class', 'contentsOn');
		}else{
			$(e.target).parents(".contentsDiv").children(".contentsBtn").empty();
			$(e.target).parents(".contentsDiv").children(".contentsBtn").append('더 보기');
			$(e.target).parents(".contentsDiv").children(".contentsOn").attr('class', 'contents');
		}		
	});
	
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
	
	$(".possesion_skillsVoShow").on("click",function(e){
		if ($(e.target).closest(".possesion_skillsVoShowSkip").hasClass('possesion_skillsVoShowSkip')) {
			$(".possesion_skillsVoShow").empty();
			$(".possesion_skillsVoShow").append('더 보기 취소 <i class="fas fa-angle-up"></i>');
			$(".possesion_skillsVoShowSkip").attr('class', 'possesion_skillsVoShowSkipOn');
			$(".skils").show();
			
		}else {
			$(".possesion_skillsVoShow").empty();
			$(".possesion_skillsVoShow").append('더 보기 <i class="fas fa-angle-down"></i>');
			$(".possesion_skillsVoShowSkipOn").attr('class', 'possesion_skillsVoShowSkip');
			$(".skils").hide();
		}
	});
	
	$(".thesis_listVoShow").on("click",function(e){
		if ($(e.target).closest(".thesis_listVoShowSkip").hasClass('thesis_listVoShowSkip')) {
			$(".thesis_listVoShow").empty();
			$(".thesis_listVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".thesis_listVoShowSkip").attr('class', 'thesis_listVoShowSkipOn');
			$(".thesis").show();
			
		}else {
			$(".thesis_listVoShow").empty();
			$(".thesis_listVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".thesis_listVoShowSkipOn").attr('class', 'thesis_listVoShowSkip');
			$(".thesis").hide();
		}
	});
	
	$(".patent_listVoShow").on("click",function(e){
		if ($(e.target).closest(".patent_listVoShowSkip").hasClass('patent_listVoShowSkip')) {
			$(".patent_listVoShow").empty();
			$(".patent_listVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".patent_listVoShowSkip").attr('class', 'patent_listVoShowSkipOn');
			$(".patent").show();
			
		}else {
			$(".patent_listVoShow").empty();
			$(".patent_listVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".patent_listVoShowSkipOn").attr('class', 'patent_listVoShowSkip');
			$(".patent").hide();
		}
	});
	
	$(".project_careerVoShow").on("click",function(e){
		if ($(e.target).closest(".project_careerVoShowSkip").hasClass('project_careerVoShowSkip')) {
			$(".project_careerVoShow").empty();
			$(".project_careerVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".project_careerVoShowSkip").attr('class', 'project_careerVoShowSkipOn');
			$(".project").show();
			
		}else {
			$(".project_careerVoShow").empty();
			$(".project_careerVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".project_careerVoShowSkipOn").attr('class', 'project_careerVoShowSkip');
			$(".project").hide();
		}
	});
	
	$(".award_historyVoShow").on("click",function(e){
		if ($(e.target).closest(".award_historyVoShowSkip").hasClass('award_historyVoShowSkip')) {
			$(".award_historyVoShow").empty();
			$(".award_historyVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".award_historyVoShowSkip").attr('class', 'award_historyVoShowSkipOn');
			$(".award").show();
			
		}else {
			$(".award_historyVoShow").empty();
			$(".award_historyVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".award_historyVoShowSkipOn").attr('class', 'award_historyVoShowSkip');
			$(".award").hide();
		}
	});
	
	$(".languageVoShow").on("click",function(e){
		if ($(e.target).closest(".languageVoShowSkip").hasClass('languageVoShowSkip')) {
			$(".languageVoShow").empty();
			$(".languageVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".languageVoShowSkip").attr('class', 'languageVoShowSkipOn');
			$(".language").show();
			
		}else {
			$(".languageVoShow").empty();
			$(".languageVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".languageShowSkipOn").attr('class', 'languageVoShowSkip');
			$(".language").hide();
		}
	});
	
	
	$(document).on("click", function(e){
		if($(e.target).closest(".profileBtn").hasClass("profileBtn")){
			
			$(".profileBtn").attr('class','btn btn-primary profileBtnOn');
			
			$.ajax({
	    		type : "POST",
		    		url : "/profileDropdown",
		    		dataType : "HTML",
		    		data : {"user_id" :  "${usersMap.usersVo.user_id}" },
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
<div data-spy="scroll" data-target=".navbar-spy">
	<div class="row profileHomeBox">
		<div class="col-md-9 mainAllBox">
			<div class="whiteBox introduceBox" style="margin-bottom: 20px;">
				<c:set var="bg_addrpath" value="/background?mem_id=${usersMap.usersVo.user_id }"/>
				<c:set var="profile_addrpath" value="/profile?mem_id=${usersMap.usersVo.user_id }"/> 
				<c:choose>
					<c:when test="${fn:contains(usersMap.usersVo.bg_path, 'http')}">
						<c:set var="bg_path" value="${usersMap.usersVo.bg_path }"/> 
					</c:when>
					<c:when test="${fn:contains(usersMap.usersVo.profile_path, 'http')}">
						<c:set var="profile_path" value="${usersMap.usersVo.profile_path }"/> 
					</c:when>
				</c:choose>
				<div class="profileHomeBackgroundPicture" style="background-image: url(${not empty bg_path ? bg_path : bg_addrpath});"></div>
				<div style="min-height: 328px;">
					<div class="profileHomeProfilePicture" style="background-image: url(${not empty profile_path ? profile_path : profile_addrpath});"></div>
					<div style="width: 791px; padding:24px; margin-top: -72px;">
						<a class="modalA" role="${usersMap.usersVo.user_id}" data-toggle="modal" data-target="#myModal" title="introduction" ><span style="font-size: 20px;padding-left: 717px; color: #0073B1;"><i class="fas fa-pencil-alt"></i></span></a>
						<div class="memberBox" style="display: flex;">
							<div style="width: 500px;">
								<label class="member" >${usersMap.usersVo.user_name }</label>
								<label class="member simpleInfo" style="font-size: 20px; font-weight: 100;">${usersMap.usersVo.introduce }</label>
								<c:if test="${not empty usersMap.usersVo.persnal_url}">
									<a href="http://${usersMap.usersVo.persnal_url}" style="font-size: 20px; font-weight: 100;">${usersMap.usersVo.persnal_url}</a>
								</c:if>
							</div>
							
							<div style="height: 100px;">
								<c:if test="${not empty career_infoMap.career_infoVoList}">
									<div>
										<a href="#careerFirst"><span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-building"></i></span>
										<label class="memberRight">${career_infoMap.career_infoVoList[0].corporate_name }</label></a>
									</div>
								</c:if>
								
								<c:if test="${not empty education_infoMap.education_infoVoList}">
								<div>
									<a href="#educationFirst"><span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-graduation-cap"></i></span>
									<label class="memberRight">${education_infoMap.education_infoVoList[0].school_name }</label></a>
								</div>
								</c:if>
								
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"> <i style="width:30px;" class="fas fa-address-card"></i></span>
									<a class="telInfoA" data-toggle="modal" data-target="#myModal" title="${usersMap.usersVo.user_id }" ><label class="memberRight">연락처 보기</label></a>
								</div>
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-users"></i></span>
									<label class="memberRight"><a href="/connections">1촌 ${peopleCount }명 보기</a></label>
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
						
						<c:if test="${(not empty usersMap.usersVo.profile_contents) or (not empty usersMap.filesVoList)}">
							<div class="userContentsSkip" style="border-top: 1px solid #CDCFD2; margin-top: 20px; padding-top: 10px;">
								<c:if test="${not empty usersMap.usersVo.profile_contents}">
									<p>${usersMap.usersVo.profile_contents }</p>
								</c:if>
								
								<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
									<c:forEach items="${usersMap.filesVoList }" var="files" > 
										<div style="height: 25px; margin-right: 10px;border: 2px solid #CDCFD2; font-weight: bold">
											<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
										</div>
									</c:forEach>
								</div>
								<c:if test="${fn:length(usersMap.usersVo.profile_contents) > 187}">
									<button class="btn btn-link userContentsShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
								</c:if>
								
							</div>
						</c:if>
						
					</div>
				</div>
			</div>
			
			<!-- 경력  -->
			<c:if test="${not empty career_infoMap.career_infoVoList }">
			<div class="whiteBox navbar-spy" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;" >
				<h3 style="margin: 0 0 0 0 ">경력 사항</h3>
				<ul class="list-unstyled">
					<c:forEach items="${career_infoMap.career_infoVoList }" var="career_infoVo" varStatus="i">
						<fmt:formatDate value="${career_infoVo.join_date }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${career_infoVo.resign_date }" var="endDate" pattern="yyyy년 MM월"/>
						<fmt:parseNumber var="year" integerOnly="true" value="${career_infoVo.month / 12}"/>
						<fmt:parseNumber var="month" integerOnly="true" value="${career_infoVo.month % 12}"/>
						<li class="list-unstyled" style="margin-top: 20px; display: flex;position: relative;" <c:if test="${i.first}">id="careerFirst"</c:if>>
							<div style="width: 720px;">
								<a style="display: flex; width: 720px;">
									<c:set var="profile_addrPath" value="/profile?mem_id=${career_infoVo.corp_id }"/>
										<c:if test="${fn:contains(career_infoVo.logo_path, 'http')}">
											<c:set var="logo_path" value="${career_infoVo.logo_path }"/> 
										</c:if>
									<div class="logoPicture" style="background-image: url(${not empty logo_path ? logo_path : profile_addrPath}); width: 120px; height: 50px;"></div>
									<div style="margin-left: 30px; width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${career_infoVo.job_rank }</h4>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);">${career_infoVo.corporate_name }</label><br>
										<label>${strDate } - ${endDate  == null ? '현재' : endDate} · (${year > 1 ? year : ''}${year > 1 ? '년 ' : '' }${month > 1 ? month : '1'}개월)</label><br>
										<label>${career_infoVo.corp_local }</label><br>
										<label>${career_infoVo.job_position }</label><br>
									</div>
								</a>
								
								<!-- 경력 상세 내용 -->
								<c:if test="${not empty career_infoVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 150px; width: 720px;">
										<span class="contents" style="width: 536px; margin: 0 0 0 0;">${career_infoVo.contents }</span>
										<c:if test="${fn:length(career_infoVo.contents) > 45}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
								
								<!-- 경력 첨부파일 -->
								<c:if test="${not empty career_infoMap.career_infoFileVoList }">
									<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
										<c:forEach var="career_infoFilesVo" items="${career_infoMap.career_infoFileVoList[i.index] }">
										
											<div style="height: 25px; margin: 10px 30px 0 150px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
												<a href="/fileDownload?file_code=${career_infoFilesVo.file_code }">${career_infoFilesVo.file_name}</a>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div>
								<a class="modalA" role="${career_infoVo.career_code}" data-toggle="modal" data-target="#myModal" title="career"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			
		    <!-- 학력  -->
			<c:if test="${not empty education_infoMap.education_infoVoList }">
			<div class="whiteBox navbar-spy" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 0 0 ">학력</h3>
				<ul class="list-unstyled">
					<c:forEach items="${education_infoMap.education_infoVoList }" var="education_infoVo" varStatus="i">
						<fmt:formatDate value="${education_infoVo.admission }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${education_infoVo.graduation }" var="endDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled" style="margin-top: 20px; display: flex;position: relative;" <c:if test="${i.first}">id="educationFirst"</c:if>>
							<div style="width: 720px;">
								<a style="display: flex; width: 720px;">
									<div class="logoPicture" style="background-image: url(/images/corporation/basic/basicShool.png); width: 120px; height: 50px;"></div>
									<div style="margin-left: 30px; width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${education_infoVo.school_name }</h4>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);">${education_infoVo.degree_name }, ${education_infoVo.major }, ${education_infoVo.grade }</label><br>
										<label>${strDate } - ${endDate}</label><br>
									</div>
								</a>
								
								<!-- 학력 내용 -->
								<c:if test="${not empty education_infoVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 150px; width: 720px;">
										<span class="contents" style="width: 536px; margin: 0 0 0 0;">${education_infoVo.contents }</span>
										<c:if test="${fn:length(education_infoVo.contents) > 45}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
								
								<!-- 학력 첨부파일 -->
								<c:if test="${not empty education_infoMap.education_infoFileVoList }">
									<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
										<c:forEach var="education_infoFileVo" items="${education_infoMap.education_infoFileVoList[i.index] }">
										
											<div style="height: 25px; margin: 10px 30px 0 150px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
												<a href="/fileDownload?file_code=${education_infoFileVo.file_code }">${education_infoFileVo.file_name}</a>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div>
								<a class="modalA" role="${education_infoVo.education_code}" data-toggle="modal" data-target="#myModal" title="education"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			
		
			<!-- 보유 기술  -->
			<c:if test="${not empty possesion_skillsVoList }">
			<div class="whiteBox" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 0 0 ">보유기술</h3>
				<ul class="list-unstyled">
					<li class="list-unstyled" style="margin-top: 20px;">
						<c:forEach items="${possesion_skillsVoList}" var="possesion_skillsVo" varStatus="i">
							<fmt:formatDate value="${possesion_skillsVo.issue_date }" var="strDate" pattern="yyyy년 MM월"/>
							<li class="list-unstyled <c:if test='${!i.first}'>skils</c:if>" style="margin-top: 20px; display: flex;">
								<div style="width: 720px;">
									<div style="width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${possesion_skillsVo.pskill_name }</h4>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);">${possesion_skillsVo.issue_org }</label><br>
										<label>${strDate }</label><br>
									</div>
									<!-- 보유기술 내용 -->
									<c:if test="${not empty possesion_skillsVo.contents }">
										<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
											<span class="contents" style="width: 700px; margin: 0 0 0 0;">${possesion_skillsVo.contents }</span>
											<c:if test="${fn:length(possesion_skillsVo.contents) > 57}">
										 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
											</c:if>
										</div>
									</c:if>
								</div>
								<div>
									<a class="modalA" role="${possesion_skillsVo.pskill_code}" data-toggle="modal" data-target="#myModal" title="skills"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</li>
						</c:forEach>
					</li>
					<c:if test="${fn:length(possesion_skillsVoList) > 1}">
					<li class="possesion_skillsVoShowSkip" >
						<button class="btn btn-link possesion_skillsVoShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
					</li>
					</c:if>
				</ul>
			</div>
			</c:if>
			
			<!-- 이력   -->
			<c:if test="${not empty recordMap.thesis_listVoList or not empty recordMap.patent_listVoList 
							or not empty recordMap.project_careerList or not empty recordMap.award_historyList 
							or not empty recordMap.languageVoList}">
			<div class="whiteBox" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 10px 0;">이력</h3>
				<ul class="list-unstyled" style="padding-left: 10px;">
					<!-- 논문저서 -->
					<li>
						<c:if test="${not empty recordMap.thesis_listVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.thesis_listVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">논문·저서</label><br>
									<label id="" style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.thesis_listVoList}" var="thesis_listVo" varStatus="i">
											${thesis_listVo.thesis_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="thesis_listVoShowSkip">
									<span class="thesis_listVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.thesis_listVoList}" var="thesis_listVo" varStatus="i">
						<fmt:formatDate value="${thesis_listVo.publication_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled thesis" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex; <c:if test='${!i.first}'>border-top: 2px solid #CDCFD2;</c:if>">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${thesis_listVo.thesis_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.9);">${thesis_listVo.publisher }</label><br>
									<label>${strDate }</label><br>
									<c:if test='${not empty thesis_listVo.thesis_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);"><a href="http://${thesis_listVo.thesis_url }">${thesis_listVo.thesis_url }</a></label><br>
									</c:if>
									<label>${thesis_listVo.writer }</label><br>
								</div>
								<!-- 논문저서 내용 -->
								<c:if test="${not empty thesis_listVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<span class="contents" style="width: 700px; margin: 0 0 0 0;">${thesis_listVo.contents }</span>
										<c:if test="${fn:length(thesis_listVo.contents) > 57}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
							</div>
							<div>
								<a class="modalA" role="${thesis_listVo.thesis_code}" data-toggle="modal" data-target="#myModal" title="Thesis"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
					
					<!-- 특허 -->
					<li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.patent_listVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.patent_listVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">특허</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.patent_listVoList}" var="patent_listVo" varStatus="i">
											${patent_listVo.patent_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="patent_listVoShowSkip">
									<span class="patent_listVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.patent_listVoList}" var="patent_listVo" varStatus="i">
						<fmt:formatDate value="${patent_listVo.patent_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled patent" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex; <c:if test='${!i.first}'>border-top: 2px solid #CDCFD2;</c:if>">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${patent_listVo.patent_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.9);">특허 출원 번호 : ${patent_listVo.patent_no }</label><br>
									<label>${patent_listVo.nation }</label><br>
									<label>${strDate }</label><br>
									<c:if test='${not empty patent_listVo.patent_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);"><a href="http://${patent_listVo.patent_url }">${patent_listVo.patent_url }</a></label><br>
									</c:if>
									<label> ${patent_listVo.inventer }</label><br>
								</div>
								<!-- 특허 내용 -->
								<c:if test="${not empty patent_listVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<span class="contents" style="width: 700px; margin: 0 0 0 0;">${patent_listVo.contents }</span>
										<c:if test="${fn:length(patent_listVo.contents) > 57}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
								</div>
							<div>
								<a class="modalA" role="${patent_listVo.patent_code}" data-toggle="modal" data-target="#myModal" title="patent"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
					
					 <!-- 프로젝트 -->
					 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.project_careerList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.project_careerList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">프로젝트</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.project_careerList}" var="project_careerVo" varStatus="i">
											${project_careerVo.project_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="project_careerVoShowSkip">
									<span class="project_careerVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.project_careerList}" var="project_careerVo" varStatus="i">
						<fmt:formatDate value="${project_careerVo.start_date }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${project_careerVo.end_date }" var="endDate" pattern="yyyy년 MM월"/>
						<fmt:parseNumber var="year" integerOnly="true" value="${project_careerVo.month / 12}"/>
						<fmt:parseNumber var="month" integerOnly="true" value="${project_careerVo.month % 12}"/>
						<li class="list-unstyled project" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex; <c:if test='${!i.first}'>border-top: 2px solid #CDCFD2;</c:if>">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${project_careerVo.project_name }</h4>
									<c:if test='${not empty project_careerVo.project_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.9);"><a href="http://${project_careerVo.project_url }">${project_careerVo.project_url }</a></label><br>
									</c:if>
									<label>${project_careerVo.project_leader }</label><br>
									<label>${strDate } - ${endDate  == null ? '현재' : endDate} · (${year > 1 ? year : ''}${year > 1 ? '년 ' : '' }${month > 1 ? month : '1'}개월)</label><br>
								</div>
								<!-- 프로젝트 내용 -->
								<c:if test="${not empty project_careerVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<span class="contents" style="width: 700px; margin: 0 0 0 0;">${project_careerVo.contents }</span>
										<c:if test="${fn:length(project_careerVo.contents) > 57}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
							</div>
							<div>
								<a class="modalA" role="${project_careerVo.project_code}" data-toggle="modal" data-target="#myModal" title="project"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
					
				 <!-- 수상 경력 -->
				 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.award_historyList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.award_historyList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">수상 경력</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.award_historyList}" var="award_historyVo" varStatus="i">
											${award_historyVo.award_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="award_historyVoShowSkip">
									<span class="award_historyVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.award_historyList}" var="award_historyVo" varStatus="i">
						<fmt:formatDate value="${award_historyVo.award_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled award" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex; <c:if test='${!i.first}'>border-top: 2px solid #CDCFD2;</c:if>">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${award_historyVo.award_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.9);">${award_historyVo.award_org }</label><br>
									<label>${strDate }</label><br>
								</div>
								<!-- 수상 경력 내용 -->
								<c:if test="${not empty award_historyVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<span class="contents" style="width: 700px; margin: 0 0 0 0;">${award_historyVo.contents }</span>
										<c:if test="${fn:length(award_historyVo.contents) > 57}">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
										</c:if>
									</div>
								</c:if>
							</div>
							<div>
								<a class="modalA" role="${award_historyVo.award_code}" data-toggle="modal" data-target="#myModal" title="award"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
					
					<!-- 외국어 -->
					 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.languageVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.languageVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">수상 경력</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.languageVoList}" var="languageVo" varStatus="i">
											${languageVo.lang_kind } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="languageVoShowSkip">
									<span class="languageVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.languageVoList}" var="languageVo" varStatus="i">
						<li class="list-unstyled language" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex; <c:if test='${!i.first}'>border-top: 2px solid #CDCFD2;</c:if>">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${languageVo.lang_kind }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.9);">${languageVo.grade }</label><br>
								</div>
							</div>
							<div>
								<a class="modalA" role="${languageVo.lang_code}" data-toggle="modal" data-target="#myModal" title="language"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div> 
			</c:if>
			
			
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