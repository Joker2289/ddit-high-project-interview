<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- modal 영역 팝업 -->
<div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  	<div class="modal-content" style="margin-left: 0px; width: 555px; height: 280px; margin-top: 150px;">

	<div class="modal-head" style="border-bottom: 1px solid; border-color: #d9d9d9;">
		<table border="0" style="width: 753px; margin-top: 10px;">
			<tr style="font-size: 24px;">
				<td colspan="2" style="padding-left: 15px; padding-bottom: 12px;">신고 사유를 입력해주세요.</td>
			</tr>
		</table>
	</div>

	<div class="modal-body" style="height: 130px; border: 0px solid; padding: 0px; padding-left: 15px;
			padding-bottom: 20px;">
		<table border="0" style="width: 737px;">
			<tr>
				<td style="width: 361px; border: 0px solid; padding: 20px; font-size: 18px;">
					<textarea rows="4" cols="46" id="txt_report"></textarea>
				</td>
			</tr>
		</table>
	</div>
  	  
	<form id="frm" action="${pageContext.request.contextPath }/reportRecr" method="post">
		<input type="hidden" id="report_contents" name="report_contents">
		<input type="hidden" id="recruit_code" name="recruit_code">
	
		<div class="modal-foot" style="padding: 10px; text-align: right; padding-bottom: 5px; padding-top: 20px;">
			<input type="button" id="btn_save" value="전송" style="border: 0px; width: 65px; height: 40px; font-size: 19px;
					color: white; background-color: #0174b0; border-radius: 3px;">
			<input type="button" id="btn_cancel" value="취소" style="border: 1px solid; width: 65px; height: 40px; font-size: 19px;
					color: #0174b0; background-color: white; border-radius: 3px; margin-left: 8px; margin-right: 25px;"
					data-dismiss="">
			<input type="hidden" id="btn_cancel_hidden" data-dismiss="modal">
		</div>
	</form>
  	  
  	</div>
  </div>
</div>
