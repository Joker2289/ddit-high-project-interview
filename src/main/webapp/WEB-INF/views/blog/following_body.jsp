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
					<c:if test="${ List.division == '43'}">
						<td class="img_td">
							<c:choose>
								<c:when test="${ fn:contains(List.image_path, 'http') }">
									<a href="/profileHome?user_id=${ List.ref_keyword }"><img src="${ List.image_path }" class="img-circle modal-img"></a>
								</c:when>	
							
								<c:otherwise>
									<a href="/profileHome?user_id=${ List.ref_keyword }"><img src="${ cp }/view/imageView?mem_id=${ List.ref_keyword }&division=pf" class="img-circle modal-img"></a>
								</c:otherwise>	
							</c:choose>
						</td>	
							
						<td>${ List.keyword_name }</td>
							
						
					</c:if>
					
					<!-- 기업 -->
					<c:if test="${List.division == '11' }">
						<td class="img_td">
							<c:choose>
								<c:when test="${ fn:contains(List.image_path, 'http') }">
									<a href="/profileHome?user_id=${ List.ref_keyword }"><img src="${ List.image_path }" class="img-circle modal-img"></a>
								</c:when>
								<c:otherwise>
									<a href="/profileHome?user_id=${ List.ref_keyword }"><img src="${ cp }/view/imageView?mem_id=${ List.ref_keyword }&division=pf" class="img-circle modal-img"></a>
								</c:otherwise>	
							</c:choose>
						</td>
							
						<td>${ List.keyword_name }</td>
							
						
					</c:if>
					
					<!-- 해시태그 -->
					<c:if test="${ List.division == '16' }">
						<td class="img_td">
							<a href="/hashtagpost?hashtag_name=${ fn:split(List.ref_keyword, '#')[0]}"><img src="${ cp }/view/imageView?mem_id=해시태그&division=ht" class="img-circle modal-img"></a>
						</td>
						<td>${ List.ref_keyword }</td>
					</c:if>
				</c:when>
				<c:otherwise>
					<span>팔로잉 중인 내역이 없습니다</span>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>