<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




	
<c:forEach items="${ sectionList }" var="section">

	<button id="${ section.section_code }" type="button" class="btn btn-default section" onclick="sectionClick(${ section.section_code });">
    	${ section.section_name }
  	</button>
	
	
</c:forEach>







<script>


function sectionClick(section_code){
	
	console.log('제발...');
	
}


</script>


