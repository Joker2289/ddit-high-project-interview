<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script type="text/javascript" src="/js/printThis.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if('${usersMap.usersVo.user_id}' == '${SESSION_MEMBERVO.mem_id}'){
		$("#HomeGO").attr('href','/profileHome');
	}else{
		$("#HomeGO").attr('href','/profileHome?user_id='+'${usersMap.usersVo.user_id}');
	}
	
	    html2canvas(document.body, {
		  onrendered: function(canvas) {
		 
		    // 캔버스를 이미지로 변환
		    var imgData = canvas.toDataURL('image/png');
		     
		   /*  var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		    var imgHeight = canvas.height * imgWidth / canvas.width;
		    var heightLeft = imgHeight; */
		     
		        var doc = new jsPDF('p', 'mm');
		         
		        // 첫 페이지 출력
		        doc.addImage(imgData, 'PNG', 0, 0, 400, 305);
		         
		      /*   // 한 페이지 이상일 경우 루프 돌면서 출력
		        while (heightLeft >= 20) {
		          position = heightLeft - imgHeight;
		          doc.addPage();
		          doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		          heightLeft -= pageHeight;
		        } */
		 
		        // 파일 저장
		        doc.save('profile_'+'${usersMap.usersVo.user_name}'+'.pdf');
		  }
	});  
	    
   setTimeout(function() { 
	   $("#HomeGO").get(0).click(); 
   }, 3000);
	
});
</script> 
</head>
<body>
<div id="test" style="display: flex;">
<div style="background-color: #293e49; width: 250px; min-height: 100% * 1.414; color: white; padding: 50px 20px 50px 20px;">
	<label style="font-size: 20px; font-weight: 500; ">연락처</label><br>
	<br>
	<label style="font-size: 15px; font-weight: 500;">${usersMap.usersVo.email }</label><br>
	<label style="font-size: 15px; font-weight: 500;">${usersMap.usersVo.telno }</label><br>
	<br>
	
	<c:if test="${not empty abilityVoList }">
		<label style="font-size: 20px; font-weight: 500; ">보유기술</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${abilityVoList}" var="abilityVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${abilityVo.ability_item }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.possesion_skillsVoList }">
		<label style="font-size: 20px; font-weight: 500; ">자격증</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.possesion_skillsVoList}" var="possesion_skillsVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${possesion_skillsVo.pskill_name }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.thesis_listVoList }">
		<label style="font-size: 20px; font-weight: 500; ">논문·저서</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.thesis_listVoList}" var="thesis_listVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${thesis_listVo.thesis_name }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.patent_listVoList }">
		<label style="font-size: 20px; font-weight: 500; ">특허</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.patent_listVoList}" var="patent_listVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${patent_listVo.patent_name }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.project_careerList }">
		<label style="font-size: 20px; font-weight: 500; ">프로젝트</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.project_careerList}" var="project_careerVo" varStatus="i">
			<fmt:formatDate value="${project_careerVo.start_date }" var="strDate" pattern="yyyy년 MM월"/>
			<fmt:formatDate value="${project_careerVo.end_date }" var="endDate" pattern="yyyy년 MM월"/>
			<label style="font-size: 15px; font-weight: 500;">${project_careerVo.project_name } (${strDate} - ${end_date == null ? '현재' : endDate})</label><br>
			<c:if test='${not empty project_careerVo.project_url}'>
				<label style="font-size: 15px; font-weight: 500;">${project_careerVo.project_url}</label><br>
			</c:if>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.award_historyList }">
		<label style="font-size: 20px; font-weight: 500; ">수상 경력</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.award_historyList}" var="award_historyVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${award_historyVo.award_name }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
	
	<c:if test="${not empty recordMap.languageVoList }">
		<label style="font-size: 20px; font-weight: 500; ">수상 경력</label><br>
		<div style="margin-bottom: 5px;"></div>
		<c:forEach items="${recordMap.languageVoList}" var="languageVo" varStatus="i">
			<label style="font-size: 15px; font-weight: 500;">${languageVo.lang_kind }</label><br>
			<c:if test='${!i.last}'>
				<div style="margin-bottom: 5px;"></div>
			</c:if>
		</c:forEach>
		<br>
	</c:if>
