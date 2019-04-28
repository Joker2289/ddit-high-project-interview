var emoticon_src;


//      				이모티콘 삽입

// 이모티콘 효과
function addEmoticon() {
    var con = stage.container();
    
    
    con.addEventListener('dragover', function (e) {
    	e.preventDefault(); // !important 
        
    });

    
    con.addEventListener('drop', function (e) {
    	e.preventDefault();

        node_num++;
        
        stage.setPointersPositions(e);
        var dropPosition = stage.getPointerPosition();
        
        var imageObj = new Image();
        imageObj.src = emoticon_src;
        
        imageObj.onload = function () {
        	square = new Konva.Image({
                x: dropPosition.x,
                y: dropPosition.y,
                image: imageObj,
                width: 300,
                height: 300,
                name: 'emoticon ' + node_num,
                // draggable: true,
                src: emoticon_src,
            });
            
            
            shape_group = new Konva.Group({
                name: 'emoticon group ' + node_num,
                draggable: true
            });
            
            shape_group.add(square);
            
            // anchor 추가
            addAnchor(shape_group, dropPosition.x, dropPosition.y, 'anchor topLeft');
            addAnchor(shape_group, (dropPosition.x + 300), dropPosition.y, 'anchor topRight');
            addAnchor(shape_group, (dropPosition.x + 300), (dropPosition.y + 300), 'anchor bottomRight');
            addAnchor(shape_group, dropPosition.x, (dropPosition.y + 300), 'anchor bottomLeft');
            
            layer.add(shape_group);
            layer.draw();
        };
        
        //이모티콘 창숨기기
        $('#emoticonBtn').click();
        
//        con.removeEventListener('drop');
//        con.removeEventListener('dragover');
        
    });

    $('.emoticon').off('mousedown');
    $('.emoticon').on('mousedown', function () {

        emoticon_src = $(this).attr('src');
        

    });
}

//									이미지 삽입

//이미지 서버 저장
function imageUpload() {

    var form = $("#imageForm")[0];
	var formData = new FormData(form);
	
		console.log(formData);

		$.ajax({
			
			url : "/page/imageUpload",
			enctype: 'multipart/form-data',
			method : "post",
			data : formData,
			processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,

			success : function(data){
				
				console.log(data);
				addImage(data);
			}
		});
}

//이미지 스테이지에 그리기
function addImage(data) {
	
	 node_num++;
	 
	 console.log("Image_src : " + data);
	
	 var imageObj = new Image();
	 imageObj.src = "/page/onenoteImageView?src=" + data;
	 
	 imageObj.onload = function () {
		 square = new Konva.Image({
             x: 300,
             y: 300,
             image: imageObj,
             name: 'image ' + node_num,
             //draggable: true,
             src: this.src,
         });
		 
		 shape_group = new Konva.Group({
	         name: 'image group ' + node_num,
	         draggable: true
	     });
	     
		 console.log();
		 
		 
	     shape_group.add(square);
	     
	     // anchor 추가
	     addAnchor(shape_group, 300, 300, 'anchor topLeft');
	     addAnchor(shape_group, (300 + imageObj.width), 300, 'anchor topRight');
	     addAnchor(shape_group, (300 + imageObj.width), (300 + imageObj.height), 'anchor bottomRight');
	     addAnchor(shape_group, 300, (300 + imageObj.height), 'anchor bottomLeft');
         
         layer.add(shape_group);
         layer.draw();
     };
     
}


//                                유튜브 삽입


//Video id 배열
//var video_id_array = new Array;			//비디오 ID
//var video_link_array = new Array();		//비디오 링크


//video 링크 입력 받기 & div 클래스 입력
function input_youtube_link(){
	
	node_num++;
	
	//video div 생성
	var video_div = document.createElement('div');
	video_div.id = 'video_div' + node_num;
	$(video_div).addClass('video_div');
	video_div.style = 'background-image: url(/page/onenoteImageView?src=video_img.png);';
    
    //view_div에 생성한 div 넣기
    $('#view_div').append(video_div);
    
    //drag 핸들
    var handle = document.createElement('div');
    handle.id = 'handle' + node_num;
	$(handle).addClass('handle');
    
    $('#video_div' + node_num).append(handle);
	
    
    //비디오 링크 입력
    var Youtube_link = prompt( 'Youtube 주소 입력', '' );
    
    //link 변환
    var Embed_link = Youtube_link.replace('watch?v=', 'embed/');
	 
	if(Embed_link != null){
		
		//DB로 보낼 정보 저장
		video_id_array.push(node_num);
		video_link_array.push(Embed_link);
		
		addVideo(Embed_link);
		
		return;
	}
	
	//취소시 div 삭제
	$('#video_div' + node_num).remove();
}

