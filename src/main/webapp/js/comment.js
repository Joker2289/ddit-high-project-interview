	$(".input_comment_contents").summernote({
		placeholder: '댓글달기'
	});
	
	$(".update_comment_contents").summernote({
		
	});
	
	$(".note-toolbar").hide();
	$(".note-resizebar").hide();
	$(".note-status-output").remove();
	$(".note-editor").css({
		border : 0
	});
	$(".note-frame").css({
		border : 0
	});
	
	$(".input_comment_img").on("click", function () {
		$(".note-insert").children()[1].click();
	});
	
	
	//댓글 수정 보류
	var update_comment_code = "";
	$(".btn_updateComment").on("click", function() {
		update_comment_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/getcommentInfo',
			data : {"comment_code" : update_comment_code},
			success : function(data) {
				
				if(data != ""){
					
					$("#comment-contents" + update_comment_code).remove();
					$("#comment-text" + update_comment_code).append();
					
				}
			}
		});
		
	});
	
	//댓글 삭제
	var delete_comment_code = "";
	$(".btn_deleteComment").on("click", function () {
		delete_comment_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/deletecomment',
			data : {"comment_code" : delete_comment_code},
			success : function(data) {
				
				console.log(data);
				$('#comment-area'+delete_comment_code).remove();
				$('#comment-info'+delete_comment_code).append('<div><span>댓글을 삭제했습니다.</span></div>');
				
			}
		});
		
	});
	
	function pushReportModal() {
		$("div.reportmodal").modal();
	}
	function closeReportModal() {
		$("div.reportmodal").modal('hide');
	}
	
	//댓글 신고
	var report_comment_code = "";
	$(".btn_reportComment").on("click", function () {
		
		pushReportModal();
		
		report_comment_code = $(this).attr('data-code');
		
		$("#btn_report_post").on("click", function() {
			
			var report_contents = $("#report_contents").val();
			
			$.ajax({
				type : 'POST',
				url : '/commentreport',
				data : {"comment_code" : report_comment_code, "report_contents" : report_contents},
				success : function(data) {
					
					closeReportModal();
					
					$('#comment-area'+report_comment_code).remove();
					//css 미적용
					$('#comment-info'+report_comment_code).append('<div><span>댓글을 신고했습니다.<br>더 이상 이 댓글을 표시하지 않습니다.</span></div>');
					
				}
			});
		});
		
	});
	
	//댓글 더보기 버튼 숨기기(해당 게시물의 댓글 총 갯수와 조회된 댓글의 수가 같을 때 버튼 숨기기)
	if($('.comment-area').length == $('.commentCnt').val()){
		$(".morecomment").hide();
	}
	
	var commentPageNum = 2;
	var last_comment;
	var comment_ref_code = $(".col-comment").attr('title');
	
	$("#btn_moreComment").on("click", function() {
		last_comment = $('.comment-area:last').attr('data-comment');
		
		$.ajax({
			type : 'POST',
			url : '/appendnextcomment',
			data : {"ref_code" : comment_ref_code, "commentPageNum" : commentPageNum, "last_comment" : last_comment},
			success : function(data) {
				
				if(data != ""){
					$(".comment-printarea").append(data);
				}
			}
		});
		commentPageNum++;
		if($('.comment-area').length == $('.commentCnt').val()){
			$(".morecomment").hide();
		}
	});
	
	
	$(".btn_commentWrite").on("click", function() {
		var comment_count = parseInt($('#txt_comment_count' + comment_ref_code).text());
		var contents = $(".input_comment_contents").val();
		
		$.ajax({
			type : 'POST',
			url : '/writecomment',
			data : {"ref_code" : comment_ref_code, "contents" : contents},
			success : function(data) {
				$(".col-comment").remove();
				
				if(data != ""){
					$("." + comment_ref_code).append(data);
					//댓글 수 + 1
					$('#txt_comment_count' + comment_ref_code).text(comment_count + 1);
				}
			}
		});
	});