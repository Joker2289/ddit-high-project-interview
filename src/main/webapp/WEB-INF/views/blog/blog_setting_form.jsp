<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




<div class="col-md-9">
	<div class="panel panel-default">
		<div class="panel-body">
		
			<div id="blog_form">
				
				<%@ include file="/WEB-INF/views/blog/blog_form.jsp"%>
				
			</div>
			
		</div>
	</div>
				
	<div class="panel panel-default">
		<div class="panel-body">
			<div id="portfolio_form">
				
				<%@ include file="/WEB-INF/views/blog/portfolio_form.jsp"%>
				
			</div>
		</div>
	</div>

</div>






