<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link href="/css/blog/blog.css" rel="stylesheet">
<link href="/css/blog/blog_activity_modal.css" rel="stylesheet">
<link href="/css/blog/blog_setting_form.css" rel="stylesheet">
<link href="/css/blog/blog_comment_area.css" rel="stylesheet">
<link href="/css/blog/blog_page_area.css" rel="stylesheet">
<link href="/css/blog/blog_page.css" rel="stylesheet">

<!-- include summernote css/js -->
<link href="/dist/summernote.css" rel="stylesheet">
<script src="/dist/summernote.js"></script>


<!DOCTYPE html>

<style>
@CHARSET "UTF-8";

@font-face { 
   font-family: '한돈삼겹살체300g'; 
   src: url(/font/한돈삼겹살체300g.ttf) format('truetype');
}


*{
   font-family: 한돈삼겹살체300g;
}
</style>

<div class="container B_head">
	<div id="head_area">
		<%@ include file="/WEB-INF/views/blog/head_area.jsp"%><!-- /포트폴리오 영역 -->
	</div>
</div>


<div class="container B_body"> 
	<div class="row">
		<div>

			<div class="col-md-3">
				<%@ include file="/WEB-INF/views/blog/profile_area.jsp"%><!-- /프로필영역 -->
				
				<div id=portfolio_area>
					<%@ include file="/WEB-INF/views/blog/portfolio_area.jsp"%><!-- /포트폴리오 영역 -->
				</div>
			</div>

			<div id="content_area">
				
				
				<%@ include file="/WEB-INF/views/blog/content_area.jsp"%><!-- 타임라인 영역 -->
				
				
				
				
			</div>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/blog/blog_activity_modal.jsp"%><!-- 글 작성 모달창 -->



<script>
	
	var userId = '${ uVo.user_id }';
	
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
			data : {"user_id" : userId },
			success : function(data) {
				$('#content_area').html(data);			
			}
		});
	});
	
	
</script>