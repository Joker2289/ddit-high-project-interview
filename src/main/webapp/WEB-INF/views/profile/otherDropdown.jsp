<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="dropdown-menu" style="display: block; top: 425px;width: 155px; min-height: 40px; ">
	<li class="dropdownAccordion otherDropdown" style="width: 155px;">
		<a href="/profilePDF?user_id=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-cloud-download-alt"></i></span>PDF로 저장</a>
	</li>
	<c:if test="${not empty user_id  }">
		<c:if test="${not empty personalVo.receive_accept  }">
			<li class="dropdownAccordion otherDropdown" style="width: 155px;">
				<a href="/profileDeleteConnection?user_id=${SESSION_DETAILVO.user_id}&receive_id=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="far fa-times-circle"></i></span>일촌 끊기</a>
			</li>
		</c:if>
	</c:if>
</ul>