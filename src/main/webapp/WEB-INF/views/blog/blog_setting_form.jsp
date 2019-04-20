<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




<div class="col-md-9">
	<div class="panel panel-default">
		<div class="panel-body">
			프로필 설정 & 배너 설정 
			<br> 
			blog head title / blog head bg / 질문 게시판 활성화

		</div>
	</div>

	<div class="panel panel-default">
		<div class="panel-body">
		
			<button id="addPortfolioBtn" class="btn btn-primary addPortfolioBtn"> <i class="far fa-plus-square"></i> 포트폴리오 추가</button>
			
			
			
			<div id="portfolio_All">
			
				<c:forEach items="${ portfolioList }" var="portfolio">
				<div id="portfolio_area${ portfolio.portfolio_code }">
					<a id="${ portfolio.portfolio_code }" class="btn btn-primary portfolio_btn" data-toggle="collapse"
					href="#section_area${ portfolio.portfolio_code }" aria-expanded="false"
					aria-controls="collapseExample">${ portfolio.portfolio_name }</a>
					
					
					<button id="deleteBtn${ portfolio.portfolio_code }" class="btn btn-primary delete_btn" onclick="deletePortfolio(${ portfolio.portfolio_code });"><i class="fas fa-times"></i></button>
	
	
					<div class="collapse" id="section_area${ portfolio.portfolio_code }" >
						<div class="well section_area">
						
							<h1> 섹션 영역 </h1>
						
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
				
			


		</div>
	</div>

</div>













<script>

/* 포트폴리오 추가 */
$('#addPortfolioBtn').on('click', function(){
	
	var user_id = '${ user_id }';
	
	$.ajax({
		url : "${cp}/blog/addPortfolio",
		data : {"user_id" : user_id },
		success : function(data) {

			console.log(data);
			$('#portfolio_All').append("<div id='portfolio_area"+ data+"'><a id='"+data+"'class='btn btn-primary portfolio_btn' data-toggle='collapse' href='#section_area"+data+"' aria-expanded='false' aria-controls='collapseExample'>포트폴리오</a><button id='deleteBtn"+data+"' class='btn btn-primary delete_btn'onclick='deletePortfolio("+data+");'><i class='fas fa-times'></i></button><div class='collapse'id='section_area"+data+"'><div class='well section_area'><h1>섹션영역</h1></div></div></div>");
						
		}
	});
	
	
});




$(document).off('addEffect');
$(document).on('click', function addEffect(e){
	var target = e.target;
	
	var id = target.id;
	var classList = target.classList;	
	var href = target.href;
	
	
	/* 포트폴리오 이름 수정 */
	if(classList[2] == 'portfolio_btn'){
		
		$('#'+id).off('dblclick');
		$('#'+id).on('dblclick', function(){
			
			var tmp_nm = $('#'+id).text();
			
			console.log(tmp_nm);
			
			$('#'+id).contents().unwrap().wrap("<input id='portfolio_TXT' type='text' class='form-control'>");
			$('#portfolio_TXT').val(tmp_nm);
			$('#portfolio_TXT').focus();
			$('#deleteBtn'+id).hide();
			
			
			$('#portfolio_TXT').on('keypress', function(e){
				if(e.keyCode ==13){
					var portfolio_nm = $('#portfolio_TXT').val();
					e.preventDefault();
		        	$('#portfolio_TXT').contents().unwrap().wrap("<a id='"+ id +"' class='btn btn-primary portfolio_btn' data-toggle='collapse' href='"+href+"' aria-expanded='false' aria-controls='collapseExample'></a>");
		        	$('#'+id).text(portfolio_nm);
		        	$('#deleteBtn'+id).show();
		        	
		        	$.ajax({
		        		url : "${cp}/blog/updatePortfolio",
		        		data : {"portfolio_nm" : portfolio_nm, "portfolio_code" : id},
		        		success : function(data) {
										
		        		}
		        	});
					
				
				}
				
			});
		});
	}
});

function deletePortfolio(code) {
	
	$.ajax({
		url : "${cp}/blog/deletePortfolio",
		data : {"portfolio_code" : code},
		success : function(data) {
			
			
			
			$("#portfolio_area"+code).remove();
		}
	});
	
}

	
	
</script>


