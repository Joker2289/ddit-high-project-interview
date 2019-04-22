<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<c:choose>
	<c:when test="${ bVo.img_act == 'y' }">
		<c:set var="bg_path" value="${ usersMap.usersVo.bg_path }" />
	</c:when>
	<c:when test="${ bVo.img_act == 'n'}">
		<div class="jumbotron">
			<c:if test="${ bVo.name_act == 'y' }">
				<h1 class="head_title">${ bVo.blog_name }</h1>
			</c:if>
		</div>
	</c:when>
</c:choose>

<script>

/* 블로그 설정 */
function blogSetting(){
	
	var color = '${ bVo.cover_color }';
	$('.jumbotron').css('background-color', color);
	
}

blogSetting();

</script>