// https://www.youtube.com/watch?v=5u2T_f8TqGY - 원래 링크

// https://www.youtube.com/embed/5u2T_f8TqGY   - iframe 용 embed 링크

//비디오 링크 첨부
function addVideo(Embed_link) {
	
	var iframe = document.createElement('iframe');
    iframe.id = "iframe" + node_num;
    iframe.width = 560;
    iframe.height = 315;
    iframe.src = Embed_link;
    iframe.frameborder = 0;
    iframe.allow = 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture';
    iframe.allowfullscreen = true;
    iframe.draggable = true;

    $('#video_div'+node_num).append(iframe);
    
    //css 위치 값으로 컨트롤 draggable효과 추가
    $("#video_div" + node_num).draggable({
    	handle: '#handle'+node_num,
        containment: "#container",
        scroll: true,
        iframeFix: true, //필수
//        start: function(event, ui) {
//            $('.handle').show();
//        },
//	    stop: function(event, ui) {
//	        $(".handle").hide();
//	    },
	});
    
    //위치조정 handle - show, hide 이벤트 속성 추가
    $("#video_div" + node_num).attr('onmouseenter', "showHandle("+node_num+");");
    $("#video_div" + node_num).attr('onmouseleave', "hideHandle("+node_num+");");
    
    // div가 생성될 위치값 
    $("#video_div" + node_num).css('left', '98px');
    $("#video_div" + node_num).css('top', '200px');
    
    //매우중요 block 
    //block = width값 사이즈에 맞게 고정
    //absolute = 영역에 속해 있지 않은 단독 고정 위치
    $("#video_div" + node_num).css('display', 'block');
    $("#video_div" + node_num).css('position', 'absolute');
    
}

//비디오 위치조정 핸들 보이기  
function showHandle(node_num){
	$('#handle'+node_num).show();
}

//비디오 위치조정 핸들 숨기기
function hideHandle(node_num){
	$('#handle'+node_num).hide();
}



//                              소스코드 삽입

//코드 변수
var code_mode = "javascript"; // code 언어
var code_theme = "default"; // code 테마
var code_data = ''; 

//코드 id 배열
//var code_id_array = new Array;
//var code_mode_array = new Array();
//var code_theme_array = new Array();


//소스코드 추가
function addCode() {
	
	node_num++;
	
	//textarea 생성 id 부여
	var textarea = document.createElement('textarea');
	textarea.id = 'textarea' + node_num;
	$(textarea).addClass('textarea');
	
	
	//div 생성
	var code_div = document.createElement('div');
    code_div.id = 'code_div' + node_num;
    $(code_div).addClass('code_div');
    
    
    //view_div에 생성한 div 넣기
    $('#view_div').append(code_div);
	
    //div에 textarea 추가
    $('#code_div'+node_num).append(textarea);
	
	
	
	
	$('#completeBtn').off('click');
    // 작성 버튼
    $('#completeBtn').on('click', function () {
    	
    	//코드 정보 배열에 넣기(DB 저장 작업)
    	code_id_array.push(node_num);
    	code_mode_array.push(code_mode);
    	code_theme_array.push(code_theme);
    	
    	var code_editor = null;
    	
    	//CodeMirror 생성
        code_editor = CodeMirror.fromTextArea(document.getElementById('textarea'+node_num), {
            mode: code_mode, // text/html 추가 java
            lineNumbers: true,
            tabMode: 'indent',
            styleActiveLine: true,
            lineWrapping: true,
            autoCloseTags: true,
            theme: code_theme,
            // tabSize: 10, //tab 몇칸 띄우는지
        });
    	
    	code_editor.setSize(600, 500);
    	code_editor.save();
    	
    	
    	// css 위치 값으로 컨트롤 draggable효과 추가
        $("#code_div" + node_num).draggable({
            containment: "#container",
            scroll: true
        });

        // div가 생성될 위치값 
        $("#code_div" + node_num).css('left', '98px');
        $("#code_div" + node_num).css('top', '200px');
        
        //매우중요 block 
        //block = width값 사이즈에 맞게 고정
        //absolute = 영역에 속해 있지 않은 단독 고정 위치
        $("#code_div" + node_num).css('display', 'block');
        $("#code_div" + node_num).css('position', 'absolute');
        
        //원래는 요것만 했었다
        //$("#code_div" + node_num).css('display', 'inline');

        //전에 텍스트 area 비워주기
        $('#code_editor').val('');

        // modal 끄기
        $('.jk-modalsasun').css('display', 'none');
        
        //모드 테마 초기화
        code_mode = "javascript";
        code_theme = "default";

    });
    
    
    //임시 테스트 해봐야댐
    //$('#closeBtn').on('click', code_closeBtn_click(node_num));
    
    $('#closeBtn').off('click');
    // 닫기 버튼
    $('#closeBtn').on('click', function () {
    	$('#code_div'+node_num).remove();
        $('.jk-modalsasun').css('display', 'none');
        
        //모드 테마 초기화
        code_mode = "javascript";
        code_theme = "default";
    });

}

