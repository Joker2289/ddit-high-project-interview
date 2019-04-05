<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
</script>
<div class="container">
<div class="row">
<div style="margin-top: 101px;">
<div class="row">
	
	<div id="pc_leftmenu" class="col-md-8" style="padding-left: 0px;margin-left: 30px;">
		<div class="whiteBox" style="width: 796px;padding-left: 15px;padding-bottom: 15px;padding-top: 20px;">
			<label style="font-size: 19px;">1촌 ${connections_count }명</label>
			<div class="row" style="padding-left: 15px;">	
				<label style="display:inline">정렬기준:</label>
					<select style="border-style: hidden; display:inline;width: 106px;" class="form-control">
						<option>최근순</option>
						<option>이름</option>
						<option>성</option>
					</select>
					<input style="display:inline;width: 170px;margin-left: 305px;" type="text" class="form-control" id="" placeholder="이름으로 검색">
					<a href="/filterSearch" style="padding-left: 20px; font-size: 15px; color: blue">필터로 검색</a>
			</div>
			<div class="row" style="padding-left: 15px;">
				<table class="table table-hover">
  					<tbody class="col-md-12" style="top: 22px;">
  					
  					<c:forEach items="${personalList }" var="users">
  					
  						<!-- 일촌 리스트 조회 -->
  						<tr class=usersTr data-user_id=${users.user_id }>
	  						<td>
		               			<div style="width: 88px;height: 88px;background-image:url(/profile?mem_id=${users.user_id });background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 20px;border: 4px solid #E3EEF2;border-radius: 100px;"></div>
	  						</td>
	  						<td style="vertical-align: middle;width: 446px;">
	  							<div>${users.user_name }</div>
	  							<div class="row" style="margin-left: 0px;">${users.introduce }</div>
	  						</td>
	  						<td style="width:100px; vertical-align: middle;"><button class="btn btn-default">메일보내기</button> </td>
	  						<td style="vertical-align: middle;"><button class="btn btn-default" style="border-style: hidden;"><i class="fas fa-ellipsis-h"></i></button> </td>
  						
  						</tr>
  					</c:forEach>
  					
  					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
