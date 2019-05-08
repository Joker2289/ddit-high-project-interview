<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/personalConnection/personalConnection.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	////////////////////////////newList
	
	// div_newList 마우스오버 시 false - 슬라이드 멈춤.
	var newSlide_flag = true;	
	
	// 자동 슬라이드
	var newSlide_width = 290;
	var newList_num = 1;
	
	function fn_newSlide(){
		if(newSlide_flag == false){
			return;
		}
		
		if(newList_num > 6){
	//			clearInterval(slide_switch);
			$("#content_newList").css("margin-left", "0px");
			newList_num = 0;
		}
		
		newList_num++;
		
		$("#content_newList").stop(true, true);
		var moveX = parseInt($("#content_newList").css("margin-left"));
		
		if( moveX > -2000 ){
			// 버튼 class 바꾸기.
			if(newList_num == 1){
				$(".fa-circle:eq(6)").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}else{
				$(".fa-circle:eq("+ (newList_num-2) +")").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}
			
			$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
		}
	}	
	
	//////////////////////////// newList


	var userPage =  1;
	var corpPage = 1;
	var scrollIng = 'u';


	$(document).ready(function() {
		/* $.ajax({
			type : "POST",
			url : "/recommendUsers",
			dataType : "HTML",
			data : {"page" : userPage},
			success : function(result) {
				userPage++;
				$("#content2").append(result);
			}
		}); */
		
		
		//////////////////////////// newList
		// newList 슬라이드
		newList_slide = setInterval("fn_newSlide()", 4000);
		
		// newList 마우스오버 - 슬라이드 멈춤.
		$("#div_newList").on("mouseover", function(){
			newSlide_flag = false;
		});
		$("#div_newList").on("mouseout", function(){
			newSlide_flag = true;
		});		
		
		// newList 슬라이드 버튼 클릭.
		$(".fa-circle").on("click", function(){
// 			alert($(this).index());
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "far fa-circle");
			$(this).attr("class", "fas fa-circle");	
			
			// 이동할 칸 수. (move_page)
			var move_page = ($(this).index()) - (newList_num-1);
			
			// newList_num 변경.
			newList_num = ($(this).index())+1;
			
			// 슬라이드 이동.
			$("#content_newList").stop(true, true);
			var moveX = parseInt($("#content_newList").css("margin-left"));
			
			if( moveX > -3000 ){
				$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
			}
		});
		
		// 채용공고 클릭.
		$(".recr").on("click", function(){
			window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=personal';
		});		
		
		//////////////////////////// newList		
		

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

			if (-2500 < moveX) {
				$("#content").animate({"margin-left" : "-=" + divWidth + "px"}, 500);
			}
		});
		
		$("#recommendUsers").click(function() {
			$('html').scrollTop(0);
			scrollIng = 'u';
			userPage =  1;
			$("#content2").empty();
				
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
		});
		
		$("#recommendCorpor").click(function() {
			$('html').scrollTop(0);
			scrollIng = 'c';
			corpPage =  1;
					
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
			
			
		});
		
		
		$(document).scroll(function() {
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
			
			if (scrollIng == 'u'){
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
			}
			
			else if (scrollIng == 'c'){
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
			}
			
		});
		
		$("#recommendUsers").click();
		
		

	});
</script>
<div class="container">
<div class="row">
<div>
<div class="row">
			  <div id="pc_leftmenu" class="col-md-3">
			        <div id="pc_leftmenuBox" class="whiteBox">
			         	<a href="/connections?sort=new">
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
								<c:choose>
									<c:when test="${fn:length(schoolFriends) eq 0 }">
										<label style="font-size: 18px;padding-left: 200px;padding-top: 50px;">아는 동문 없음</label>
									</c:when>
									<c:otherwise>
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
														<div style="background-image: url(${fn:contains(friend.bg_path, 'http') ? bg_path : bg_addrpath});height: 70px; margin-top: -15px;"></div>
														<div style=" margin-top: -50px;">
															<a href="/profileHome?user_id=${friend.user_id }"><div style="width: 108px;height: 108px;background-image: url(${fn:contains(friend.profile_path, 'http') ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 30px;border: 4px solid #E3EEF2;border-radius: 100px;"></div></a>
															<a href="/profileHome?user_id=${friend.user_id }"><div style="margin-top: 5px;"><strong>${friend.user_name}</strong></div></a>
															<a href="/profileHome?user_id=${friend.user_id }"><div style="font-size: 16px;padding-left: 5px;padding-right: 5px; text-overflow: ellipsis; display: inline-block; width: 146.97px; white-space: nowrap; overflow: hidden;margin-bottom: 50px;">${friend.introduce}</div></a>
															<button class="btn btn-default" style="border-color: #0073b1;border-style: solid;padding-left: 40px;padding-right: 40px;"
															onclick="location.href='/connectionSend?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${friend.user_id }'">1촌 맺기</button>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
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
				<!-- newList -->
					<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 10px; height: 370px; margin-bottom: 20px;
							text-align: center; padding-top: 10px; font-size: 22px;">
						<div style="text-align: left; padding-left: 15px; padding-bottom: 7px; font-weight: bold; color: #0073b1;">
							<i class="fas fa-check" style="margin-right: 15px;"></i>신규 채용공고
						</div>
						<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;">
					   		<c:if test="${newList.size() >= 1 }">
					   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
					   					margin-left: -290px;">
								<c:forEach items="${newList }" varStatus="i" var="rRVo">
									<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
											margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
										<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
												border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
												data-code="${rRVo.recruit_code }">
											<div class="table_div" style="margin-left: 24px;">
												<c:choose>
													<c:when test="${ fn:contains(newImgList.get(i.index), 'http') }">
														<img src="${newImgList.get(i.index) }" width="200"> 
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${newIdList.get(i.index) }&division=pf" width="200">
													</c:otherwise>	
												</c:choose>												
											</div> <br>
											<strong>
												<c:choose>
													<c:when test="${rRVo.recruit_title.length() > 18 }">
														${rRVo.recruit_title.substring(0, 18) }...
													</c:when>
													<c:otherwise>
														${rRVo.recruit_title }
													</c:otherwise>
												</c:choose>
											</strong> <br>
											${newNmList.get(i.index) } <br>
											${rRVo.job_local } <br>
											${rRVo.job_type }
										</div>
										<div style="padding-top: 10px; color: #2f7b15;">
											${newTimeList.get(i.index) } 전
										</div>
									</div></li>
								</c:forEach>
								</ul>
							</c:if>
						</div>
						<div style="text-align: center; font-size: 13px; padding-top: 15px;">
							<i onmouseover="" class="fas fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i>				
						</div>
					</div>
				<!-- newList -->
				</div>
</div>
</div>
</div>
</div>
