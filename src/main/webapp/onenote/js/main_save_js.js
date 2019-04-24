
//배경색 변경
function updateStageColor(){
	
	$.ajax({
		url : "/page/color_menu",
		success : function(data) {
			
			$('.popover-content').html(data);	
		}
	});
}



//이미지 저장
function stage_save_img(){
	// fileSaver
    html2canvas( $('#view_div'), {
   	 useCORS: true,
   	 foreignObjectRendering :  true,
        letterRendering: true,
        
        width: window.innerWidth,
        height: window.innerHeight,
               
        onrendered: function (canvas) {
       	 
                   
       	 canvas.toBlob(function (blob) {

   
       		 saveAs(blob, 'gogogo.png');
   
       	 });
   
        }
   
    });
}

//페이지 저장
function stage_save_page(){
	
	var stage_data = stage.toJSON();
	console.log(stage_data);
	
	
	
}

