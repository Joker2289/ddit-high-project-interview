<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:forEach items="${corpList }" var="corp">
	<div class="corp_info">
	
		<div class="corp_img">
			<a href="/corp/corporation?corp_id=${ corp.mem_id }">
				<c:choose>
					<c:when test="${fn:contains(corp.profile_path, 'http') }">
						<img class="corp_logo" src="${corp.profile_path }" style="width: 150px;">
					</c:when>
					<c:otherwise>
						<img class="corp_logo" src="${ cp }/view/imageView?mem_id=${corp.mem_id }&division=pf">
					</c:otherwise>
				</c:choose>
			</a>
		</div>
		
		<div class="col-corpInfomation">
			<a class="txt-corp_name" style="width: 20%; display: inline-block;" href="/corp/corporation?corp_id=${corp.mem_id }">${corp.mem_name }</a>
			<span class="txt-industry" style="width: 68%;display: inline-block;">
				${corp.industry_type } / ${corp.addr1 }
			</span>
		</div>
		
		<div class="col-corpbuttom">
			<!-- 회사 팔로우 버튼 -->
			<input type="button" id="btn_follow${corp.col_no }" data-corp="${corp.mem_id }"
				<c:if test="${corp.mem_id eq corp.ref_keyword }">class="btn_unfollow" value="팔로우 중 "</c:if>
				<c:if test="${corp.mem_id != corp.ref_keyword }">class="btn_follow" value="+ 팔로우"</c:if>/>
		</div>
		
	</div>
</c:forEach>