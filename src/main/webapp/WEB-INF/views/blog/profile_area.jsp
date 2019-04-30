<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="panel panel-default">
	<div class="panel-body">
		<div class="thumbnail">
			<a href="/profileHome?user_id=${uVo.user_id}"><img
				src="${ cp }/view/imageView?mem_id=${ uVo.user_id }&division=pf"
				class="img-circle"></a>
			<div class="caption">

				<span class="span-name"><a
					href="/blog/blogMainView?user_id=${uVo.user_id}">${ uVo.user_name }</a></span>


				<table class="act_table">
					<tr>
						<td class="title" colspan='2'>Activity</td>
					</tr>
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
						<td>${ pageCnt }개</td>
					</tr>
					<tr>
						<td class="subject">좋아요 수</td>
						<td>${ goodCnt }개</td>
					</tr>
					<tr>
						<td class="subject">질문 수</td>
						<td>100개</td>
					</tr>
					<tr>
						<td class="subject">답변 수</td>
						<td>100개</td>
					</tr>
				</table>

				<c:if test='${ uVo.user_id == SESSION_MEMBERVO.mem_id }'>
					<button id="settingBtn" class="btn settingBtn">Blog 설정</button>
				</c:if>
				
			</div>
		</div>
	</div>
</div>












<script>


	
</script>


