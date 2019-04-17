<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link href="/css/blog/blog.css" rel="stylesheet">
<link href="/css/blog/blog_activity_modal.css" rel="stylesheet">

<!DOCTYPE html>
<div class="container B_head">

	<div class="jumbotron">
		<h1 class="head_title">${ uVo.user_name }님의 Blog</h1>
	</div>

</div>


<div class="container B_body">
	<div class="row">
		<div>

			<div class="col-md-3">

				<div class="panel panel-default">
					<div class="panel-body">
						<div class="thumbnail">
							<a href="/profileHome?user_id=${uVo.user_id}"><img
								src="${ cp }/view/imageView?mem_id=${ uVo.user_id }&division=pf"
								class="img-circle"></a>
							<div class="caption">

								<span class="span-name"><a
									href="/profileHome?user_id=${uVo.user_id}">${ uVo.user_name }</a></span>


								<table class="act_table">
									<tr>
										<td class="title" colspan='2'>Activity</td>
									</tr>
									<tr>
										<td class="subject">팔로워</td>
										<td><a href="javascript:activityClick('follower');">100명</a></td>
									</tr>
									<tr>
										<td class="subject">팔로잉</td>
										<td><a href="javascript:activityClick('following');">100명</a></td>
									</tr>
									<tr>
										<td class="subject">총 게시글 수</td>
										<td>100개</td>
									</tr>
									<tr>
										<td class="subject">좋아요 수</td>
										<td>100개</td>
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

								<p>
									<a href="#" class="btn btn-primary" role="button">Blog 설정</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- /프로필영역 -->
				<div class="panel panel-default">
					<div class="panel-body">



						<span class="span-text"><a>포트폴리오 영역</a></span>


					</div>
				</div>
				<!-- /포트폴리오 영역 -->
			</div>


			<div class="col-md-6">

				<div class="panel panel-default">
					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>

					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>

					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>

					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>

					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>

					<div class="panel-body">
						<span class="span-text"><a>게시글 영역</a></span>
					</div>
				</div>
			</div>



			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-body">
						<a href="#"><h4>최근 게시물</h4></a>
						<ul>
							<li><a href="#">앙 광고띠</a></li>
						</ul>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<a href="#"><h4>인기 게시물</h4></a>
						<ul>
							<li><a href="#">앙 광고띠</a></li>
						</ul>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<a href="#"><h4>질문 게시판</h4></a>
						<ul>
							<li><a href="#">앙 광고띠</a></li>
						</ul>
					</div>
				</div>
				<!-- ./add friend -->
			</div>


		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/blog/blog_activity_modal.jsp"%><!-- 글 작성 모달창 -->



<script>

	
	function activityClick(req) {
		
		var userId = "${ uVo.user_id }";
		
		if(req == 'follower'){
			$.ajax({
				url : "${cp}/blog/activityFollower",
				data : {"userId" : userId },
				success : function(data) {

					console.log(data);
					$('#modal-body').html(data);
					
					$('.jk-modalsasun').css('display', 'block');			
				}
			});
		} else if(req == 'following') {
			$.ajax({
				url : "${cp}/blog/activityFollowing",
				data : {"userId" : userId },
				success : function(data) {

					console.log(data);
					$('#modal-body').html(data);
					
					$('.jk-modalsasun').css('display', 'block');			
				}
			});
		}
		

		  
	};
</script>