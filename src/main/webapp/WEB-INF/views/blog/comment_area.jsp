<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<div class="comment_area">
	<div class="comment_head_div">
		<c:choose>
	        <c:when test="${ SESSION_MEMBERVO.mem_division eq 1 }">
	          <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
	        </c:when>
	        <c:when test="${ SESSION_MEMBERVO.mem_division eq 2 }">
	        	<c:if test="${ fn:contains(SESSION_DETAILVO.logo_path, 'http') } }">
	        		 <img src="${ SESSION_DETAILVO.logo_path }" alt="..." class="img-circle comment_profile_img">
	        	</c:if>
	        	<c:if test="${ !fn:contains(SESSION_DETAILVO.logo_path, 'http') } }">
	        		 <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
	        	</c:if>
	        </c:when>
	    </c:choose>
	    
	    <div class="textarea_div">
	    	<input type="text" class="form-control comment_TXT" placeholder="댓글입력">
	    	<button class="btn btn-primary comment_btn">작성</button>
		</div>
	</div>
	
	
</div>


<script>

	



</script>














