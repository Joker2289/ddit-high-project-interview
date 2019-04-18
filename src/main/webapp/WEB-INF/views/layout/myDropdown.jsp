<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="profilemenu">
	<thead>
		<tr>
			<td style="padding-bottom: 0px;"><div class="col-md-3"
					style="padding-right: 0px; padding-left: 30px;">
					<span style="font-size: 50px;"><i class="fas fa-user-circle"></i></span>
				</div>
				<div class="col-md-6" style="padding-left: 30px;">
					<div class="col-md-6"
						style="width: 180px; padding-top: 12px; padding-left: 0px;">사용자이름</div>
					<div class="col-md-6" style="width: 180px; padding-left: 0px;">간단프로필</div>
				</div></td>
		</tr>
		<c:if test="${SESSION_MEMBERVO.mem_division == '1' }">
			<tr class="profiletr">
					<td
						style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px;"
						onclick="javascript:location.href='/profileHome'">프로필보기</td>
			</tr>
			<tr class="profiletr">
					<td
						style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px;"
						onclick="javascript:location.href='/blog/blogMainView?userId=${ SESSION_MEMBERVO.mem_id }'">블로그</td>
			</tr>
		</c:if>
		<c:if test="${SESSION_MEMBERVO.mem_division == '2' }">
			<tr class="profiletr">
					<td
						style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px;"
						onclick="javascript:location.href='/corporation'">회사 페이지</td>
			</tr>
		</c:if>
		
		<tr class="profiletr"
			style="border-top: 1px solid #CFD1D3; border-bottom: 1px solid #CFD1D3;">
			<td style="color: #666666; text-align: center;">프리미엄1개월무료이용</td>
		</tr>
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