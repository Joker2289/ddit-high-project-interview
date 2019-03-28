<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
      	<div class="modal-content">
      	  
      	  <div class="modal-header">
			<label>헤더</label>      	  	
      	  </div>
      	  
      	  <div class="modal-body">
      	  	<label>바디</label>
      	  	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
      	  </div>
      	  
      	  <div class="modal-footer">
      	  	<label>푸터</label>
      	  </div>
      	  
      	</div>
      </div>
    </div>
