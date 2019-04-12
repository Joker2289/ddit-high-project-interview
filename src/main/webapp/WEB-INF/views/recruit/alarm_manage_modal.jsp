<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- modal 영역 팝업 -->
<div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  	<div class="modal-content" style="margin-left: -100px; width: 755px; height: 580px;">

	<div class="modal-head" style="border-bottom: 1px solid; border-color: #d9d9d9;">
		<table border="1" style="width: 753px; margin-top: 10px;">
			<tr style="font-size: 24px; ">
				<td colspan="2" style="padding-left: 15px;">채용공고 검색어</td>
			</tr>
			<tr style="font-size: 17px;">
				<td style="padding: 0px; width: 376px;">
					<div style="margin-left: 128px; height: 38px; width: 120px;
							text-align: center; vertical-align: middle; padding-top: 5px;"
							id="lb_save">채용공고 알림</div>
				</td>
				<td style="padding: 10px;">
					<div style="margin-left: 132px; height: 38px; width: 113px;
							text-align: center; vertical-align: middle; padding-top: 5px;"
							id="lb_search">최근 검색어</div>
				</td>
			</tr>
		</table>
	</div>

	<div class="modal-body" style="height: 400px; border: 0px solid; padding: 0px; padding-left: 15px;">
		<table border="0" style="width: 737px;">
			<tr>
				<td style="width: 361px; border: 0px solid;">
					<div style="overflow: auto; overflow-x:hidden; float: left; height: 360px; border: 0px solid;"
							id="div_save">
						<table border="0" style="font-size: 17px; width: 341px;">
							<c:forEach begin="1" end="${saveList.size() }" varStatus="i">
								<tr>
									<td style="padding: 6px; border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
										${saveList.get(i.index - 1).search_word }<br>
										${saveList.get(i.index - 1).search_local }<br>
										<div style="border: 0px solid; width: 100px; float: left; text-align: center; cursor: pointer;
												margin-top: 6px; margin-left: -6px;"
												onmouseover="" class="save_alarm" data-idx="${i.index }"
												data-alarm="${saveList.get(i.index - 1).search_alarm }"
												data-code="${saveList.get(i.index - 1).search_code }">
											<c:choose>
												<c:when test="${saveList.get(i.index - 1).search_alarm == 2 }">
													<i class="fas fa-bell" style="margin-right: 5px; color: #0174b0;"></i>알림 끄기
												</c:when>
												<c:otherwise>
													<i class="far fa-bell" style="margin-right: 5px;"></i>알림 켜기
												</c:otherwise>
											</c:choose>	
										</div>
										<div style="border: 0px solid; width: 100px; float: left; text-align: center; margin-left: 10px;
												background-color: white; cursor: pointer; margin-top: 6px;" onmouseover="" 
												class="save_save" data-idx="${i.index }" data-save="2"
												data-code="${saveList.get(i.index - 1).search_code }">
											<i class="far fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소
											<!-- 저장하기 -->
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>					
				</td>
				<td>
					<!-- 최근 검색어 리스트. -->
					<div style="overflow: auto; overflow-x:hidden; height: 360px; margin-left: 10px; border: 0px solid;
							margin-left: 0px; border-left: 1px solid; border-color: #d9d9d9;" 
							id="div_search">
						<table border="0" style="font-size: 17px; width: 341px; margin-left: 20px;">
							<c:forEach begin="1" end="${sList.size() }" varStatus="i">
								<tr>
									<td style="padding: 6px; border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
										${sList.get(i.index - 1).search_word }<br>
										${sList.get(i.index - 1).search_local }<br>
										<div style="border: 0px solid; width: 100px; float: left; text-align: center; cursor: pointer;
												margin-top: 6px; margin-left: -6px;"
												onmouseover="" class="search_save" data-idx="${i.index }"
												data-code="${sList.get(i.index - 1).search_code }"
												data-save="${sList.get(i.index - 1).search_save }">
											<i class="far fa-save" style="margin-right: 5px;"></i>저장하기
<!-- 											<i class="fas fa-save" style="margin-right: 5px; color: #0174b0;"></i>저장 취소 -->
											
										</div>
										<div style="border: 0px solid; width: 100px; float: left; text-align: center; margin-left: 10px;
												background-color: white; cursor: pointer; margin-top: 6px;" onmouseover="" 
												class="search_del" data-idx="${i.index }" data-del="1"
												data-code="${sList.get(i.index - 1).search_code }">
											<i class="far fa-times-circle" style="margin-right: 5px;"></i>기록 삭제
<!-- 											<i class="far fa-times-circle" style="margin-right: 5px; color: red;"></i>삭제 취소 -->
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>					
				</td>
			</tr>
		</table>
		

		

	</div>
  	  
	<form id="frm" action="${pageContext.request.contextPath }/updateAllAlarm" method="post">
		<input type="hidden" id="result" name="result">
	
		<div class="modal-foot" style="padding: 10px; text-align: right; padding-bottom: 15px;">
			<input type="button" id="btn_save" value="저장" style="border: 0px; width: 65px; height: 40px; font-size: 19px;
					color: white; background-color: #0174b0; border-radius: 3px;">
			<input type="button" id="btn_cancel" value="취소" style="border: 1px solid; width: 65px; height: 40px; font-size: 19px;
					color: #0174b0; background-color: white; border-radius: 3px; margin-left: 8px; margin-right: 15px;"
					data-dismiss="">
			<input type="hidden" id="btn_cancel_hidden" data-dismiss="modal">
		</div>
	</form>
  	  
  	</div>
  </div>
</div>
