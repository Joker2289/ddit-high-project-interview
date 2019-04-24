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
















