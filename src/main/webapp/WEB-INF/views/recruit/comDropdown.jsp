<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<ul class="dropdown-menu" style="display: block; top: 218px; left: 36px; width: 511px; font-size: 18px;" >
	<c:choose>
		<c:when test="${corpList.size() == 0 }">
			<li style="height: 40px;">
				<a data-toggle="collapse" aria-expanded="false" style="padding-left: 5px; padding-right: 5px;
						font-size: 18px;" id="a_check">
					검색 결과가 없습니다.
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<c:forEach begin="1" end="${corpList.size() }" varStatus="i">
				<li style="height: 40px;">
					<c:choose>
						<c:when test="${ fn:contains(corpList.get(i.index - 1).logo_path, 'http') }">
							<c:set var="img_src" value="${corpList.get(i.index - 1).logo_path }"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="img_src" value="${pageContext.request.contextPath  }/view/imageView?mem_id=${corpList.get(i.index - 1).corp_id }&division=pf"></c:set>
						</c:otherwise>	
					</c:choose>						
					<a data-toggle="collapse" aria-expanded="false" style="padding-left: 5px; padding-right: 5px;"
							id="a_check" data-name="${corpList.get(i.index - 1).corp_name }"
							data-src="${img_src }" class="list_item"
							data-corp_id="${corpList.get(i.index - 1).corp_id }">
								<img height="40" src="${img_src }">
						<span style="margin-left: 10px;">
							${fmtNmList.get(i.index - 1) }
						</span>
					</a>
				</li>
				<li class="divider"></li>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</ul>

<input type="hidden" id="hidden_size" name="hidden_size" value="${corpList.size() }">

<script type="text/javascript">
$("#a_check").on("click", function(){
// 	alert($("#hidden_size").val());
});



</script>