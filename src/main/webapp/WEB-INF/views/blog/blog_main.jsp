<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link href="/css/blog/blog.css" rel="stylesheet">
<link href="/css/blog/blog_activity_modal.css" rel="stylesheet">
<link href="/css/blog/blog_setting_form.css" rel="stylesheet">


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
				<%@ include file="/WEB-INF/views/blog/profile_area.jsp"%><!-- /프로필영역 -->
				<%@ include file="/WEB-INF/views/blog/portfolio_area.jsp"%><!-- /포트폴리오 영역 -->
			</div>

			<div id="content_area">
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



				<%@ include file="/WEB-INF/views/blog/right_area.jsp"%><!-- 오른쪽 메뉴 영역 -->
				
			</div>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/blog/blog_activity_modal.jsp"%><!-- 글 작성 모달창 -->



<script>
	
	var userId = "${ uVo.user_id }";
	
	function activityClick(req) {
		
		if(req == 'follower'){
			$.ajax({
				url : "${cp}/blog/activityFollower",
				data : {"userId" : userId },
				success : function(data) {

					console.log(data);
					$('#modal-body').html(data);
					$('#modal_head').text("팔로워");
					
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
					$('#modal_head').text("팔로잉");
					
					$('.jk-modalsasun').css('display', 'block');			
				}
			});
		}
	};
	
	$('#settingBtn').on('click', function(){
		
		$.ajax({
			url : "${cp}/blog/blogSettingForm",
			data : {"userId" : userId },
			success : function(data) {
				
				console.log("data");
				$('#content_area').html(data);			
			}
		});
	});
	
</script>