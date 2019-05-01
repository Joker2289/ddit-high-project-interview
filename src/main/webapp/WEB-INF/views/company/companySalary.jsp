<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container">
<div class="row">
<div>
<div class="row">

	<div class="col-md-10" style="padding-left: 0px;margin-left: 30px;top: -49px;">
	<c:set var="bg_addrpath" value="/background?mem_id=${corporationInfo.corp_id }"/>
	<c:set var="profile_addrpath" value="/profile?mem_id=${corporationInfo.corp_id }"/>
	 <c:if test="${fn:contains(corporationInfo.bg_path, 'http')}">
      <c:set var="bg_path" value="${corporationInfo.bg_path }"/> 
   	 </c:if>
   	 <c:if test="${fn:contains(corporationInfo.logo_path, 'http')}">
		<c:set var="profile_path" value="${corporationInfo.logo_path }" />
	</c:if>
		<div class="whiteBox" style="background-image:url(${not empty bg_path ? bg_path : bg_addrpath});display: flex;width: 920px;margin-top: 29px;border-color: white;border-radius: 0px;height: 172px;box-shadow: 0 0px 0px rgba(0, 0, 0, .175);">
			<div
				style="width: 120px;height:80px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: 120px;background-position: center;margin: 45px 0 12px 40px;"
			>
			</div>
		</div>
	</div>

</div>
</div>
</div>
</div>