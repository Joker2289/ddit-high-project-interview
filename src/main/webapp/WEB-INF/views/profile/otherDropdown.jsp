<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="dropdown-menu" style="display: block; top: 425px;width: 155px; min-height: 40px; ">
	<li class="dropdownAccordion otherDropdown" style="width: 155px;">
		<a href="/profilePDF?user_id=<c:choose><c:when test="${empty param.user_id}">${SESSION_MEMBERVO.mem_id}</c:when><c:otherwise>${param.user_id}</c:otherwise></c:choose>" 
			style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-cloud-download-alt"></i></span>PDF로 저장</a>
	</li>
	
	<c:if test="${not empty user_id  && SESSION_MEMBERVO.mem_id != user_id}">
		<c:choose>
			<c:when test="${not empty personalVo.receive_accept  }">
				<li class="dropdownAccordion otherDropdown" style="width: 155px;">
					<a href="/profileDeleteConnection?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="far fa-times-circle"></i></span>일촌 끊기</a>
				</li>
			</c:when>
			<c:when test="${SESSION_MEMBERVO.mem_division eq 1 }">
				<c:choose>
					<c:when test="${empty followVo.mem_id  }">
						<li class="dropdownAccordion otherDropdown" style="width: 155px;">
							<a href="/profileInsertFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${user_id }&division=43" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-user-plus"></i></span>팔로우</a>
						</li>
					</c:when>
					<c:when test="${not empty followVo.mem_id  }">
						<li class="dropdownAccordion otherDropdown" style="width: 155px;">
							<a href="/profileDeleteFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-user-minus"></i></span>언팔로우</a>
						</li>
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${SESSION_MEMBERVO.mem_division eq 2 }">
				<c:choose>
					<c:when test="${not empty followVo.mem_id  }">
						<li class="dropdownAccordion otherDropdown" style="width: 155px;">
							<a href="/profileDeleteFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-user-minus"></i></span>언팔로우</a>
						</li>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		
		<%-- <c:if test="${not empty personalVo.receive_accept  }">
			<li class="dropdownAccordion otherDropdown" style="width: 155px;">
				<a href="/profileDeleteConnection?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="far fa-times-circle"></i></span>일촌 끊기</a>
			</li>
		</c:if>
		<c:if test="${empty followVo.mem_id  }">
			<li class="dropdownAccordion otherDropdown" style="width: 155px;">
				<a href="/profileInsertFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${user_id }&division=43" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-user-plus"></i></span>팔로우</a>
			</li>
		</c:if>
		<c:if test="${not empty followVo.mem_id  }">
			<li class="dropdownAccordion otherDropdown" style="width: 155px;">
				<a href="/profileDeleteFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${user_id }" style="padding: 0 15px 0 0; width: 140px;"><span style="font-size: 24px;"><i class="fas fa-user-minus"></i></span>언팔로우</a>
			</li>
		</c:if> --%>
	</c:if>
	
		
	
	
</ul>