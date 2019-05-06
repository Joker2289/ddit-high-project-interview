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
				<c:if test="${ employee.user_id != SESSION_MEMBERVO.mem_id }">
					<button id=${ employee.user_id } class="btn btn-primary employee_follow_btn" onclick="employee_follow('${ employee.user_id }');"> <i class="fas fa-plus"></i> 팔로우 </button>
				</c:if>
				<c:if test="${ employee.user_id == SESSION_MEMBERVO.mem_id }">
					<button class="btn btn-primary hidden_my_btn" hidden><i class="fas fa-plus"></i> 나 </button>
				</c:if>
			</div>
		</div>
	</c:forEach>

<script>

/* <!-- <button class="btn btn-primary employee_unfollow_btn"> 팔로우 취소 </button> --> */
<c:forEach items="${ followList }" var="follow">
	/* console.log("${ follow.ref_keyword }"); */
	$('#${ follow.ref_keyword }').removeClass('employee_follow_btn');
	$('#${ follow.ref_keyword }').addClass('employee_unfollow_btn');
	$('#${ follow.ref_keyword }').text('팔로우 취소');
	$('#${ follow.ref_keyword }').attr('onclick', "employee_unfollow('${ follow.ref_keyword }');");
	
</c:forEach>

/* 직원 팔로우 */
function employee_follow(ref_keyword) {
	
	$.ajax({
	  url : '/corp/employee_follow',
      data : {"corp_id" : corp_id, "corp_code" : corp_code, "chart_index" : chart_index, "parameter" : parameter, "ref_keyword" : ref_keyword },
      success : function(data) {
    	  
    	  $('#empl_area_div').html(data);
    	  
      }
    });
}

/* 직원 언팔로우 */
function employee_unfollow(ref_keyword) {
	
	$.ajax({
	  url : '/corp/employee_unfollow',
      data : {"corp_id" : corp_id, "corp_code" : corp_code, "chart_index" : chart_index, "parameter" : parameter, "ref_keyword" : ref_keyword },
      success : function(data) {
    	  
    	  $('#empl_area_div').html(data);
    	  
      }
    });
}


</script>


