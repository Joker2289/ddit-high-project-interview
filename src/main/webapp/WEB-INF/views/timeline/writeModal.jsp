<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
      	<div class="modal-content">

      	  <div class="modal-head">
      	  </div>

      	  <div class="modal-body">
      	  	<textarea class="write_area" name="smarteditor" id="smarteditor" style="width:620px; height:300px;"></textarea>
      	  </div>
      	  
      	  <div class="modal-foot">
      	  	<button class="btn-modal-upload"><span style="font-size: 22px;"><a><i class="far fa-images"></i></a></span></button>
          	<button class="btn-modal-upload"><span style="font-size: 22px;"><a><i class="far fa-play-circle"></i></a></span></button>
          	<button class="btn-modal-upload"><span style="font-size: 22px;"><a><i class="far fa-file-alt"></i></a></span></button>
          	<button class="btn-save"><span style="font-size: 18px; color: #ffffff;">올리기</span></button>
      	  </div>
      	  
      	</div>
      </div>
    </div>
