<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade reportmodal" id="report-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
      	<div class="modal-report-content">
      	  <div class="modal-write-head" style="text-align: center; padding-top: 5px;">
      	    <h4 style="color: #ddd;">신고 사유를 작성해주세요 !</h4>
      	  </div>
            
      	  <div class="modal-write-body" style="height: 120px; padding: 10px;">
    	    <textarea id="report_contents"  name="report_content" style="background: #fff; outline: 0; width: 100%; height:100px; resize: none; border: 0;"></textarea>
      	  </div>
      	    
      	  <div class="modal-write-foot">
            <button class="btn-save" type="button" id="btn_report_post" style="margin-left: 445px;"><span style="font-size: 18px; color: #ffffff;">신고하기</span></button>
      	  </div>
      	</div>
      </div>
    </div>
    
<script>

	$("#btn_update_img").on("click",function(){
		$(".note-insert").children()[1].click();
	});
	
	$("#btn_update_video").on("click",function(){
		$(".note-insert").children()[2].click();
	});
	
	
// 	$("#btn_update_document").on("click",function(){
// 		$(".note-insert").children()[2].click();
// 	});note-editabl")
	

</script>
