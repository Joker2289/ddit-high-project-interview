//배경색 변경
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

// 페이지 저장
function stage_save_page() {
	
	//스테이지 썸네일 저장
	html2canvas($('#view_div'), {
		width : window.innerWidth,
		height : window.innerHeight,
		onrendered : function(canvas) {

			$("#thumnail_data").val(canvas.toDataURL("image/png"));

			$.ajax({
				type : "post",
				data : $("#thumnailForm").serialize(),
				url : "/page/saveThumnail",
				success : function(data) {
					$('#page_thumnail').val(data);
				}
			});

		}
	});
	
	
	var stage_data = stage.toJSON();
	$('#page_contents').val(stage_data);
	
	$('#page_title').val('test');

}
