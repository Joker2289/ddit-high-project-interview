<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>



<table>
	<tr>
		<td>
			<button class="color" style="background-color: #9C9C9C;" onclick="portfoio_color_change(${ portfolio_code }, '#9C9C9C');"></button>
			<button class="color" style="background-color: #EC6B51;" onclick="portfoio_color_change(${ portfolio_code }, '#EC6B51');"></button>
			<button class="color" style="background-color: #F2AD61;" onclick="portfoio_color_change(${ portfolio_code }, '#F2AD61');"></button>
			<button class="color" style="background-color: #F8D549;" onclick="portfoio_color_change(${ portfolio_code }, '#F8D549');"></button>
			<button class="color" style="background-color: #A5D178;" onclick="portfoio_color_change(${ portfolio_code }, '#A5D178');"></button>
			<button class="color" style="background-color: #53B67C;" onclick="portfoio_color_change(${ portfolio_code }, '#53B67C');"></button>
			<button class="color" style="background-color: #56BCB4;" onclick="portfoio_color_change(${ portfolio_code }, '#56BCB4');"></button>
			<button class="color" style="background-color: #5ECAFA;" onclick="portfoio_color_change(${ portfolio_code }, '#5ECAFA');"></button>
			<button class="color" style="background-color: #4293E2;" onclick="portfoio_color_change(${ portfolio_code }, '#4293E2');"></button>
			<button class="color" style="background-color: #8344B2;" onclick="portfoio_color_change(${ portfolio_code }, '#8344B2');"></button>
			<button class="color" style="background-color: #ED70A6;" onclick="portfoio_color_change(${ portfolio_code }, '#ED70A6');"></button>
			                                                                                                           
			<button class="color" style="background-color: #8344B2;" onclick="portfoio_color_change(${ portfolio_code }, '#8344B2');"></button>
			<button class="color" style="background-color: #E9348A;" onclick="portfoio_color_change(${ portfolio_code }, '#E9348A');"></button>
			<button class="color" style="background-color: #51B1EC;" onclick="portfoio_color_change(${ portfolio_code }, '#51B1EC');"></button>
			<button class="color" style="background-color: #EA332A;" onclick="portfoio_color_change(${ portfolio_code }, '#EA332A');"></button>
			<button class="color" style="background-color: #70B536;" onclick="portfoio_color_change(${ portfolio_code }, '#70B536');"></button>
		</td>
	<tr>
</table>


<script>

function portfoio_color_change(code, color){
	
	$.ajax({
		url : "${cp}/blog/portfoio_color_change",
		data : {"user_id" : user_id, "portfolio_code" : code, "color_code" : color },
		success : function(data) {

			console.log(data);
			
			$("#portfolio_form").html(data);
			
			/* 포트폴리오 메뉴 갱신 */
			showPortfolio(user_id);
		}
	});
}


</script>