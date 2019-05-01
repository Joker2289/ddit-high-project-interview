//배경색 변경 페이지 소환
function updateStageColor() {

	$.ajax({
		url : "/page/color_menu",
		success : function(data) {
			$('.popover-content').html(data);
		}
	});
}

// 이미지 저장
function stage_save_img() {
	// fileSaver
	html2canvas($('#view_div'), {
		useCORS : true,
		foreignObjectRendering : true,
		letterRendering : true,

		width : window.innerWidth,
		height : window.innerHeight,

		onrendered : function(canvas) {

			canvas.toBlob(function(blob) {
				saveAs(blob, 'gogogo.png');
			});

		}

	});
}

//page 제목 입력
function input_page_title(title){
	
	var result = prompt( '제목 작성', title );
	 
	if(result != null){
		$('#page_title').val(result);
		stage_save_page();
	}
}

// 페이지 저장
function stage_save_page() {
	
	
	//소스코드 저장
	for(var i=0; i<code_id_array.length; i++){
		//textarea 입력값 줄바꿈 -> <br> 로 치환
		var tmp_content = $('#textarea'+code_id_array[i]).val(); 
		var tmp_content2 = tmp_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		var source_contents = tmp_content2.replace(/'/gi, '"');
		
		var css_top = $('#code_div'+code_id_array[i]).css('top');
		var css_left = $('#code_div'+code_id_array[i]).css('left');
		
		$('#saveForm').append('<input type="hidden" id="source_contents'+i+'" name="source_contents"/>');
		$('#saveForm').append('<input type="hidden" id="source_mode'+i+'" name="source_mode"/>');
		$('#saveForm').append('<input type="hidden" id="source_theme'+i+'" name="source_theme"/>');
		$('#saveForm').append('<input type="hidden" id="css_top'+i+'" name="css_top"/>');
		$('#saveForm').append('<input type="hidden" id="css_left'+i+'" name="css_left"/>');
		
		$('#source_contents'+i).val(source_contents);
		$('#source_mode'+i).val(code_mode_array[i]);
		$('#source_theme'+i).val(code_theme_array[i]);
		$('#css_top'+i).val(css_top);
		$('#css_left'+i).val(css_left);
	}
	
	//비디오 저장
	for(var i=0; i<video_id_array.length; i++){
		
		var video_link = video_link_array[i];
		var video_css_top = $('#video_div'+video_id_array[i]).css('top');
		var video_css_left = $('#video_div'+video_id_array[i]).css('left');
		
		$('#saveForm').append('<input type="hidden" id="video_link'+i+'" name="video_link"/>');
		$('#saveForm').append('<input type="hidden" id="video_css_top'+i+'" name="video_css_top"/>');
		$('#saveForm').append('<input type="hidden" id="video_css_left'+i+'" name="video_css_left"/>');
		
		$('#video_link'+i).val(video_link);
		$('#video_css_top'+i).val(video_css_top);
		$('#video_css_left'+i).val(video_css_left);
	}
	
	//링크 저장
	for(var i=0; i<link_id_array.length; i++){
		
		var link_address = link_address_array[i];
		var link_css_top = $('#link_div'+link_id_array[i]).css('top');
		var link_css_left = $('#link_div'+link_id_array[i]).css('left');
		
		$('#saveForm').append('<input type="hidden" id="link_address'+i+'" name="link_address"/>');
		$('#saveForm').append('<input type="hidden" id="link_css_top'+i+'" name="link_css_top"/>');
		$('#saveForm').append('<input type="hidden" id="link_css_left'+i+'" name="link_css_left"/>');
		
		$('#link_address'+i).val(link_address);
		$('#link_css_top'+i).val(link_css_top);
		$('#link_css_left'+i).val(link_css_left);
	}
	
	
	
	
	
	//스테이지 썸네일 저장
	html2canvas($('#view_div'), {
		width : window.innerWidth,
		height : window.innerHeight,
		onrendered : function(canvas) {

			$("#thumnail_data").val(canvas.toDataURL("image/png"));

			$.ajax({
				type : "post",
				data : $("#thumnailForm").serialize(),
				url : "/page/saveThumbnail",
				success : function(data) {
					console.log(data);
					$('#page_thumbnail').val(data);
					
					var stage_data = stage.toJSON();
					$('#page_contents').val(stage_data);
					
					$('#saveForm').submit();
				}
			});

		}
	});

}



