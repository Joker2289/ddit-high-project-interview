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
	
	for(var i=0; i<code_id_array.length; i++){
		
		var source_contents = $('#textarea'+code_id_array[i]).val();      
		var css_top = $('#code_div'+code_id_array[i]).css('top');
		var css_left = $('#code_div'+code_id_array[i]).css('left');
		
		console.log(source_contents);
		console.log(css_top);
		console.log(css_top);
		
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

function insert_page_source(){
	
}
