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
					href="/profileHome?user_id=${uVo.user_id}">${ uVo.user_name }</a></span>


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

				<c:if test='${ uVo.user_id == SESSION_MEMBERVO.mem_id }'>
					<button id="settingBtn" class="btn btn-primary settingBtn">Blog 설정</button>
				</c:if>
				
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
			$("#content_area").html(data);						
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
	
	var result = confirm("삭제 하시겠습니까? (저장된 섹션, 페이지 데이터까지 영구삭제 됩니다)");
	
	if(result){
		$.ajax({
			url : "${cp}/blog/deletePortfolio",
			data : {"portfolio_code" : code},
			success : function(data) {
				
				
				
				$("#portfolio_area"+code).remove();
			}
		});
	}
	
}

	
	
</script>


