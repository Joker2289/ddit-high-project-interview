<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>



<!-- 페이지 출력 구역 -->
<div id="page_area">
	<%@ include file="/WEB-INF/views/blog/page_area.jsp"%><!-- /포트폴리오 영역 -->
</div>

<div id="right_area">
	<!-- 오른쪽 메뉴 구역 -->
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
	</div>
</div>




<script>

	/* 페이지 삭제 */
	function delete_page(page_code, user_id, division){
		
		$.ajax({
			url : "${cp}/page/delete_page",
			data : { "page_code" : page_code, "user_id" : user_id},
			success : function(data) {
				
				alert('페이지 삭제');
				
				$('#page_area').html(data);
							
			}
		});
	}
	
	/* page 수정 페이지로 이동 */
	function update_onenote_write(page_code){
		document.location.href = "/page/update_onenote_write?page_code=" + page_code;
	}
	
	//페이지 좋아요
	function good_page(page_code, user_id){
			
		$.ajax({
			url : "${cp}/blog/good_page",
			data : {"page_code" : page_code, "user_id" : user_id },
			success : function(data) {
				
				$('#page_area').html(data);
				
			}
		});
	
	}
	
	//페이지 좋아요 취소
	function cancelGood_page(good_code, ref_code, user_id){
		$.ajax({
			url : "${cp}/blog/cancelGood_page",
			data : { "good_code" : good_code, "page_code" : ref_code, "user_id" : user_id },
			success : function(data) {
				
				$('#page_area').html(data);
				
			}
		});
	}

</script>











