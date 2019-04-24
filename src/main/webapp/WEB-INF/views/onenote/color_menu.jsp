<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<table>
	<tr>
		<td>
			<button class="color" style="background-color: #9C9C9C;" onclick="stage_color_change('#9C9C9C');"></button>
			<button class="color" style="background-color: #EC6B51;" onclick="stage_color_change('#EC6B51');"></button>
			<button class="color" style="background-color: #F2AD61;" onclick="stage_color_change('#F2AD61');"></button>
			<button class="color" style="background-color: #F8D549;" onclick="stage_color_change('#F8D549');"></button>
			<button class="color" style="background-color: #A5D178;" onclick="stage_color_change('#A5D178');"></button>
			<button class="color" style="background-color: #53B67C;" onclick="stage_color_change('#53B67C');"></button>
			<button class="color" style="background-color: #56BCB4;" onclick="stage_color_change('#56BCB4');"></button>
			<button class="color" style="background-color: #5ECAFA;" onclick="stage_color_change('#5ECAFA');"></button>
			<button class="color" style="background-color: #4293E2;" onclick="stage_color_change('#4293E2');"></button>
			<button class="color" style="background-color: #8344B2;" onclick="stage_color_change('#8344B2');"></button>
			<button class="color" style="background-color: #ED70A6;" onclick="stage_color_change('#ED70A6');"></button>
			                                                                                     
			<button class="color" style="background-color: #8344B2;" onclick="stage_color_change('#8344B2');"></button>
			<button class="color" style="background-color: #E9348A;" onclick="stage_color_change('#E9348A');"></button>
			<button class="color" style="background-color: #51B1EC;" onclick="stage_color_change('#51B1EC');"></button>
			<button class="color" style="background-color: #EA332A;" onclick="stage_color_change('#EA332A');"></button>
			<button class="color" style="background-color: #70B536;" onclick="stage_color_change('#70B536');"></button>
		</td>
	<tr>
</table>


<script>

function stage_color_change(color){
	
	$('#container').css('background-color', color);
}


</script>


