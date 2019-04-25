<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<c:forEach items="${ sectionList }" var="section">

	<button id="section_${ section.section_code }" type="button" class="btn btn-default section" onclick="sectionClick('${ section.section_code }', '${ color }');">
    	${ section.section_name }
  	</button>
	
	
</c:forEach>

<script>

<c:forEach items="${ sectionList }" var="section">

	//포트폴리오 인덱스 컬러와 같이 셋팅
	$('#section_${ section.section_code }').css('background-color', '${ color }');
</c:forEach>

function sectionClick(section_code, color){
	
	console.log(section_code);
	console.log(color);
	
	$.ajax({
		url : "${cp}/blog/content_area",
		success : function(data) {
			
			$('#content_area').html(data);	
			
			$.ajax({
				url : "${cp}/blog/page_area_select",
				data : { "section_code" : section_code, "color" : color },
				success : function(data) {
					
					$('#page_area').html(data);	
					
				}
			});
			
		}
	});
	
}


</script>


