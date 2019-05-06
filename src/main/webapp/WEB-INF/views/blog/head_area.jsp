<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<div class="jumbotron">
	<c:if test="${ bVo.name_act == 'y' }">
		<div class="head_title"><h1>${ bVo.blog_name }</h1></div>
	</c:if>
</div>


<script>
	blogSetting();

	/* 블로그 설정 */
	function blogSetting() {

		if ('${ bVo.img_act }' == 'n') {
			var color = '${ bVo.cover_color }';
			$('.jumbotron').css('background-color', color);
		}

		if( '${ bVo.img_act }' == 'y'){
			$('.jumbotron').css('background-image', 'url(/view/imageView?mem_id=${bVo.user_id}&division=cover_img)');	
		} 
	}
</script>



