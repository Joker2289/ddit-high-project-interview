<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 채용 탭 -->

<div id="pc_find" class="recr_All_div" style="margin-bottom: 120px; width: 700px; height: 100px; margin-top: 0px;">

	<form id="frm_detail" action="${pageContext.request.contextPath }/recr_detail" method="post">
		<input type="hidden" id="recruit_code" name="recruit_code">	
		<input type="hidden" id="req_page" name="req_page">	
		
<!-- 		<div class="col-md-12" > -->
			<!-- 260px, 525px, 790px -->
			<div id="div_list_box" class="whiteBox" style="width: 840px; margin-left: -32px; height: 400px; margin-bottom: 80px;
					text-align: center; padding-top: 20px; font-size: 18px; padding-left: 20px; overflow:hidden;
					margin-top: -20px;">
				<table>
					<tr>
						<td>
					   		<table border="0" style="margin-bottom: 20px; margin-top: 0px;">
					   			<tr>
					   				<td style="width: 650px; text-align: left; font-size: 24px;">
							   			<i class="fas fa-user"></i><strong> &nbsp;회사 채용공고</strong> <br>
					   				</td>
					   				<td>
										<a id="btn_slt2" class="btn btn-default" style="border: 0px; margin-left: 50px;
												height: 40px; width: 40px; padding-bottom: 10px;">
											<i class="fas fa-chevron-left" style="font-size: 17px; padding-bottom: 0px;"></i>
										</a>
										<a id="btn_sgt2" class="btn btn-default" style="border: 0px; height: 40px; width: 40px;">
											<i class="fas fa-chevron-right" style="font-size: 17px;"></i>
										</a><br/>
					   				</td>
					   			</tr>
					   		</table>	
					   		<!-- rRList2가 있으면 출력. -->
					   		<c:if test="${recruitList.size() >= 1 }">
					   			<ul id="content2" style="list-style: none; width: 3000px; padding-left: 5px;">
								<c:forEach items="${recruitList }" varStatus="i" var="rRVo">
									<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
											margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
										<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
												border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
												data-code="${rRVo.recruit_code }">
											<div class="table_div" style="margin-left: 24px;">
												<c:choose>
													<c:when test="${ fn:contains(corporationInfo.logo_path, 'http') }">
														<img src="${corporationInfo.logo_path }" width="200">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${corporationInfo.corp_id }&division=pf" width="200">
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
											${corporationInfo.corp_name } <br>
											${rRVo.job_local } <br>
											${rRVo.job_type }
										</div>
											<div style="margin-top: 10px; color: #2f7b15;">${timeList2.get(i.index) } 전</div>
									</div></li>
								</c:forEach>
								</ul>
							</c:if> 					
						</td>
					</tr>
				</table>				
				<br>
			</div>
<!-- 		</div> -->
	</form>	

</div>
<script>
$(document).ready(function(){
	console.log("${corporationInfo.corp_name }");
	
	var divWidth  = "511"; 
	
	// 추천리스트2 슬라이드.
	$("#btn_slt2").on("click", function(){
// 		alert(1);
		$("#content2").stop(true, true);
		   var moveX   = parseInt($("#content2").css("margin-left"));
	
		   if( moveX < 0 ){
				$("#content2").animate({"margin-left":"+=" + divWidth + "px"},440);
		   }
	});	
	$("#btn_sgt2").on("click", function(){
		 $("#content2").stop(true, true);
		   var moveX   = parseInt($("#content2").css("margin-left"));
	
		   if( -1022 < moveX ){
		   		 $("#content2").animate({"margin-left":"-=" + divWidth + "px"},440);
		   }
	});		
	
	// 채용공고 클릭.
	$(".recr").on("click", function(){
// 		alert($(this).data("code"));
		window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code=' + $(this).data("code");
	});
});

</script>
