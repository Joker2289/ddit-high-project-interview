<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
</script>
<div class="container">
<div class="row">
<div>
<div class="row">
	
	<div id="pc_leftmenu" class="col-md-8" style="padding-left: 0px;margin-left: 30px;">
		<div class="whiteBox" style="width: 796px;padding-left: 15px;padding-bottom: 15px;padding-top: 20px;margin-top: 28px;">
			<label style="font-size: 19px;">1촌 ${connections_count }명</label>
			<div class="row" style="padding-left: 15px;">
				<label style="display:inline">정렬기준:</label>
					<select id="sortSelectBox" style="border-style: hidden; display:inline;width: 106px;" class="form-control" onchange="location.href='/connections?sort='+this.value">
						<option value="new">최근순</option>
						<option value="name">이름</option>
					</select>
					<input style="display:inline;width: 170px;margin-left: 305px;" type="text" class="form-control" id="searchName" placeholder="이름으로 검색">
					<a href="/filterSearch" style="padding-left: 20px; font-size: 15px; color: blue">필터로 검색</a>
			</div>
			<div class="row" style="padding-left: 15px;">
				<table class="table table-hover connectTable">
  					<tbody class="col-md-12" style="top: 22px;">
  					
  					<c:choose>
  						<c:when test="${fn:length(personalList) eq 0 }">
  							<label style="font-size: 18px;padding-left: 350px;padding-top: 50px;">1촌 없음</label>
  						</c:when>
  						<c:otherwise>
		  					<c:forEach items="${personalList }" var="users">
		  					<c:set var="profile_addrpath" value="/profile?mem_id=${users.user_id }"/> 
		  					<c:choose>
		  						<c:when test="${fn:contains(users.profile_path, 'http')}">
		  							<c:set var="profile_path" value="${users.profile_path }"/> 
		  						</c:when>
		  					</c:choose>
		  						<!-- 일촌 리스트 조회 -->
		  						<tr class="usersTr" data-user_id=${users.user_id }>
			  						<td>
				               			<a href="/profileHome?user_id=${users.user_id }"><div style="width: 88px;height: 88px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 20px;border: 4px solid #E3EEF2;border-radius: 100px;"></div></a>
			  						</td>
			  						<td style="vertical-align: middle;width: 446px;">
			  							<a href="/profileHome?user_id=${users.user_id }"><div class="tableUserName">${users.user_name }</div></a>
			  							<a href="/profileHome?user_id=${users.user_id }"><div class="row" style="margin-left: 0px;">${users.introduce }</div></a>
			  						</td>
			  						<td style="width:100px; vertical-align: middle;"><button class="btn btn-default">메일보내기</button> </td>
			  						<td style="vertical-align: middle;">
				  						<button class="btn btn-default trashBtn Off" style="border-style: hidden;">
				  							<i class="fas fa-ellipsis-h"></i>
				  						</button> 
				  						<div class="whiteBox dropBox" onclick="location.href='/connectionOff?user_id=${users.user_id}&receive_id=${SESSION_MEMBERVO.mem_id}&sort=${param.sort }'" style="position: absolute; z-index:1000; list-style: none; padding:6px; min-width: 68px; margin: 0 0 0 0;">
			  								<i  class="far fa-trash-alt"></i>일촌 끊기
			  							</div>
			  						</td>
		  						</tr>
		  					</c:forEach>
	  					</c:otherwise>
  					</c:choose>
  					
  					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>


<script type="text/javascript">

$(".dropBox").hide();	

var param = "${param.sort}";

$("#sortSelectBox").val(param);

// 버튼 클릭 시 드롭박스 보이기
$(".trashBtn").on("click",function(){
	if($(this).hasClass("trashBtn Off")){
		//드롭박스 숨김
		$(".dropBox").hide();
		$(this).next().show();
		$(this).attr('class','btn btn-default trashBtn On');
	}else {
		$(this).next().hide();
		$(this).attr('class','btn btn-default trashBtn Off');
	}
	
	
});

$("#searchName").keyup(function() {
       var k = $(this).val();
       $(".connectTable > tbody > tr").hide();
       $(".tableUserName:contains('" + k + "')").parents("tr").show();
});


</script>
