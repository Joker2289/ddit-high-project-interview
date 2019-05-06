<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
						<button class="btn btn-default" data-toggle="modal" data-target="#myModal" style="margin-left: 10px;border: hidden;">연봉정보 작성</button>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="whiteBox" style="width: 1140px;margin-top: 20px;">
			<div style="font-size: 20px;"><i class="fas fa-comment-dollar" style="color:#337ab7;margin-top: 25px;margin-left: 25px;margin-bottom: 20px;margin-right: 5px;"></i>연봉 정보</div>
				<div style="margin-left: 60px;margin-bottom: 50px;">
				
				<c:choose>
					<c:when test="${fn:length(siVo) eq 0 }">
						<div style="text-align: center;">
							<label style="font-size: 20px;">등록된 연봉 정보가 없습니다.</label>
						</div>
					</c:when>
					<c:otherwise>
					
					<div>
						
							<table class="table table-hover" style="width: 900px;margin-left: 50px;">
								
								<tbody>
								
									<c:forEach items="${siVo }" var="siVo2">
										<c:choose>
											<c:when test="${siVo2.job_rank eq '1'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;"><%-- ${siVo2.job_rank} --%>인턴</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '2'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">사원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '3'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">주임</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '4'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">대리</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '5'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">계장</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '6'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">과장</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '7'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">차장</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
											<c:when test="${siVo2.job_rank eq '8'}">
												<tr>
													<td style="padding-top: 17px;padding-bottom: 17px;">
														<div style="display: inline;margin-left: 20px;">
															<div style="font-size:15px;display: inline;"><strong>직급 : </strong></div>
															<div style="font-size:20px;display: inline;">부장</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;"><strong>평균 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.avgSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #ff6b6b;"><strong>최소 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.minSalary} 만원</div>
														</div>
														<div style="display: inline;margin-left: 70px;">
															<div style="font-size:15px;display: inline;color: #2176ff;"><strong>최대 연봉 : </strong></div>
															<div style="font-size:20px;display: inline;">${siVo2.maxSalary} 만원</div>
														</div>
													</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								
								</tbody>
								
							</table>
							
						</div>
						</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			
		</div>
		
	</div>
	
	<!-- 연봉정보 작성 모달창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel"><strong>연봉정보 작성</strong></h4>
		      </div>
		      <div class="modal-body">
		      
		      	<form action="/companySalaryInsert" method="post" id="salaryInsertBtn">
			      	<div>
			      		<label>작성자</label>
			      		<input name="user_id" type="text" class="form-control" value="${SESSION_MEMBERVO.mem_id}" readonly />
			      		<label>기업명</label>
			      		<input name="corp_id" type="text" class="form-control" value="${corporationInfo.corp_name }" readonly/>
			      		<label>기본 급여(연봉) 및 상여</label>
			      		<div class="row">
		      				<div class="col-md-10" style="display: inline;">
		      					<input name="salary_info" type="number" placeholder="예) 3000 입력" class="form-control" />
		      				</div>
		      					<div style="font-size: 19px;margin-top: 4px;margin-left: 0px;left: -19px;" class="col-md-2">만원</div>
		      			</div>
		      			<label>직군</label>
			      		<input name="job_position" type="text" class="form-control" />
			      		<label>직급</label>
				      		<select class="form-control essential " id=job_rank name="job_rank" style="height: 30px; padding: 0 0 0 0;">
				      			<option value="no" hidden=""> 직급 선택 </option>
								<option value="8">		부장</option>               
								<option value="7">		차장</option>               
								<option value="6">		과장</option>               
								<option value="5">		계장</option>               
								<option value="4">		대리</option>               
								<option value="3">		주임</option>
								<option value="2">		사원</option>
								<option value="1">		인턴</option>
				      		</select>
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

<script>

	$("#reviewSaveBtn").on("click",function(){
		
		if($("input[name=salary_info]").val().trim()==""){
			alert("연봉정보를 입력해주세요");
			$("input[name=salary_info]").focus();
			return false;
		}
		if($("input[name=job_position]").val().trim()==""){
			alert("직군을 입력해주세요");
			$("input[name=job_position]").focus();
			return false;
		}
		if($("#job_rank option:selected").val() == "no"){
			alert("직급을 선택해주세요");
			$("select[name=job_rank]").focus();
			return false;
		}
		
		$("input[name='corp_id']").val("${corporationInfo.corp_id}");
		$("#salaryInsertBtn").submit();
		alert("저장되었습니다");
		
	});

</script>