<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
<form action="${pageContext.request.contextPath }/insertSLog" id="frm_search">
<input type="hidden" id="search_word" name="search_word">
<input type="hidden" id="search_local" name="search_local">
<!-- 검색창. -->
<nav style="background-color: #5c6f7c; height: 97px; margin-top: -20px; text-align: center; padding-top: 7px;">
	<table style="margin: 0 auto; height: 82px;">
		<tr>
			<td>
				<table>
					<tr>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-search" style="font-size: 21px; margin-right: 5px;
										color: #666666;"></i>
								<input type="text" placeholder="채용공고 검색" style="width: 483px; border: 0px;
										height: 37px; font-size: 19px;" id="txt_word">
							</div>
						</td>
						<td>
							<div style="background-color: white; margin-right: 10px; padding-left: 10px; padding-top: 3px;">
								<i class="fas fa-map-marker-alt" style="font-size: 21px; margin-right: 5px;
										color: #666666"></i>
								<input type="text" placeholder="지역 검색" style="width: 483px; border: 0px;
										height: 37px; font-size: 19px;" id="txt_local">
							</div>
						</td>
						<td>
							<input type="button" value="검색" style="border: 1px solid; width: 78px; height: 40px;
									background-color: #5c6f7c; border-color: white; color: white; font-size: 18px;"
									id="btn_search">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="text-align: left; color: white; font-size: 17px; margin-top: 3px;">
			<td>
				<table>
					<tr>
						<td>저장한 검색어 :&nbsp; &nbsp;</td>
						<c:choose>
							<c:when test="${saveList.size() == 0 }">
								<td style="color: white;">
									자주 쓰는 검색어를 등록해보세요.&nbsp; &nbsp;
								</td>
							</c:when>
						</c:choose>
							<!-- 6개만 출력하기. -->
							<c:forEach begin="1" end="${saveList.size() }" varStatus="i">
								<td>
									<a style="color: white;" data-word="${saveList.get(i.index - 1).search_word }"
											data-local="${saveList.get(i.index - 1).search_local }" class="a_save">
										${saveList.get(i.index - 1).search_word } ${saveList.get(i.index - 1).search_local }&nbsp; &nbsp;
									</a>
								</td>
							</c:forEach>
							<c:if test="${saveList.size() > 5 }">
								<td>...&nbsp; &nbsp; </td>
							</c:if>
						<td>｜&nbsp; &nbsp; </td>
						<td>
							<span id="alarm_manage" onmouseover="" style="cursor: pointer;">검색어 관리</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</nav>
</form>

