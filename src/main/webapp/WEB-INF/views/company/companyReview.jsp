<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
<div class="row">
<div>
<div class="row">
	<div class="col-md-10" style="padding-left: 0px;margin-left: 30px;top: -49px;">
		<div class="whiteBox" style="background-color: #eaf2ff;display: flex;width: 920px;margin-top: 29px;border-color: white;border-radius: 0px;height: 172px;box-shadow: 0 0px 0px rgba(0, 0, 0, .175);">
			<c:choose>
				<c:when test="${fn:contains(corporationInfo.logo_path, 'http')}">
					<c:set var="logo_path" value="${corporationInfo.logo_path }" />
				</c:when>
			</c:choose>
			<div
				style="width: 120px;height:80px;background-image:url(${not empty logo_path ? logo_path : profile_addrpath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin: 45px 0 12px 40px;"
			>
			</div>
			<div>
				<label style="font-size: 26px;margin-top: 51px;margin-left: 10px;"><strong>${corporationInfo.corp_name }</strong></label>
				<div style="margin-left: 10px;margin-top: 6px;">
					<button onclick="location.href='/'" class="btn btn-primary"><strong>기업리뷰</strong></button>
					<button onclick="location.href='/'" class="btn btn-primary" style="margin-left: 10px;"><strong>연봉정보</strong></button>
					<button class="btn btn-default" data-toggle="modal" data-target="#myModal" style="margin-left: 10px;border: hidden;">기업리뷰 작성</button>
				</div>
			</div>
		</div>
		
		<!-- <div class="whiteBox" style="width: 920px;margin-top: 20px;height: 302px;">
			<div style="font-size: 20px;"><i class="fas fa-chart-pie" style="color:#337ab7;margin-top: 25px;margin-left: 25px;margin-bottom: 20px;margin-right: 5px;"></i>리뷰 통계</div>
			<div style="margin-left: 40px;">
				리뷰 통계 내용
			</div>
		</div> -->
		
		<div class="whiteBox" style="width: 920px;margin-top: 20px;height: 302px;">
			<div style="font-size: 20px;"><i class="fas fa-comment-dots" style="color:#337ab7;margin-top: 25px;margin-left: 25px;margin-bottom: 20px;margin-right: 5px;"></i>기업 리뷰</div>
				<c:forEach items="${crVo }" var="crVo">
					<div style="margin-left: 60px;margin-bottom: 7px;">
						<div>
							<label>${crVo.user_id } | </label>
							<label style="margin-left: 5px;">${crVo.job_rank } | </label>
							<label>${crVo.write_date }</label>
							<div style="margin-left: 10px;margin-right: 50px;margin-top: 2px;">
								<label>${crVo.cr_contents }</label>
							</div>
						</div>
					</div>	
				</c:forEach>
		</div>
	</div>	
	
	<!-- 기업리뷰 작성 모달창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"><strong>기업리뷰 작성</strong></h4>
	      </div>
	      <div class="modal-body">
	      
	      	<form action="/companyReviewInsert" method="post" id="reviewInsertBtn">
		      	<div>
		      		<label>작성자</label>
		      		<input name="user_id" type="text" class="form-control" value="${SESSION_MEMBERVO.mem_id}" readonly />
		      		<label>기업명</label>
		      		<input name="corp_id" type="text" class="form-control" value="${corporationInfo.corp_name }" readonly/>
		      		<label>직급</label>
			      		<select class="form-control essential " id=job_rank name="job_rank" style="height: 30px; padding: 0 0 0 0;">
			      			<option value="no" hidden=""> 직급 선택 </option>
			      			<option value="회장">회장</option>
							<option value="부회장">	부회장</option>               
							<option value="사장">	사장</option>               
							<option value="부사장">	부사장</option>               
							<option value="전무이사">	전무이사</option>               
							<option value="상무이사">	상무이사</option>               
							<option value="이사">		이사</option>               
							<option value="부장">		부장</option>               
							<option value="차장">		차장</option>               
							<option value="과장">		과장</option>               
							<option value="계장">		계장</option>               
							<option value="대리">		대리</option>               
							<option value="주임">		주임</option>
							<option value="사원">		사원</option>
							<option value="인턴">		인턴</option>
			      		</select>
		      		<label>리뷰내용</label>
		      		<textarea name="cr_contents" class="form-control" rows="5"></textarea>
		      	</div>
	      	</form>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="reviewSaveBtn" style="margin-left: 450px;">저장</button>
	      </div>
	    </div>
	  </div>
</div>

</div>
</div>
</div>
</div>

<script>

	$("#reviewSaveBtn").on("click",function(){
		$("input[name='corp_id']").val("${corporationInfo.corp_id}");
		$("#reviewInsertBtn").submit();
		alert("저장되었습니다");
		
		
	});


</script>