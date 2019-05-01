<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




<h2 class="setting_title"> <i class="fas fa-tasks"></i> 포트폴리오 설정 </h2>

<button id="addPortfolioBtn" class="btn btn-primary addPortfolioBtn"> <i class="far fas fa-plus"></i> 포트폴리오 추가</button>

<div id="portfolio_All">

	<c:forEach items="${ portfolioList }" var="portfolio">
		<div id="portfolio_area${ portfolio.portfolio_code }">
		
			

			<button id="colorBtn${ portfolio.portfolio_code }" type="button" class="btn colorBtn" data-container="body"
				data-toggle="popover" data-placement="top"
				data-content=" " data-trigger="focus" onclick="showColor(${ portfolio.portfolio_code });">
			<i class="fas fa-tint"></i>
			</button>

			<a id="${ portfolio.portfolio_code }" class="btn portfolioBtn" data-toggle="collapse"
			href="#section_collapse${ portfolio.portfolio_code }" aria-expanded="false"
			aria-controls="collapseExample" onclick="showSection('${ portfolio.portfolio_code }', '${ portfolio.index_color }');" ondblclick="updatePortfolio(${ portfolio.portfolio_code });">${ portfolio.portfolio_name }</a>
			
			
			<button id="deleteBtn${ portfolio.portfolio_code }" class="btn deleteBtn" onclick="deletePortfolio(${ portfolio.portfolio_code });"><i class="fas fa-times"></i></button>


			<div class="collapse" id="section_collapse${ portfolio.portfolio_code }" >
				<div class="well section_All" id="section_All${ portfolio.portfolio_code }">
				
					
				
				</div>
			</div>
		</div>
	</c:forEach>
	
</div>





<script>

/* 컬러버튼 팝오버 설정 */
<c:forEach items="${ portfolioList }" var="portfolio">

	var code = '${ portfolio.portfolio_code }';
	$('#colorBtn'+code).popover('enable');
	
	$('#${ portfolio.portfolio_code }').css('background-color', '${ portfolio.index_color }');
	$('#colorBtn${ portfolio.portfolio_code }').css('background-color', '${ portfolio.index_color }');
	
	
</c:forEach>

/* 컬러리스트 팝오버 */
function showColor(code){
	
	$.ajax({
		url : "${cp}/blog/color_menu",
		data : {'portfolio_code' : code},
		success : function(data) {
			
			$('.popover-content').html(data);	
		}
	});
}


/* 포트폴리오 설정 영역 */
var user_id = '${ user_id }';

/* 포트폴리오 추가 */
$('#addPortfolioBtn').on('click', function(){
	$('.popover').css('width', '300px !important;');
	
	$.ajax({
		url : "${cp}/blog/addPortfolio",
		data : {"user_id" : user_id },
		success : function(data) {

			
			$("#portfolio_form").html(data);
			
			/* 포트폴리오 메뉴 갱신 */
			showPortfolio(user_id);
		}
	});

});

/* 포트폴리오 이름 수정 */
function updatePortfolio(code){
	
	var tmp_nm = $('#'+code).text();
	$('#'+code).contents().unwrap().wrap("<input id='portfolio_TXT' type='text' class='form-control portfolio_TXT'>");
	$('#portfolio_TXT').val(tmp_nm);
	$('#portfolio_TXT').focus();
	$('#deleteBtn'+code).hide();
	$('#colorBtn'+code).hide();
	
	$('#portfolio_TXT').on('keypress', function(e){
		
		if(e.keyCode == 13){
			var portfolio_nm = $('#portfolio_TXT').val();
			
        	$.ajax({
        		url : "${cp}/blog/updatePortfolio",
        		data : {"portfolio_nm" : portfolio_nm, "portfolio_code" : code, "user_id" : user_id},
        		success : function(data) {
								
        			$("#portfolio_form").html(data);
        			
        			/* 포트폴리오 메뉴 갱신 */
        			showPortfolio(user_id);
                	
        		}
        	});
		}
	});
} 

/* 포트폴리오 삭제 */
function deletePortfolio(code) {
	
	var result = confirm("삭제 하시겠습니까? (저장된 섹션, 페이지 데이터까지 영구삭제 됩니다)");
	
	if(result){
		$.ajax({
			url : "${cp}/blog/deletePortfolio",
			data : {"portfolio_code" : code, "user_id" : user_id},
			success : function(data) {
				
				$("#portfolio_form").html(data);
				
				/* 포트폴리오 메뉴 갱신 */
				showPortfolio(user_id);
			}
		});
	}
}

/* 섹션 */
function showSection(code, color){
	
	$.ajax({
		url : "${cp}/blog/sectionSettingForm",
		data : {"portfolio_code" : code, "user_id" : user_id, "color" : color},
		success : function(data) {
			
			$('#section_All'+code).html(data);
			
		}
	});	
}

/* 포트폴리오 */
function showPortfolio(user_id){
	$.ajax({
		url : "${cp}/blog/showPortfolio",
		data : {"user_id" : user_id },
		success : function(data) {
	
			$("#portfolio_area").html(data);						
		}
	});	
}

/* 프로필 area의 추천수 업데이트 */
<c:if test="${ pageCnt != null }">
	var pageCnt = '${ pageCnt }';
	$('#page_cnt').text(pageCnt);
</c:if>


	
	
</script>


