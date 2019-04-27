<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!-- rRList1가 있으면 출력. -->
<input type="hidden" id="hidden_size" value="${rRList1.size() }" data-listsize="${rRList1.size() }">
<c:if test="${rRList1.size() >= 1 }">
	<ul id="content1" style="list-style: none; width: 3000px; padding-left: 5px;">
	<c:forEach items="${rRList1 }" varStatus="i" var="rRVo">
		<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
				margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
			<div class="recr" onmouseover="" style="cursor: pointer; height: 215px; border-bottom: 1px solid;
					border-bottom-color: #d9d9d9;" data-code="${rRVo.recruit_code }">
				<div class="table_div" style="height: 80px; border: 0px solid; margin-left: 24px;">
					<img src="${corpImgList1.get(i.index) }" width="200">
				</div> <br><br>
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
				${corpNmList1.get(i.index) } <br>
				${rRVo.job_local } <br>
				${rRVo.job_type }
			</div>
			<c:choose>
				<c:when test="${scrapList1.get(i.index) == 'f' }">
					${timeList1.get(i.index) } 전 · 
					<div class="scrap" data-scrap="${scrapList1.get(i.index) }" data-code="${rRVo.recruit_code }"
							style="display: inline;">
						<i class="far fa-bookmark" onmouseover="" style="margin-top: 10px; 
								font-size: large; cursor: pointer;"></i><br>
					</div>
				</c:when>
				<c:otherwise>
					${timeList1.get(i.index) } 전 · 
					<div class="scrap" data-scrap="${scrapList1.get(i.index) }" data-code="${rRVo.recruit_code }"
							style="display: inline;">
						<i class="fas fa-bookmark" onmouseover="" style="margin-top: 10px; 
								font-size: large; cursor: pointer;"></i><br>
					</div>
				</c:otherwise>
			</c:choose>
		</div></li>
	</c:forEach>
	</ul>
</c:if> 

					
					
					
					