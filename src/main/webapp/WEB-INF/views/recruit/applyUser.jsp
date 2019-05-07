<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#txt_com::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
		  color: black;
		}
		
		#txt_com:focus {
			border: 0px;
		}
	</style>
</head>

<body>

<div class="container">
<div class="row">
<div>

<table border="0" style="margin-bottom: 0px; margin-top: 10px; padding: 0px; margin-left: -2px;">
	<tr>
		<td style="vertical-align: top;">
			<div class="col-md-12">
				<div class="whiteBox" style="width: 795px; vertical-align: middle;">
					<h4 id="txt_srList" style="font-size: 22px; margin-left: 25px; margin-top: 14px;
							margin-bottom: 14px;">
						<!-- applyUserList -->
						채용공고 지원자 (${aUList.size() })
					</h4>
				</div>
				<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;
						font-size: 15px;">
					<c:if test="${aUList.size() > 0 }">
						<c:forEach begin="1" end="${aUList.size() }" varStatus="i">
							<table id="recr${i.index }" border="0" style="margin: 2px; cursor: pointer;
									width: 790px; border-bottom: 1px solid; border-color: #d9d9d9;
									margin-bottom: 5px;" onmouseover="">
								<tr style="">
									<td rowspan="6" style="width: 235px;">
										<table border="1">
											<tr>
												<td class="td_user" data-id="${aUList.get(i.index - 1).user_id }">
													<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${aUList.get(i.index - 1).user_id }&division=pf" 
															width="60" style="margin-left: 15px;">
												</td>
												<td style="font-size: 16px; padding-left: 15px; padding-right: 15px; height: 88px;"
														class="td_user" data-id="${aUList.get(i.index - 1).user_id }">
													<strong>${aUList.get(i.index - 1).user_id }</strong>
												</td>
											</tr>
										</table>
									</td>
									<td style="padding-left: 10px; font-size: 16px; 
											padding-bottom: 2px; padding-top: 7px;" class="td_user"
											data-id="${aUList.get(i.index - 1).user_id }">
										<strong>${eduList.get(i.index - 1) }</strong>
									</td>
									<td style="width: 150px; cursor: default; border-bottom: 1px solid;
											border-color: #d9d9d9;" rowspan="3">
										<input type="button" value="이력서 저장" style="color: #0174b0; 
												border: 1px solid; border-color: #0174b0;
												background-color: white; height: 40px; font-size: 18px;
												padding-right: 10px; padding-left: 10px; border-radius: 3px;" class="btn_pf"
												data-idx="${i.index - 1 }">
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 16px; padding-bottom: 2px; padding-top: 2px;"
											class="td_user" data-id="${aUList.get(i.index - 1).user_id }">
										<strong>${careerList.get(i.index - 1) }</strong>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px; padding-bottom: 8px; padding-top: 2px; border-bottom: 1px solid;
											border-color: #d9d9d9;"
											class="td_user" data-id="${aUList.get(i.index - 1).user_id }">
										<strong>${aUList.get(i.index - 1).addr1 }</strong>
									</td>
								</tr>
							</table>			
						</c:forEach>
					</c:if>
				</div>
				
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px; margin-bottom: 100px; height: 50px; padding: 10px;
							padding-left: 20px; font-size: 20px; margin-left: -15px; margin-top: -5px;">
						<a href="${pageContext.request.contextPath }/recr_detail?recruit_code=${recruit_code }">
							<i class="fas fa-chevron-left" style="font-size: 19px;"></i>
							<strong>&nbsp; &nbsp;채용공고 상세 페이지로</strong>
						</a>
					</div>
				</div>												
			</div>			
		</td>
		<td style="vertical-align: top; margin-left: 0px;">
			<div class="col-md-12">
				<!-- newList -->
				<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 0px; height: 370px; margin-bottom: 20px;
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
		</td>
	</tr>
</table>

<%@ include file="/WEB-INF/views/recruit/alarm_manage_modal.jsp" %><!-- 모달창 -->
</div>		
</div>		
</div>		
		
<script type="text/javascript">
	// nav - 검색어 관리 - 모달창
	$(function () {
		$("#alarm_manage").on("click", function(){
			$("div.modal").modal();
		});
	});

	$(document).ready(function(){
		console.log($("#sel_period option:selected").text());

		// 유저 클릭 - 프로필 이동.
		$(".td_user").on("click", function(){
			window.location.href = '${pageContext.request.contextPath }/profileHome?user_id='+$(this).data("id");
		});
		
		// 프로필 저장 버튼 클릭. / 마우스오버
		$(".btn_pf").on("click", function(){
// 			alert($(this).data("idx"));
		});
		$(".btn_pf").on("mouseover", function(){
			$(this).css("background-color", "#e5f5fb");
		})
		$(".btn_pf").on("mouseout", function(){
			$(this).css("background-color", "white");
		})
		
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
		
	});
	
	function search(){
		$("#search_word").val($("#txt_word").val());
		$("#search_local").val($("#txt_local").val());
		
		$("#frm_search").submit();		
	}

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
</script>	
	
</body>
</html>






