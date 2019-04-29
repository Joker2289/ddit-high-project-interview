<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:if test="${recrList2.size() >= 1 }">
	<input type="hidden" id="hidden_size" value="${recrList2.size() }">

	<ul id="content1" style="list-style: none; width: ${width_value }px; padding-left: 5px;">
	<c:forEach items="${recrList2 }" varStatus="i" var="rRVo">
		<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
				margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
			<div class="recr" onmouseover="" style="cursor: pointer; height: 215px; border-bottom: 1px solid;
					border-bottom-color: #d9d9d9;" data-recruit_code="${rRVo.recruit_code }">
				<div class="table_div" style="height: 80px; border: 0px solid; margin-left: 24px;">
					<img src="${corpImgList.get(i.index) }" width="200">
				</div> <br>
				<strong style="padding-top: 50px;">
					<c:choose>
						<c:when test="${rRVo.recruit_title.length() > 18 }">
							${rRVo.recruit_title.substring(0, 18) }...
						</c:when>
						<c:otherwise>
							${rRVo.recruit_title }
						</c:otherwise>
					</c:choose>
				</strong> <br>
				${corpNmList.get(i.index) } <br>
				${rRVo.job_local } <br>
				${rRVo.job_type }
			</div>
			<div style="padding-top: 10px;">
				${timeList.get(i.index) } 전
			</div>
		</div></li>
	</c:forEach>
	</ul>
</c:if> 

	
	
	