<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${hashTagList}" var="hashTag">
	<div style="width: 225px;">
		<div class="corporation" style="text-align: center;padding-top: 90px; padding-left: 0px;" >
			<div
				<%-- style="width: 59px;height: 59px;background-image:url(/profile?mem_id=${});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;"--%>>
			</div>
			<div>
				<label style="font-size: 23px;">${hashTag.ref_keyword}</label>
			</div>
		</div>
		<div>
			<button class="btn btn-default followingBtn follow" title="${hashTag.follow_code}">
				<i class="fas fa-check"></i> 팔로우 중
			</button>
		</div>
	</div>
</c:forEach>
<script type="text/javascript">
$(".follow").on("click", function(){
	var followStr = $(this).attr('title');
	
	if(!$(this).hasClass('Out')){
		
		$(this).html('<i class="fas fa-plus-circle"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else{
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
		
	}
});
</script>