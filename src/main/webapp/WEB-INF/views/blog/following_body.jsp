<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>

<table>
	<c:forEach items="${ followingList }" var="List">
		<tr>
			<td>${ List.keyword_name }</td>
			<td>${ List.ref_keyword }</td>
			<td>${ List.keyword_name }</td>
			<td>${ List.division }</td>

			<c:choose>
				<c:when test="${ List != null}">
					<!-- 일반회원일 경우 -->
					<c:if test="${ List.division == '43' || List.division == '11' }">
						
					</c:if>
					<c:if test="${ List.division == '16' }">
						
					</c:if>
				</c:when>
				<c:otherwise>
					<span>팔로잉 중인 내역이 없습니다</span>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>