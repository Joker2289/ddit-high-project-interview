<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!-- recrList2가 있으면 출력. -->
<%-- <c:if test="${recrList2.size() >= 1 }"> --%>
<!-- 	<table class="tb_recruit"> -->
<!-- 		<tr style="width: 100px; height: 140px; text-align: left;"> -->
<%-- 			<c:forEach items="${recrList2 }" varStatus="i" var="rRVo"> --%>
<!-- 				<td style="width: 5px; height: 5px;"> -->
<%-- 					<div id="recr${i.index }" onmouseover="" style="cursor: pointer;"> --%>
<!-- 						<div class="table_div"> -->
<%-- 							<img src="${corpImgList.get(i.index) }" width="200"> --%>
<!-- 						</div> <br> -->
<%-- 						<strong>${rRVo.recruit_title }</strong> <br> --%>
<%-- 						${corpNmList.get(i.index) } <br> --%>
<%-- 						${rRVo.job_local } <br> --%>
<%-- 						${rRVo.job_type } --%>
<!-- 					</div> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${scrapList1.get(i.index) == 'f' }"> --%>
<!-- 							scrap_flag에 recruit_code를 붙여주자. (예: t12) -->
<%-- 							<i id="scrap${i.index }" class="far fa-bookmark" onmouseover=""  --%>
<!-- 									style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<i id="scrap${i.index }" class="fas fa-bookmark" onmouseover=""  --%>
<!-- 									style="margin-top: 10px; font-size: large; cursor: pointer;"></i><br> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				</td>								 -->
<%-- 			</c:forEach> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
<%-- </c:if>  --%>

<c:if test="${recrList2.size() >= 1 }">
	<input type="hidden" id="hidden_size" value="${recrList2.size() }">

	<ul id="content1" style="list-style: none; width: ${width_value }px; padding-left: 5px;">
	<c:forEach items="${recrList2 }" varStatus="i" var="rRVo">
		<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
				margin-right: 10px; padding: 8px; font-size: 16px; height: 270px;">
			<div class="recr" onmouseover="" style="cursor: pointer;" data-recruit_code="${rRVo.recruit_code }">
				<div class="table_div">
					<img src="${corpImgList.get(i.index) }" width="200">
				</div> <br>
				<strong>${rRVo.recruit_title }</strong> <br>
				${corpNmList.get(i.index) } <br>
				${rRVo.job_local } <br>
				${rRVo.job_type }
			</div>
			<c:choose>
				<c:when test="${scrapList.get(i.index) == 'f' }">
					<!-- scrap_flag에 recruit_code를 붙여주자. (예: t12) -->
					<i id="scrap${i.index }" class="far fa-bookmark" onmouseover="" data-recruit_code="${rRVo.recruit_code }"
							style="margin-top: 10px; font-size: 22px; cursor: pointer; color: #0174b0;"></i><br>
				</c:when>
				<c:otherwise>
					<i id="scrap${i.index }" class="fas fa-bookmark" onmouseover="" data-recruit_code="${rRVo.recruit_code }"
							style="margin-top: 10px; font-size: 22px; cursor: pointer; color: #0174b0;"></i><br>
				</c:otherwise>
			</c:choose>
		</div></li>
	</c:forEach>
	</ul>
</c:if> 

	
	
	