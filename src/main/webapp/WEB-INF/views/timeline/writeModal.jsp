<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade writemodal" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
      	<div class="modal-write-content">
		  <form id="frm_writePost" action="/writepost_timeline" method="post" >
      	    <div class="modal-write-head">
      	    </div>
            
      	    <div class="modal-write-body">
    	    	<textarea id="summernote" class="write_area" name="post_contents"  style="width:620px; height:300px; resize: none; border: 0;"></textarea>
    	    	<input type="file" id="input_img"/>
    	    	<img id="img"/>
      	    </div>
      	    
      	    <div class="modal-write-foot">
      	    	<button class="btn-modal-upload" type="button" id="btn_attend_img"><span style="font-size: 22px;"><i class="far fa-images"></i></span></button>
            	<button class="btn-modal-upload" type="button" id="btn_attend_video"><span style="font-size: 22px;"><i class="far fa-play-circle"></i></span></button>
            	<button class="btn-modal-upload" type="button" id="btn_attend_document"><span style="font-size: 22px;"><i class="far fa-file-alt"></i></span></button>
            	<button class="btn-save" type="submit" id="btn_write_upload"><span style="font-size: 18px; color: #ffffff;">올리기</span></button>
      	    </div>
      	  </form>
      	</div>
      </div>
    </div>
