<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>





<div class="col-md-6">
	<div class="panel panel-default">

		<div id="page_area_select_head" class="panel-body page_area_select_head">
			<div class="page_area_title"><a><i class="far fa-folder-open" style="font-size: 40px; margin-right:10px"></i>  <i class="fas fa-chevron-right"></i> ${ pVo.portfolio_name } <i class="fas fa-chevron-right"></i> ${ sVo.section_name }</a></div>
		
		
			<c:if test='${ pVo.user_id == SESSION_MEMBERVO.mem_id }'>
				<button id="addPageBtn" class="btn addPage">Page 작성</button>
			</c:if>
		</div>
		
		
		
	</div>
</div>


<script>
$('#page_area_select_head').css('background-color', '${ pVo.index_color }');

</script>
















