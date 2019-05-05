<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="panel panel-default">
	<div class="panel-body">
		<div class="thumbnail">
			<%-- <a href="/profileHome?user_id=${uVo.user_id}"><img src="${ cp }/view/imageView?mem_id=${ uVo.user_id }&division=pf" class="img-circle"></a> --%>
			<c:choose>
				<c:when test="${ fn:contains( uVo.profile_path, 'http') }">
					<c:if test="${ uVo.user_id == SESSION_MEMBERVO.mem_id }">
						<a href="/profileHome"><img src="${ uVo.profile_path }" class="img-circle"></a>
					</c:if>
					<c:if test="${ uVo.user_id != SESSION_MEMBERVO.mem_id }">
						<a href="/profileHome?user_id=${ uVo.user_id }"><img src="${ uVo.profile_path }" class="img-circle"></a>
					</c:if>
				</c:when>	
			
				<c:otherwise>
					<c:if test="${ uVo.user_id == SESSION_MEMBERVO.mem_id }">
						<a href="/profileHome"><img src="${ cp }/view/imageView?mem_id=${ uVo.user_id }&division=pf"class="img-circle"></a>
					</c:if>
					<c:if test="${ uVo.user_id != SESSION_MEMBERVO.mem_id }">
						<a href="/profileHome?user_id=${ uVo.user_id }"><img src="${ cp }/view/imageView?mem_id=${ uVo.user_id }&division=pf"class="img-circle"></a>
					</c:if>
				</c:otherwise>	
			</c:choose>
			
			
			<div class="caption">

				<span class="span-name"><a
					href="/blog/blogMainView?user_id=${uVo.user_id}">${ uVo.user_name }</a></span>


				<table class="act_table">
					<tr>
						<td class="subject">팔로워</td>
						<td><a href="javascript:activityClick('follower');">${ followerCnt }명</a></td>
					</tr>
					<tr>
						<td class="subject">팔로잉</td>
						<td><a href="javascript:activityClick('following');">${ followingCnt }명</a></td>
					</tr>
					<tr>
						<td class="subject">총 게시글 수</td>
						<td><span id="page_cnt">${ pageCnt }</span>개</td>
					</tr>
					<tr>
						<td class="subject">받은 추천 수</td>
						<td><span id="good_cnt">${ goodCnt }</span>개</td>
					</tr>
				</table>

				<c:if test='${ uVo.user_id == SESSION_MEMBERVO.mem_id }'>
					<button id="settingBtn" class="btn settingBtn" onclick="setting_page();">Blog 설정</button>
				</c:if>
				
			</div>
		</div>
	</div>
</div>

<script>

/* 블로그 세팅 페이지 출력 */
function setting_page(){
	
	$.ajax({
		url : "${cp}/blog/blogSettingForm",
		data : {"user_id" : userId },
		success : function(data) {
			$('#content_area').html(data);			
		}
	});
	
}

	
</script>


