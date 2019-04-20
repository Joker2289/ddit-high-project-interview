<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<div class="panel panel-default">
	<div class="panel-body">
		
		<div class="portfolioTitle">포트폴리오</div>
			
		<c:forEach items="${ portfolioList }" var="portfolio">

			<button id="${ portfolio.portfolio_code }" type="button" class="btn btn-default portfolio" data-container="body" data-toggle="popover" data-placement="right" data-content=" " data-trigger="focus" data-html="true" onclick="portfolioClick(${ portfolio.portfolio_code });">
		    	${ portfolio.portfolio_name }
		  	</button>
			
			
		</c:forEach>


	</div>
</div>




<script>


function portfolioClick(portfolio_code){
	
	$('#'+portfolio_code).popover('enable'); 
	
	$.ajax({
		url : "${cp}/blog/showSection",
		data : {"portfolio_code" : portfolio_code },
		success : function(data) {
			
			console.log(data);
			
			$('.popover-content').html(data);	
		}
	});
	
	
	
	
}


</script>


