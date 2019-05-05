<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

	<c:forEach items="${ employ_List }" var="employee" varStatus="index">
		<div class="employee_div">
		
			<div class="employee_content">
				
				<c:choose>
					<c:when test="${ fn:contains( employee.img_path, 'http') }">
						<c:if test="${ employee.user_id == SESSION_MEMBERVO.mem_id }">
							<a href="/profileHome"><img src="${ employee.img_path }" class="img-circle"></a>
						</c:if>
						<c:if test="${ employee.user_id != SESSION_MEMBERVO.mem_id }">
							<a href="/profileHome?user_id=${ employee.user_id }"><img src="${ employee.img_path }" class="img-circle"></a>
						</c:if>
					</c:when>	
				
					<c:otherwise>
						<c:if test="${ employee.user_id == SESSION_MEMBERVO.mem_id }">
							<a href="/profileHome"><img src="${ cp }/view/imageView?mem_id=${ employee.user_id }&division=pf"class="img-circle"></a>
						</c:if>
						<c:if test="${ employee.user_id != SESSION_MEMBERVO.mem_id }">
							<a href="/profileHome?user_id=${ employee.user_id }"><img src="${ cp }/view/imageView?mem_id=${ employee.user_id }&division=pf"class="img-circle"></a>
						</c:if>
					</c:otherwise>	
				</c:choose>
				
				<a class="employee_name">${ employee.user_name }</a>
				<a class="employee_corp">${ employee.info1 }</a>
				<a class="employee_job_position">${ employee.info2 }</a>
				
			</div>
			
			
			<div class="employee_footer">
				<button class="btn btn-primary footer_btn"> <i class="fas fa-plus"></i> 팔로우 </button>
			</div>
		</div>
	</c:forEach>

<script>
	 

</script>


