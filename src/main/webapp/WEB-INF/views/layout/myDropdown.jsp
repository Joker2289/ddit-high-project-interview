<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table id="profilemenu">
	<thead>
		<tr>
			<td style="padding-bottom: 10px;display: flex;">
				<c:set var="profile_addrpath" value="/profile?mem_id=${SESSION_MEMBERVO.mem_id }"/>
				<c:if test="${fn:contains(PROFILE_REALPATH, 'http')}">
					<c:set var="profile_path" value="${PROFILE_REALPATH }"/>
				</c:if>
				<div style="padding-right: 0px;">
					<div style="width: 50px; height: 50px; margin-left: 95px; border-radius: 50px; background-repeat: no-repeat;background-size: cover;background-position: center; background-image: url(${fn:contains(PROFILE_REALPATH, 'http') ? profile_path : profile_addrpath});"></div>
					<label style="width:240px; height:22px; text-align: center; text-overflow: ellipsis;overflow: hidden;-webkit-line-clamp: 1;-webkit-box-orient: vertical;">${MYNAME }</label>
				</div>
				
			</td>
		</tr>
		<c:if test="${SESSION_MEMBERVO.mem_division == '1' }">
			<tr class="profiletr">
					<td
						style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px; border-top: 1px solid #CFD1D3;"
						onclick="javascript:location.href='/profileHome'">프로필보기</td>
			</tr>
			<tr class="profiletr">
					<td style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px; border-bottom: 1px solid #CFD1D3;"
						onclick="javascript:location.href='/blog/blogMainView?user_id=${ SESSION_MEMBERVO.mem_id }'">블로그</td>
			</tr>
		</c:if>
		<c:if test="${SESSION_MEMBERVO.mem_division == '2' }">
			<tr class="profiletr">
					<td
						style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px; border-top: 1px solid #CFD1D3; border-bottom: 1px solid #CFD1D3;"
						onclick="javascript:location.href='/corp/corporation?corp_id=${ SESSION_MEMBERVO.mem_id }'">회사 페이지</td>
			</tr>
		</c:if>
		
	</thead>
	<tbody>
		<tr class="profiletr">
			<td style="color: #666666;">개인정보설정</td>
		</tr>
		<tr class="profiletr">
			<td style="color: #666666;">글&amp;활동</td>
		</tr>
		<tr class="profiletr">
			<td style="color: #666666;">채용공고</td>
		</tr>
		<tr class="profiletr" style="border-top: 1px solid #CFD1D3;" onclick="javascript:location.href='/login'">
					<td style="color: #666666;">로그아웃</td>
				</tr>
	</tbody>
</table>