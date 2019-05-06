   function pushModal() {
      $("div.writemodal").modal();
   }

   function pushUpdateModal() {
      $("div.updatemodal").modal();
   }
   
   $('#summernote').summernote({
      placeholder: '소식을 업데이트 해주세요!',
        tabsize: 2,
        height: 440,
        maxheight: 600,
        width: 555,
        maxwidth: 555
   });
   
   $("#update_contents").summernote({
        tabsize: 2,
        height: 440,
        maxheight: 600,
        width: 555,
        maxwidth: 555
   });
      
      
   //summernote 툴바 숨기기
   $(".note-toolbar").hide();
   $(".note-resizebar").hide();
   $(".note-status-output").hide();
   
   var ref_code;
   
   $(".btn_moretag").on("click", function() {
         
//       $.ajax({
//          type : 'POST',
//          url : '/',
//          data : {"" : },
//          success : function(data) {
            
//             if(data != ""){
               
//             }
//          }
//       });
      $(".btn_moretag").hide();
   });
      
//    게시글 댓글 버튼 클릭 시 댓글 영역 출력
   var commentFlag = false;
   
   var print_code = "";
   $(".btn_comment").on("click", function() {
      
      print_code = $(this).attr('data-code');
      ref_code = $(this).attr('title');
      
      if (commentFlag == false) {
         $.ajax({
            type : 'POST',
            url : '/commentArea',
            data : {"ref_code" : print_code},
            success : function(data) {
               
               if(data != ""){
                  $('#post' + print_code).append(data);
               }
            }
         });
         commentFlag = true;
      } 
      else {
         commentFlag = false;
         $(".col-comment").remove();
      }
   });
      
   var good_ref_code = "";
   
   $(".btn_good").on("click", function() {
      good_ref_code = $(this).attr('title');
      var good_count = parseInt($('#txt_good_count' + good_ref_code).text());
      
      if($('#icon_good' + good_ref_code).attr("class") == "far fa-thumbs-up"){
         $.ajax({
            type : 'POST',
            url : '/push_postgood',
            data : {"ref_code" : good_ref_code},
            success : function(data) {
               $('#icon_good' + good_ref_code).attr("class", "fas fa-thumbs-up");
               // 추천 수 + 1
               $('#txt_good_count' + good_ref_code).text(good_count + 1);
            }
         });
         
      } else {
         $.ajax({
            type : 'POST',
            url : '/push_postgoodcancel',
            data : {"ref_code" : good_ref_code},
            success : function(data) {
               $('#icon_good' + good_ref_code).attr("class", "far fa-thumbs-up");
               //추천 수 - 1
               $('#txt_good_count' + good_ref_code).text(good_count - 1);
            }
         });
      }
   });
   
   var modify_code = "";
   $('.btn_modifyPost').on("click", function() {
      modify_code = $(this).attr('data-code');
      
   });
   
   var delete_code = "";
   $('.btn_deletePost').on("click", function() {
      delete_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/deletepost',
         data : {"post_code" : delete_code},
         success : function(data) {
            $('#post'+delete_code).remove();
            
            $('#col-post'+delete_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 삭제했습니다.</h4></div>');
            
            
         }
      });
   })
   
   //글 신고
   function pushReportModal() {
      $("div.reportmodal").modal();
   }
   function closeReportModal() {
      $("div.reportmodal").modal('hide');
   }
   
   var report_code = "";
   $('.btn_reportPost').on("click", function() {
      
      pushReportModal();
      
      report_code = $(this).attr('data-code');
      
      $("#btn_report_post").on("click", function() {
         
         var report_contents = $("#report_contents").val();
         
         $.ajax({
            type : 'POST',
            url : '/postreport',
            data : {"post_code" : report_code, "report_contents" : report_contents},
            success : function(data) {
               
               closeReportModal();
               $('#post'+report_code).remove();
               $('#col-post'+report_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 신고했습니다.<br> 이 업데이트는 더 이상 표시되지 않습니다. </h4></div>');
               
            }
         });
      });
      
   });
   
   var writer_id = "";
   var writer_name = "";
   var target_code = "";
   $('.btn_unfollow').on("click", function() {
      writer_id    = $(this).attr('data-writer');
      writer_name = $(this).attr('data-name');
      target_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/unfollow',
         data : {"target_id" : writer_id},
         success : function(data) {
            
            $('#post'+target_code).remove();
            $('#col-post'+target_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>' + writer_name + '님을 언팔로우 했습니다.<br>앞으로 ' + writer_name + '님의 글은 표시되지 않습니다.</h4></div>');
            
         }
      });
   });
   
   var hide_code = "";
   $(".btn_hidePost").on("click", function() {
      hide_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/hidepost',
         data : {"post_code" : hide_code},
         success : function(data) {
            
            $('#post'+hide_code).remove();
            $('#col-post'+hide_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 숨겼습니다. 이 글은 더 이상 표시되지 않습니다.</h4></div>');
         }
      });
   });
   
   var savepost_code = "";
   $(".btn_save").on("click", function() {
      savepost_code = $(this).attr('title');
//       var save_count = parseInt($('.txt_save_count').text());
      
      if($('#icon_save' + savepost_code).attr("class") == "far fa-bookmark"){
         $.ajax({
            type : 'POST',
            url : '/push_postsave',
            data : {"post_code" : savepost_code},
            success : function(data) {
               
               
               $('#icon_save' + savepost_code).attr("class", "fas fa-bookmark");
               // 추천 수 + 1
               $('.txt_save_count').text(data);
            }
         });
      } else {
         $.ajax({
            type : 'POST',
            url : '/push_postsavecancel',
            data : {"post_code" : savepost_code},
            success : function(data) {
               $('#icon_save' + savepost_code).attr("class", "far fa-bookmark");
               //추천 수 - 1
               $('.txt_save_count').text(data);
               
               console.log(document.location.pathname);
               if(document.location.pathname == '/savepost'){
             	  $('#post'+savepost_code).remove();
                   $('#col-post'+savepost_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글 저장을 취소했습니다.</h4></div>');
               }
               
            }
         });
      }
   });
   
    var goodcomment_code = "";
	$(".btn_commentGood").on("click", function() {
		goodcomment_code = $(this).attr('date-code');
		
		if($("#icon_commentgood"+goodcomment_code).attr('class') == "far fa-thumbs-up"){
			$.ajax({
	            type : 'POST',
	            url : '/push_commentgood',
	            data : {"ref_code" : goodcomment_code},
	            success : function(data) {
	               $('#icon_commentgood' + goodcomment_code).attr("class", "fas fa-thumbs-up");
	            }
	         });
		} else {
			$.ajax({
	            type : 'POST',
	            url : '/push_commentgoodcancel',
	            data : {"ref_code" : goodcomment_code},
	            success : function(data) {
	               $('#icon_commentgood' + goodcomment_code).attr("class", "far fa-thumbs-up");
	            }
	        });
		}
	});   
   
   
   var contents = "";
   $("#btn-write_modal").on("click", function () {
      
      pushModal();
      $("#btn_write_upload").on("click", function() {
         
         $("#frm_writePost").submit();
         
      });
   });
   
   var update_code = "";
   var param_input = "";
   $(".btn_modifyPost").on("click", function() {
      update_code = $(this).attr('data-code');
      
      param_input = $("<input>").attr("type", "hidden").attr("name", "post_code").val(update_code);
      
      $.ajax({
         type : 'POST',
         url : '/getpostinfo',
         data : {"post_code" : update_code},
         success : function(data) {
            
        	$("#frm_updatePost").append($(param_input));
            pushUpdateModal();
            
            $('.note-editable').html(data);
            
         }
      });
      
      $("#btn_update_post").on("click", function() {
    	 
         $("#frm_updatePost").submit();
      });
   });
   
      
   $("#btn-upload-img").on("click", function () {
      pushModal();
      $(".note-insert").children()[1].click();
   });
   
   $("#btn-upload-video").on("click", function () {
      pushModal();
      $(".note-insert").children()[2].click();
   });
   
   $("#btn-upload-document").on("click", function () {
      pushModal();
   });

   
   function activityClick(ref_code) {
	   
		$.ajax({
			url : "/pushGoodMember",
			data : {"ref_code" : ref_code },
			success : function(data) {

				console.log(data);
				$('#modal-body').html(data);
				$('.jk-modalsasun').css('display', 'block');			
			}
		});
		
	};