var editor = null;

//미리보기 클릭시 랜더링
function code_view_rendering(){
	
	editor = CodeMirror.fromTextArea(document.getElementById('code_editor'), {
        mode: code_mode, // text/html 추가 java
        lineNumbers: true,
        tabMode: 'indent',
        styleActiveLine: true,
        lineWrapping: true,
        autoCloseTags: true
        // tabSize: 10, //tab 몇칸 띄우는지
    });

    editor.setOption('mode', code_mode);
    editor.setOption('theme', code_theme);
    
    editor.setSize(600, 500);
    editor.save();
    
    //모달창에 사용자가 입력한 값 이동
	//$(textarea).val(code_data);
    code_data = $('#code_editor').val();
    $('#textarea'+node_num).val(code_data);
    
    
};

//코드 모드 셀렉트 박스 변경시
function modeSelect(){
	code_mode = $('#modeSelect').val();
	editor.setOption('mode', code_mode);
	editor.save();
}

//코드 테마 셀렉트 박스 변경시
function themeSelect(){
	code_theme = $('#themeSelect').val();
	editor.setOption('theme', code_theme);
	editor.save();
}


//                  링크 삽입
////link id 배열
//var link_id_array = new Array;				//링크 ID
//var link_address_array = new Array();		//링크 주소


//링크 주소 입력 받기 & div 클래스 입력
function input_link_address(){
	
	node_num++;
	
	//link div 생성
	var link_div = document.createElement('div');
	link_div.id = 'link_div' + node_num;
	$(link_div).addClass('link_div');
    
    //view_div에 생성한 div 넣기
    $('#view_div').append(link_div);
    
	
    
    //비디오 링크 입력
    var link_address = prompt( '링크 주소 입력', '' );
    
    if(link_address != null){
		
		//DB로 보낼 정보 저장
		link_id_array.push(node_num);
		link_address_array.push(link_address);
		
		addLink(link_address);
		
		return;
	}
	
	//취소시 div 삭제
	$('#link_div' + node_num).remove();
}

//링크 첨부
function addLink(link_address) {
	
	var a = document.createElement('a');
    a.id = "link" + node_num;
    a.href = link_address;
    a.style = "font-size: 30px; color: #489BF0;";
    a.text = link_address;
    
    $('#link_div'+node_num).append(a);
    
    //css 위치 값으로 컨트롤 draggable효과 추가
    $("#link_div" + node_num).draggable({
        containment: "#container",
    });
    
    // div가 생성될 위치값 
    $("#link_div" + node_num).css('left', '98px');
    $("#link_div" + node_num).css('top', '200px');
    
    //매우중요 block 
    //block = width값 사이즈에 맞게 고정
    //absolute = 영역에 속해 있지 않은 단독 고정 위치
    $("#link_div" + node_num).css('display', 'block');
    $("#link_div" + node_num).css('position', 'absolute');
    
}






document.addEventListener('click', (e) => {
    console.log(e);

    // e.addEventListener('drag', (e2)=>{
    // console.log('left: ' + e2.css('left') +', top: ' + e2.css('top'));
    // });

});


