<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- modal 영역 팝업 -->
<div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  	<div class="modal-content">

	<div class="modal-head">
		<table border="1" style="width: 553px; margin-top: 10px;">
			<tr style="font-size: 24px; ">
				<td colspan="2" style="padding-left: 15px;">채용공고 검색어</td>
			</tr>
			<tr style="font-size: 17px;">
				<td style="padding: 0px; width: 160px;">
					<div style="border: 1px solid; margin-left: 15px; height: 38px; width: 120px;
							text-align: center; vertical-align: middle; padding-top: 5px;"
							id="div_save">채용공고 알림</div>
				</td>
				<td style="padding: 10px;">
					<div style="border: 1px solid; margin-left: 15px; height: 38px; width: 113px;
							text-align: center; vertical-align: middle; padding-top: 5px;"
							id="div_search">최근 검색어</div>
				</td>
			</tr>
		</table>
	</div>

	<div class="modal-body">
		<table border="1">
			<c:forEach begin="1" end="${saveList.size() }" varStatus="i">
				<tr>
					<td>
						<table border="1">
							<tr>
								<td>
									${saveList.get(i.index - 1).search_word }<br>
									${saveList.get(i.index - 1).search_local }
								</td>
								<td>
									<i id="t_alarm_alarm${i.index }" class="fas fa-bell" onmouseover="" style="
											cursor: pointer; margin-left: 0px; margin-top: 10px; margin: 5px; 
											font-size: 22px;"></i>								
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<br><br>
		
		<h4>(최근검색어)</h4>
		<table border="1">
			<c:forEach begin="1" end="${saveList.size() }" varStatus="i">
				<tr>
					<td>
						<table border="1">
							<tr>
								<td>
									${saveList.get(i.index - 1).search_word }<br>
									${saveList.get(i.index - 1).search_local }
								</td>
								<td>
									<i id="" class="fas fa-bell" onmouseover="" style="
											cursor: pointer; margin-left: 0px; margin-top: 10px; margin: 5px; 
											font-size: 22px;"></i>								
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>		
		
	</div>
  	  
	<div class="modal-foot" style="padding: 10px; text-align: right; padding-bottom: 15px;">
		<input type="button" id="btn_save" value="저장" style="border: 0px; width: 65px; height: 40px; font-size: 19px;
				color: white; background-color: #0174b0; border-radius: 3px;">
		<input type="button" id="btn_cancel" value="취소" style="border: 0px; width: 65px; height: 40px; font-size: 19px;
				color: white; background-color: #0174b0; border-radius: 3px; margin-left: 8px; margin-right: 15px;">
	</div>
  	  
  	</div>
  </div>
</div>
