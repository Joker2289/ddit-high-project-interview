<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>	
	




<div class="container">
	<div class="row">
		<div class="corp_img_div">
				
				<!-- 회사 배경 이미지 -->
				<c:choose>
					<c:when test="${ fn:contains( corporationInfo.bg_path, 'http') }">
						<img src="${ corporationInfo.bg_path }" width="1138px" height="170px" style="border-radius: 4px;"></img>				
					</c:when>				
					<c:otherwise>		
						<c:if test="${ corporationInfo.bg_path != null }">
							<img src="/corp/ImageView?path=${ corporationInfo.bg_path }" width="1138px" height="170px" style="border-radius: 4px;"></img>
						</c:if>
						<c:if test="${ corporationInfo.bg_path == null }">
							<img src="http://cfile227.uf.daum.net/image/24553C485321108E1AAC15" width="1138px" height="170px" style="border-radius: 4px;"></img>
						</c:if>
					</c:otherwise>
				</c:choose>
				
				<!-- 회사 로고 div -->
				<div class="logo_div">
					<c:choose>
						<c:when test="${ fn:contains( corporationInfo.logo_path, 'http') }">
							<img src="${corporationInfo.logo_path}"  height="103" width="170" style="border-radius: 4px; background-color: #fff;"/>
						</c:when>	
					
						<c:otherwise>
							<c:if test="${ corporationInfo.logo_path != null }">
								<img src="/corp/ImageView?path=${ corporationInfo.logo_path }" height="103" width="170" style="border-radius: 4px; background-color: #fff;"></img>
							</c:if>
							<c:if test="${ corporationInfo.logo_path == null }">
								<img src="/images/corporation/basic/basicCorporation.png" height="103" width="170" style="border-radius: 4px; background-color: #fff;"></img>
							</c:if>
						</c:otherwise>	
					</c:choose>
				</div>
			    
		</div>
	</div>  
</div>


<div class="corp_info_div">

	<div class="corp_info"> 
	
		<label class="corp_name_lbl"> ${ corporationInfo.corp_name } </label> 
		<label class="corp_type_lbl"> ${ corporationInfo.corp_type } </label>
		<c:if test="${ SESSION_MEMBERVO.mem_id eq corporationInfo.corp_id }">
			<a class="btn btn-primary camera" onclick="logo_img_click();"><i class="fas fa-camera"></i></a>	<!-- 로고변경 버튼 -->	
			<div class="hidden_btn_div">
					<a class="btn btn-primary camera" onclick="bg_img_click();"><i class="fas fa-camera"></i></a> <!-- 배경변경 버튼 -->
			</div>
		</c:if>
			
		<br>
		<label class="corp_lbl">${ corporationInfo.addr1 } ${ corporationInfo.addr2 }</label> 
		<br>
		<label class="corp_lbl"> ${corporationInfo.corp_profile } </label>
		
	</div>
	
	<div class="corp_btn_div">
		<c:if test="${ SESSION_MEMBERVO.mem_id != corporationInfo.corp_id }">
			<c:if test="${ followInfo == null }">
				<button class="btn btn-primary corp_follow_btn" onclick="corporation_follow('${ SESSION_MEMBERVO.mem_id}', '${ corporationInfo.corp_id }');"><i class="fas fa-plus"></i> 팔로우</button>
			</c:if>
			<c:if test="${ followInfo != null }">
				<button class="btn btn-primary corp_unfollow_btn" onclick="corporation_unfollow('${ SESSION_MEMBERVO.mem_id}', '${ corporationInfo.corp_id }');">팔로우 취소</button>
			</c:if>
			
			<!-- 회원에게만 기업리뷰 버튼이 보여야함 -->
			<c:if test="${ SESSION_MEMBERVO.mem_division == '1' }">
				<button class="btn btn-primary corp_review_btn" onclick="location.href='/companyReview?corp_id=${ corporationInfo.corp_id }'"><strong>기업 리뷰</strong></button>
			</c:if>
		</c:if>
		
	</div>
	
</div>

<!-- enctype = "multipart/form-data" -->
<!------------------------------------------- 이미지 업로드 ---------------------------------------------------------->
<form id="logo_img_form" method="post" action="/serverInfoUpload.do">
    <input type="file" name="img_form" id="lg_img" onchange="logo_img_update();" style="display: none;">
    <input type="text" name="corp_id" value="${ corporationInfo.corp_id }" style="display: none;">
    <input type="text" name="division" value="logo" style="display: none;">
</form>

<form id="bg_img_form" method="post" action="/serverInfoUpload.do" enctype = "multipart/form-data">
    <input type="file" name="img_form" id="bg_img" onchange="bg_img_update();" style="display: none;">
    <input type="text" name="corp_id" value="${ corporationInfo.corp_id }" style="display: none;">
    <input type="text" name="division" value="bg" style="display: none;">
</form>






<script>

var corp_id = '${ corporationInfo.corp_id }';

/* 로고 수정 버튼 클릭 */
function logo_img_click() {
	$('#lg_img').click();
}

/* 배경 수정 버튼 클릭 */
function bg_img_click() {
	$('#bg_img').click();
}

/* 로고 수정 */
function logo_img_update(){
	
	var form = $("#logo_img_form")[0];
	var formData = new FormData(form);

	/* 이미지 저장 */
	$.ajax({
		
		url : "/corp/imageUpload",
		enctype: 'multipart/form-data',
		method : "post",
		data : formData,
		processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,

		success : function(data){
			
			/* top 페이지 다시 뿌리기 */
			$.ajax({
				url : "/corp/retun_toparea",
				data : {"corp_id" : corp_id },
				success : function(data) {
					
					$('#top_area').html(data);
				}
			});
			
		}
	});
}

/* 배경 수정 */
function bg_img_update(){
	
	var form = $("#bg_img_form")[0];
	var formData = new FormData(form);

	/* 이미지 저장 */
	$.ajax({
		
		url : "/corp/imageUpload",
		enctype: 'multipart/form-data',
		method : "post",
		data : formData,
		processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,

		success : function(data){
			
			/* top 페이지 다시 뿌리기 */
			$.ajax({
				url : "/corp/retun_toparea",
				data : {"corp_id" : corp_id },
				success : function(data) {
					
					$('#top_area').html(data);
				}
			});
			
		}
	});
}




/* 회사 팔로우 버튼 클릭 */
function corporation_follow(mem_id, ref_keyword) {
	
	$.ajax({
		url : "/corp/corporation_follow",
		data : {"mem_id" : mem_id, "ref_keyword" : ref_keyword },
		success : function(data) {
			
			$('#top_area').html(data);
		}
	});
	
}	

/* 회사 언팔로우 버튼 클릭 */
function corporation_unfollow(mem_id, ref_keyword) {
	
	$.ajax({
		url : "/corp/corporation_unfollow",
		data : {"mem_id" : mem_id, "ref_keyword" : ref_keyword },
		success : function(data) {
			
			$('#top_area').html(data);
		}
	});
	
}	

</script>



 	