<div class="container">
<div class="row">
<div>
	<table border="0" style="margin-bottom: 0px; margin-top: 22px; padding: 0px; margin-left: -2px;">
		<tr>
			<td style="vertical-align: top;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 795px;">
						<h4 id="txt_srList" style="font-size: 22px; margin-left: 25px; margin-top: 14px;">
							저장한 채용공고 (${srList.size() })
						</h4>
					</div>
					<div id="div_srList" class="whiteBox" style="width: 795px; border-top: 0px; margin-top: -2px;">
						<!-- srListAjax -->
					</div>
					
					<div class="col-md-12">
						<div class="whiteBox" style="width: 795px; margin-bottom: 100px; height: 50px; padding: 10px;
								padding-left: 20px; font-size: 20px; margin-left: -15px; margin-top: -2px;">
							<a href="${pageContext.request.contextPath }/recruit">
								<i class="fas fa-chevron-left" style="font-size: 19px;"></i>
								<strong>&nbsp; &nbsp;채용공고 페이지로</strong>
							</a>
						</div>
					</div>												
				</div>			
			</td>
			<td style="vertical-align: top; margin-left: 0px;">
				<div class="col-md-12">
					<div class="whiteBox" style="width: 330px; margin-left: -14px; font-size: 20px; padding-bottom: 7px;
							padding-top: 7px; padding-left: 7px;">
						지원한 채용공고 (${appList.size() })
					</div>
					<div class="whiteBox" style="width: 330px; margin-left: -14px; margin-top: -1px; padding-bottom: 2px;
							font-size: 16px;">
						<table border="0" style="margin-left: 10px; width: 310px; margin-top: 10px;">
							<c:if test="${appList.size() > 0}">
								<c:forEach begin="1" end="${appList.size() }" varStatus="i">
									<tr>
										<td id="app${i.index }" onmouseover="" style="cursor: pointer; 
												border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 10px; 
												padding-top: 10px; padding-left: 4px;">
											<c:choose>
												<c:when test="${ fn:contains(corpImgList_app.get(i.index - 1), 'http') }">
													<img src="${corpImgList_app.get(i.index - 1) }" width="150"
															style="margin-bottom: 10px;"><br><br>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${corpIdList_app.get(i.index - 1) }&division=pf" 
															width="150" style="margin-bottom: 10px;"><br><br>
												</c:otherwise>	
											</c:choose>													
											<strong>${appList.get(i.index - 1).recruit_title }</strong><br>
											${corpNmList_app.get(i.index - 1) }<br>
											${appList.get(i.index - 1).job_local }
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>						
					</div>
				</div>			
			</td>
		</tr>
	</table>
	
	<br><br><br>
	<!-- '목록으로' 버튼 만들기. 변경사항을 ajax로 처리하면 뒤로 가기를 이전 페이지 이동으로 해도 됨. -->
	
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
// 		console.log("${saveList }");
		
		// 저장한 검색어 클릭
		$(".a_save").on("click", function(){
// 			alert($(this).data("word"));
			$("#search_word").val($(this).data("word"));
			$("#search_local").val($(this).data("local"));
			
			$("#frm_search").submit();
		});		
		
		// 페이지 로딩시 ajax로 srList 가져오기
		getSRListHtml(null, "srListAjax");
		
		// 검색 버튼
		$("#btn_search").on("mouseover", function(){
// 			alert(1);
			$("#btn_search").css("background-color", "#7b909d");
			$("#btn_search").css("border", "2px solid");
		});
		
		$("#btn_search").on("mouseout", function(){
			$("#btn_search").css("background-color", "#5c6f7c");
			$("#btn_search").css("border", "1px solid");
		});
		
		// 검색어 관리 (모달 띄울때는 $(function(){ 필요함. 그리고 jQuery 스크립트는 layout.jsp에 있으므로
		// 지워준다.)
		$(function(){
			$("#alarm_manage").on("click", function(){
				$("div.modal").modal();
			});
		});		

		// 저장한 채용공고 스크랩 취소 ajax.
		function getSRListHtml(scrap_flag, req_page){
			$.ajax({
				url : "${pageContext.request.contextPath }/scrap",
				data : "scrap_flag=" + scrap_flag +"&req_page=" + req_page,
				success : function(data){
// 					alert("check : " + data);
					
					// sRList 출력. + 리스트 사이즈 표시. 저장한 채용공고 (${srList.size() })
					// listSize를 data-[변수명]에 el로 저장해놔야 c:forEach의 속성값으로 쓸수 있네.
					// 가 아니고 c:forEach를 쓰지 않는 것으로 수정.
					$("#div_srList").html(data);
					$("#txt_srList").text("저장한 채용공고 ("+ $("#listSize").val() +")");
					
					// 처음 페이지 요청때 ajax로 리스트를 출력하고 여기에 클릭 이벤트를 넣자.
					// 이미지, 채용공고 & 스크랩 클릭
					$(".img").on("click", function(){
// 						alert("data : " + $(this).data("code"));
						window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+$(this).data("code");		
					});
					
					$(".srecr").on("click", function(){
						window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+$(this).data("code");		
					});
					
					// 스크랩 아이콘.
					$(".scrap").on("click", function(){
						if(confirm("채용공고 스크랩을 취소하시겠습니까?")){
							// ajax로 수정.
							var scrap_flag = "f"+$(this).data("code");
							var req_page = "srListAjax";
							
							getSRListHtml(scrap_flag, req_page);
						}
					});
					
					$(".scrap").on("mouseover", function(){
						$(".div_scrap:eq("+$(this).data("idx")+")").css("background-color", "#e5f5fb");
					});
					$(".scrap").on("mouseout", function(){
						$(".div_scrap:eq("+$(this).data("idx")+")").css("background-color", "white");
					});
					
					// ajax로 수정 완료.
				}
			});			
		}
		
		<c:forEach begin="1" end="${appList.size() }" varStatus="i">
			// 지원한 채용공고 클릭
			$("#app${i.index }").on("click", function(){
// 				alert("${i.index }");
				window.location.href = '${pageContext.request.contextPath}/recr_detail?recruit_code=${appList.get(i.index - 1).recruit_code }';
			});
		</c:forEach>
		
		// 검색 버튼
		$("#btn_search").on("click", function(){
// 			alert($("#txt_word").val() + " + " + $("#txt_local").val());
			search();
		});
		
		// 엔터키 눌렀을 때 검색되도록.
		$("#txt_local").keypress(function(e){
			if(e.which == 13){
				search();
			}
		});		
		$("#txt_word").keypress(function(e){
			if(e.which == 13){
				search();
			}
		});		
		
	});
	
	function search(){
		$("#search_word").val($("#txt_word").val());
		$("#search_local").val($("#txt_local").val());
		
		$("#frm_search").submit();		
	}		


</script>	
	
</body>
</html>






