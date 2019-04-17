<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>

	<!-- code 작성 modal-->
    <div class="jk-modalsasun">
        <div class="jk-modal">
            <div class="jk-row">
                <div id="modal-head" class="jk-modal-head">
                    <h1>${ modal_head }</h1>
                </div>
            </div>


            <div class="jk-row">
                <div id="modal-body" class="jk-modal-body">
					

					
                </div>
            </div>

            <div class="jk-row">
                <div id="modal-footer" class="jk-modal-footer">
                    <button id="closeBtn" class="jk-close-btn" type="button">Close</button>
                </div>
            </div>

        </div>
    </div>

    <script>
    	
    	$('#closeBtn').on('click', function(){
    		$('.jk-modalsasun').css('display', 'none');
    	});
    
    </script>