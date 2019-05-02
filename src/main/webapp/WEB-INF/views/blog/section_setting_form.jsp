<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<button class="btn btn-primary addSectionBtn"
	onclick="addSection('${ portfolio_code }');">
	<i class="far fas fa-plus"></i> 섹션 추가
</button>

<c:forEach items="${ sectionList }" var="section">
	<div id="section_area${ section.section_code }">

		<a id="section${ section.section_code }"
			class="btn sectionBtn" 
			ondblclick="updateSection('${ section.section_code }');">${ section.section_name }</a>


		<button id="sectionDeleteBtn${ section.section_code }"
			class="btn sectionDeleteBtn"
			onclick="deleteSection(${ section.section_code });">
			<i class="fas fa-times"></i>
		</button>

	</div>
</c:forEach>

<script>

<c:forEach items="${ sectionList }" var="section">
	$('#section${ section.section_code }').css('background-color', '${ color }');
</c:forEach>

var user_id = '${ user_id }'

var portfolio_code = '${ portfolio_code }';

/* 섹션 추가 */
function addSection(portfolio_codem){

	$.ajax({
		url : "${cp}/blog/addSection",
		data : {"portfolio_code" : portfolio_code},
		success : function(data) {
			
			$('#section_All'+portfolio_code).html(data);
			
		}
	});
}

/* 섹션 이름 수정 */
function updateSection(section_code){
	
	var tmp_nm = $('#section'+section_code).text();
	$('#section'+section_code).contents().unwrap().wrap("<input id='section_TXT' type='text' class='form-control section_TXT'>");
	$('#section_TXT').val(tmp_nm);
	$('#section_TXT').focus();
	$('#sectionDeleteBtn'+section_code).hide();
	
	$('#section_TXT').on('keypress', function(e){
		
		if(e.keyCode == 13){
			var section_nm = $('#section_TXT').val();
			
        	$.ajax({
        		url : "${cp}/blog/updateSection",
        		data : {"section_nm" : section_nm, "section_code" : section_code, "portfolio_code" : portfolio_code, },
        		success : function(data) {
								
        			$('#section_All' + portfolio_code).html(data);
                	
        		}
        	});
		}
	});
} 

/* 섹션 삭제 */
function deleteSection(section_code) {
	
	var result = confirm("삭제 하시겠습니까? (저장된 섹션, 페이지 데이터까지 영구삭제 됩니다)");
	
	if(result){
		$.ajax({
			url : "${cp}/blog/deleteSection",
			data : {"section_code" : section_code, "user_id" : user_id },
			success : function(data) {
				//프로필 총 페이지수 업데이트
				$('#page_cnt').text(data);
				
				//섹션 삭제
				$("#section_area"+section_code).remove();
			}
		});
	}
}




</script>





