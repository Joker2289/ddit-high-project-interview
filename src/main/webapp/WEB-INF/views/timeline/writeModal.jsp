<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
      	<div class="modal-content">
      	  
      	  <div class="modal-header">
      	  	
			<input type="hidden" name="board_code" value="${board_code }">
			<input type="hidden" name="board_name" value="${board_name }">
		
			<div class="form-group" style="padding-left: 0px;">
				<label for="boardtitle" class="col-sm-5 control-label" style="padding-left: 0px;">제목</label>
				<div class="col-sm-10" style="padding-left: 0px;">
					<input type="text" style="width: 766px" class="form-control" id="post_title" name="post_title" /><br>
				</div>
			</div>

			<div class="form-group">
				<label for="boardtitle" class="col-sm-5 control-label" style="padding-left: 0px;">내용</label>
				<textarea name="post_contents" id="smarteditor" rows="10" cols="100" style="width: 766px; height: 412px;"></textarea>
			</div>
		
			<div class="col-sm-2" style="padding-left: 0px;">
				<table>
					<c:forEach begin="1" end="5" varStatus="fileCnt" step="1">
						<tr>
							<td><input type="file" name="uploadFile"></td>
						</tr>
					</c:forEach>
				</table>
			</div><br><br><br><br><br><br>
		
			<div class="col-sm-2" style="padding-left:520px;">
			   <button type="submit" class="btn btn-default" id="btn_write">완료</button>
			</div>
      	  	
      	  </div>
      	  
      	  <div class="modal-body">
      	  	<label>몸뚱아리입니다.</label>
      	  </div>
      	  
      	  <div class="modal-foot">
      	  	<label>발바닥입니다.</label>
      	  </div>
      	  
      	</div>
      </div>
    </div>