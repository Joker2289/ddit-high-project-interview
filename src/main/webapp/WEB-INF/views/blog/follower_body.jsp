<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>

<table class="follow_table">
	<c:forEach items="${ followList }" var="List">
		<tr>
			<c:choose>
				<c:when test="${ List != null}">
					<!-- 일반회원 -->
					<c:if test="${ List.mem_division == '1'}">
						<td class="img_td">
							<c:choose>
								<c:when test="${ fn:contains(List.image_path, 'http') }">
									<a href="/profileHome?user_id=${ List.mem_id }"><img src="${ List.image_path }" class="img-circle modal-img"></a>
								</c:when>	
							
								<c:otherwise>
									<a href="/profileHome?user_id=${ List.mem_id }"><img src="${ cp }/view/imageView?mem_id=${ List.mem_id }&division=pf" class="img-circle modal-img"></a>
								</c:otherwise>	
							</c:choose>
						</td>	
							
						<td>${ List.keyword_name }</td>
					</c:if>
					
					<!-- 기업 -->
					<c:if test="${List.mem_division == '2' }">
						<td class="img_td">
							<c:choose>
								<c:when test="${ fn:contains(List.image_path, 'http') }">
									<a href="/corporation?corp_id=${ List.mem_id }"><img src="${ List.image_path }" class="img-circle modal-img"></a>
								</c:when>
								<c:otherwise>
									<a href="/corporation?corp_id=${ List.mem_id }"><img src="${ cp }/view/imageView?mem_id=${ List.mem_id }&division=pf" class="img-circle modal-img"></a>
								</c:otherwise>	
							</c:choose>
						</td>
							
						<td>${ List.keyword_name }</td>
					</c:if>
				</c:when>
				<c:otherwise>
					<span>팔로잉 중인 내역이 없습니다</span>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>