</div>
<div style="padding: 50px 20px 50px 20px; width: 600px;"> 
	<label style="font-size: 35px; font-weight: 600; padding-bottom: 10px;">${usersMap.usersVo.user_name }</label><br>
	<label style="font-size: 15px; font-weight: 600;">${usersMap.usersVo.introduce }</label><br>
	<br>
	<c:if test="${not empty usersMap.usersVo.profile_contents }">
		<label style="font-size: 22px; font-weight: 600;">소개글</label><br>
		<br>
		<pre style="font-size: 15px; font-weight: 600; overflow: auo; white-space: pre-line; margin: 5px 0 0 0;">${usersMap.usersVo.profile_contents }</pre>
		<div  style="border-bottom: 2px solid #a3a3a3; width: 50px; margin-top: 30px;margin-bottom: 10px;"></div>
	</c:if>
	
	<c:if test="${not empty career_infoMap.career_infoVoList }">
		<label style="font-size: 22px; font-weight: 600; ">경력</label><br>
		<c:forEach items="${career_infoMap.career_infoVoList }" var="career_infoVo" varStatus="i">
			<fmt:formatDate value="${career_infoVo.join_date }" var="strDate" pattern="yyyy년 MM월"/>
			<fmt:formatDate value="${career_infoVo.resign_date }" var="endDate" pattern="yyyy년 MM월"/>
			<div style="margin-top: 20px;"></div>
			<label style="font-size: 15px; font-weight: 600;">${career_infoVo.corporate_name }</label><br>
			<label style="font-size: 15px; font-weight: 600;">${career_infoVo.job_position }</label><br>
			<label style="font-size: 15px; font-weight: 600;">${career_infoVo.job_rank }</label><br>
			<label style="font-size: 15px; font-weight: 600;">${strDate } - ${endDate  == null ? '현재' : endDate}</label><br>
			<label style="font-size: 15px; font-weight: 600;">${career_infoVo.corp_local }</label><br>
			<c:if test="${not empty career_infoVo.contents }">
				<pre style="font-size: 15px; font-weight: 600; overflow: auo; white-space: pre-line; margin: 5px 0 0 0;">${career_infoVo.contents }</pre>
			</c:if>
		</c:forEach>
	</c:if>
	
	<div  style="border-bottom: 2px solid #a3a3a3; width: 50px; margin-top: 40px;margin-bottom: 10px;"></div>
	<c:if test="${not empty education_infoMap.education_infoVoList }">
		<label style="font-size: 22px; font-weight: 600; ">학력</label><br>
		<c:forEach items="${education_infoMap.education_infoVoList }" var="education_infoVo" varStatus="i">
			<fmt:formatDate value="${education_infoVo.admission }" var="strDate" pattern="yyyy년 "/>
			<fmt:formatDate value="${education_infoVo.graduation }" var="endDate" pattern="yyyy년"/>
			<div style="margin-top: 20px;"></div>
			<label style="font-size: 15px; font-weight: 600;">${education_infoVo.school_name }</label><br>
			<label style="font-size: 15px; font-weight: 600;">${education_infoVo.degree_name }, ${education_infoVo.major } (${strDate } - ${endDate})</label><br>
			<c:if test="${not empty education_infoVo.contents }">
				<pre style="font-size: 15px; font-weight: 600; overflow: auto; white-space: pre-line; margin: 5px 0 0 0;">${education_infoVo.contents }</pre>
			</c:if>
		</c:forEach>
	</c:if>
</div>

<a id="HomeGO" hidden="hidden" href="/profileHome"></a>
</div>
</body>
</html>


