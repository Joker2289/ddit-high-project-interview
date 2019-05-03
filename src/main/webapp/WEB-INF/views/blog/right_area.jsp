<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




	<!-- 오른쪽 메뉴 구역 -->
	<div class="col-md-3">
		<!-- <div class="panel panel-default">
			<div class="panel-body">
				<div>최근 방문자</div> -->
				
				
				<!-- newList -->
	<div id="div_newList" class="panel panel-default" style="width: 296px; margin-left: 0px; height: 370px; margin-bottom: 20px;
			text-align: center; padding-top: 10px; font-size: 22px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);">
		<div style="text-align: left; padding-left: 15px; padding-bottom: 7px; font-weight: bold;">
			최근 방문자
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
						<div style="padding-top: 10px;">
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
	
	
	
	
				
				
			<!-- </div> -->
			<!-- panel-body -->
		<!-- </div> -->
		<!-- panel panel-default -->
	
		<!-- <div class="panel panel-default">
			<div class="panel-body">
				<a href="#"><h4>인기 게시물</h4></a>
				<ul>
					<li><a href="#">앙 광고띠</a></li>
				</ul>
			</div>
		</div>
	
		<div class="panel panel-default">
			<div class="panel-body">
				<a href="#"><h4>질문 게시판</h4></a>
				<ul>
					<li><a href="#">앙 광고띠</a></li>
				</ul>
			</div>
		</div> -->
	</div>




<script>

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
//	alert($(this).index());
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
//		alert($(this).data("code"));
	window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=timeline';
});
	

</script>











