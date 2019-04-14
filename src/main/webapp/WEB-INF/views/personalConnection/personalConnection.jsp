<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/personalConnection/personalConnection.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	var userPage =  1;
	var corpPage = 1;


	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "/recommendUsers",
			dataType : "HTML",
			data : {"page" : userPage},
			success : function(result) {
				userPage++;
				$("#content2").append(result);
			}
		}); 
		
		
		$("#recommendUsers").click();

		 var str = $(this).attr('title');
		
		var divWidth = "511";
		$("#btnslidelt").on("click", function() {
			$("#content").stop(true, true);

			var moveX = parseInt($("#content").css("margin-left"));

			if (moveX < 0) {
				$("#content").animate({"margin-left" : "+=" + divWidth + "px"}, 500);
			}
		});

		$("#btnSlidegt").on("click", function() {
			$("#content").stop(true, true);

			var moveX = parseInt($("#content").css("margin-left"));

			if (-1022 < moveX) {
				$("#content").animate({"margin-left" : "-=" + divWidth + "px"}, 500);
			}
		});

		
		$(document).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
		
			if (maxHeight <= currentScroll) {
				 $.ajax({
					type : "POST",
					url : "/recommendUsers",
					dataType : "HTML",
					data : {"page" : userPage},
					success : function(result) {
						userPage++;
						$("#content2").append(result);
					}
				}); 
			}
		});
		
		
		$("#recommendCorpor").on("click", function() {
			if(corpPage == 1) {
				$("#content2").empty();
				
				 $.ajax({
					type : "POST",
					url : "/recommendCorpor",
					dataType : "HTML",
					data : {"page" : corpPage},
					success : function(result) {
						corpPage++;
						$("#content2").append(result);
					}
				}); 
			}
			$(document).scroll(function() {
				
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
			
				if (maxHeight <= currentScroll) {
					 $.ajax({
						type : "POST",
						url : "/recommendCorpor",
						dataType : "HTML",
						data : {"page" : corpPage},
						success : function(result) {
							corpPage++;
							$("#content2").append(result);
						}
					}); 
				}
			});
		});

	});
</script>
<div class="container">
<div class="row">
<div>
<div class="row">
			  <div id="pc_leftmenu" class="col-md-3">
			        <div id="pc_leftmenuBox" class="whiteBox">
			         	<a href="/connections">
			         		<span style="padding-right: 5px;"><i class="fas fa-user-friends"></i></span>1촌 ${connections_count }명
			         	</a>
			           <a id="pc_leftmenuBorder" href="/feedFollowing">
			           	<span><i class="fas fa-building" ></i></span>회사 (${coporations_count})개
			           </a>
			        </div>
			  </div>
				<div class="col-md-6" style="margin-right: -25px; ">
					<div class="row">
						<div class="col-md-12" >
							<div id="pc_resiceConnection" class="whiteBox">
								<label style="padding-right: 295px;">받은 일촌 신청 </label><a href="/connectionReceiveApply">모두 보기</a><br>
							</div>
						</div>
						<div class="col-md-12" style="padding: 20px 0 20px 15px; ">
							<div id="pc_find" class="whiteBox">
								<label style="padding-right: 300px;padding-top: 10px">아는 동문 찾기</label>
								<button id="btnslidelt" class="btn btn-default" style="border: 0px;margin-left: 28px;">&lt;</button>
								<button id="btnSlidegt" class="btn btn-default" style="border: 0px;">&gt;</button><br/>
								<ul  id="content" style="list-style:none;width:3000px; padding-left: 5px;">
									<c:forEach items="${schoolFriends }" var="friend">
									<c:set var="bg_addrpath" value="/background?mem_id=${friend.user_id }"/>
						            <c:set var="profile_addrpath" value="/profile?mem_id=${friend.user_id }"/> 
						            <c:choose>
						               <c:when test="${fn:contains(friend.bg_path, 'http')}">
						                  <c:set var="bg_path" value="${friend.usersVo.bg_path }"/> 
						               </c:when>
						               <c:when test="${fn:contains(friend.profile_path, 'http')}">
						                  <c:set var="profile_path" value="${friend.profile_path }"/> 
						               </c:when>
						            </c:choose>
										<li>
											<div class="whiteBox">
												<div style="background-image: url(${not empty bg_path ? bg_path : bg_addrpath});height: 70px; margin-top: -15px;"></div>
												<div style=" margin-top: -50px;">
													<div style="width: 108px;height: 108px;background-image: url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 30px;border: 4px solid #E3EEF2;border-radius: 100px;"></div>
													<div style="margin-top: 5px;"><strong>${friend.user_name}</strong></div>
													<div style="font-size: 16px;padding-left: 5px;padding-right: 5px; text-overflow: ellipsis; display: inline-block; width: 146.97px; white-space: nowrap; overflow: hidden;margin-bottom: 50px;">${friend.introduce}</div>
													<button class="btn btn-default" style="border-color: #0073b1;border-style: solid;padding-left: 40px;padding-right: 40px;">1촌 맺기</button>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-md-12 recommendClass">
							<div id="pc_find" class="whiteBox" style="width:512px;height:auto; box-sizing: content-box; ">
								<label style="font-size: 19px;">회원님을 위한 맞춤 추천</label>
								<label style="font-size: 17px;padding-top: 10px;padding-bottom: 2px;">
									<a id="recommendUsers" title="recommendUsers" style="padding: 5px 5px 5px 5px;">사람</a>
									<a id="recommendCorpor" title="recommendCorpor" style="padding: 5px 5px 5px 5px;margin-left: 20px;">회사</a>
								</label>
								<ul  id="content2" style="list-style:none;width:553px; padding-left: 0px; padding-top: 10px">
									<%-- <c:forEach items="${userList }" var="user"> 
										<li><div class="whiteBox">${user.user_name}</div></li>
									</c:forEach> --%>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2" >
					<div class="whiteBox" style="width:314px; height: 256px;">Level 2: .col-xs-4 .col-sm-6</div>
					footer
				</div>
</div>
</div>
</div>
</div>
