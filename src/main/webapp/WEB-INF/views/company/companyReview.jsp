<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
<div class="row">
<div>
<div class="row">
	<div class="col-md-10" style="padding-left: 0px;margin-left: 30px;top: -8px;width: 1153px;">
	<c:set var="bg_addrpath" value="/background?mem_id=${corporationInfo.corp_id }"/>
	<c:set var="profile_addrpath" value="/profile?mem_id=${corporationInfo.corp_id }"/>
			 <c:if test="${fn:contains(corporationInfo.bg_path, 'http')}">
		      <c:set var="bg_path" value="${corporationInfo.bg_path }"/> 
		   </c:if> 
			<c:if test="${fn:contains(corporationInfo.logo_path, 'http')}">
				<c:set var="profile_path" value="${corporationInfo.logo_path }" />
			</c:if>
		<div class="whiteBox" style="background-repeat: round;background-image:url(${not empty bg_path ? bg_path : bg_addrpath});display: flex;width: 1138px;margin-top: 29px;border-color: white;border-radius: 0px;height: 172px;box-shadow: 0 0px 0px rgba(0, 0, 0, .175);">
			<div
				style="width: 120px;height:80px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin: 45px 0 12px 40px;"
			>
			</div>
			<div>
				<label style="text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white; font-size: 27px;margin-top: 51px;margin-left: 10px;"><strong>${corporationInfo.corp_name }</strong></label>
				<div style="margin-left: 10px;margin-top: 6px;">
					<button onclick="location.href='companyReview?corp_id=${corporationInfo.corp_id }'" class="btn btn-primary"><strong>기업리뷰</strong></button>
					<button onclick="location.href='companySalary?corp_id=${corporationInfo.corp_id }'" class="btn btn-primary" style="margin-left: 10px;"><strong>연봉정보</strong></button>
					
					<c:if test="${ employInfo != null}">
						<button class="btn btn-default" data-toggle="modal" data-target="#myModal" style="margin-left: 10px;border: hidden;">기업리뷰 작성</button>
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- <div class="whiteBox" style="width: 920px;margin-top: 20px;height: 302px;">
			<div style="font-size: 20px;"><i class="fas fa-chart-pie" style="color:#337ab7;margin-top: 25px;margin-left: 25px;margin-bottom: 20px;margin-right: 5px;"></i>리뷰 통계</div>
			<div style="margin-left: 40px;">
				리뷰 통계 내용
			</div>
		</div> -->
		
		<div class="whiteBox" style="width: 1140px;margin-top: 20px;">
			<div style="font-size: 20px;"><i class="fas fa-comment-dots" style="color:#337ab7;margin-top: 25px;margin-left: 25px;margin-bottom: 20px;margin-right: 5px;"></i>기업 리뷰</div>
			
				<c:choose>
					<c:when test="${fn:length(crVo) eq 0 }">
						<div style="text-align: center;">
							<label style="font-size: 20px;">등록된 리뷰가 없습니다.</label>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${crVo }" var="crVo">
							<div style="margin-left: 60px;margin-bottom: 7px;">
								<div>
									<label style="font-size: 19px;">${crVo.user_id } </label> | 
									<label style="font-size: 17px;margin-left: 5px;">${crVo.job_rank } </label> |
									<label>
										<fmt:parseDate value="${crVo.write_date }" var="write_date" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${write_date }" pattern="yyyy-MM-dd"/>
									</label>
									<div style="margin-left: 10px;margin-right: 50px;margin-top: 2px;">
										<div style="margin-bottom: 15px;">
											<label style="color: blue;font-size: 15px;"><strong>장점</strong></label><br>
											<label style="margin-left: 15px;margin-right: 15px;margin-top: 3px;">${fn:split(crVo.cr_contents,'☆')[0]}</label>
										</div>
										<div style="margin-bottom: 15px;">
											<label style="color: red;font-size: 15px;"><strong>단점</strong></label><br>
											<label style="margin-left: 15px;margin-right: 15px;margin-top: 3px;">${fn:split(crVo.cr_contents,'☆')[1]}</label>
										</div>
										<div>
											<label style="font-size: 15px;"><strong>경영진에게 바라는 점</strong></label><br>
											<label style="margin-left: 15px;margin-top: 3px;">${fn:split(crVo.cr_contents,'☆')[2]}</label>
										</div>
										<hr style="width: 100%;border-color: #a7abb2;margin-top: 15px;margin-bottom: 15px;">
									</div>
								</div>
							</div>	
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			<c:choose>
				<c:when test="${fn:length(crVo) eq 0 }">
					<div style="text-align: center;margin-bottom: 50px;">
						 <div></div>
					</div>
				</c:when>
				<c:otherwise>
					<nav style="margin-bottom: -15px;text-align:center;">
					  <ul class="pagination pagination-sm">
					  	<c:choose>
					  		<c:when test="${paginationVo.page == 1 }">
							    <li class="disabled">
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
					  		</c:when>
					  		<c:otherwise>
					  			<li>
									<a href="/companyReview?corp_id=${corporationInfo.corp_id }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
					  		</c:otherwise>
					  	</c:choose>
					  	
					  	<c:forEach begin="1" end="${lastPage }" var="i">
					  		<c:set var="active" value="" />
				  		<c:if test="${i == paginationVo.page }">
				  			<c:set var="active" value="active" />
				  		</c:if>
				  			<li class="${active }">
								<a href= "/companyReview?corp_id=${corporationInfo.corp_id }&page=${i}">${i}</a>
							</li>
					  	</c:forEach>
						    
						<c:choose>
							<c:when test="${paginationVo.page == lastPage }">
							    <li class="disabled">
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/companyReview?corp_id=${paginationVo.corp_id }&page=${lastPage}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					  </ul>
					</nav>
				</c:otherwise>
			</c:choose>
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
							<option value="전 직원">	전 직원</option>
			      		</select>
		      		<label>장점</label>
		      		<textarea name="cr_content" class="form-control" rows="3"></textarea>
		      		<label>단점</label>
		      		<textarea name="cr_content" class="form-control" rows="3"></textarea>
		      		<label>경영진에게 바라는 점</label>
		      		<textarea name="cr_content" class="form-control" rows="3"></textarea>
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
		
		if($("#job_rank option:selected").val() == "no"){
			alert("직급을 선택해주세요");
			$("select[name=job_rank]").focus();
			return false;
		}
		if($("textarea[name=cr_content]").val().trim()==""){
			alert("내용을 모두 입력해주세요");
			$("textarea[name=cr_content]").focus();
			return false;
		}
		
		$("input[name='corp_id']").val("${corporationInfo.corp_id}");
		$("#reviewInsertBtn").submit();
		alert("저장되었습니다");
		
		
	});


</script>