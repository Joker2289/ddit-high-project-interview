//$('.CodeMirror')

var codemirror = $('.CodeMirror');

var code_div = document.createElement('div');
code_div.className = 'code_div' + node_num;

//document.body.appendChild(code_div);

//밑으로 내려야함
$(".code_div" + node_num).css('width', '600px !important');
$(".code_div" + node_num).css('height', '500px !important');

document.getElementById('view_div').appendChild(code_div);

$('.code_div' + node_num).html(codemirror);


// css 위치 값으로 컨트롤
$(".code_div" + node_num).draggable({
    containment: "#container",
    scroll: true
});

// css 위치값 확인
$(".code_div" + node_num).css('left', '98px');
$(".code_div" + node_num).css('top', '-700px');



$(".CodeMirror").css('margin', '0px !important');

$(".code_div" + node_num).css('display', 'inline');


$('#code_editor').html('');


// modal 끄기
$('.jk-modalsasun').css('display', 'none');




//============================================================================================

function addCode() {
	
	node_num++;
	
	$('#completeBtn').off('click');
    // 작성 버튼
    $('#completeBtn').on('click', function () {
    	
    	var code_editor = null;
    	
    	//textarea 생성 id 부여
    	var textarea = document.createElement('textarea');
    	textarea.id = 'textarea' + node_num;
    	
    	//모달창에 사용자가 입력한 값 이동
    	$(textarea).val(code_data);
    	
    	//div 생성
    	var code_div = document.createElement('div');
        code_div.id = 'code_div' + node_num;
        
        //div에 textarea 추가
        $('#code_div'+node_num).append(textarea);
        
        
        //view_div에 생성한 div 넣기
        $('#view_div').append(code_div);
        
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
        $("#code_div" + node_num).css('display', 'inline');

        //전에 텍스트 area 비워주기
        $('#code_editor').val('');

        // modal 끄기
        $('.jk-modalsasun').css('display', 'none');
        

    });
    
    $('#closeBtn').off('click');
    // 닫기 버튼
    $('#closeBtn').on('click', function () {
    	$('#code_editor').val('');
        $('.jk-modalsasun').css('display', 'none');
    });

}

//미리보기 클릭시 랜더링
function code_view_rendering(){
	
	var editor = null;

    editor = CodeMirror.fromTextArea(document.getElementById('code_editor'), {
        mode: code_mode, // text/html 추가 java
        lineNumbers: true,
        tabMode: 'indent',
        styleActiveLine: true,
        lineWrapping: true,
        autoCloseTags: true
        // tabSize: 10, //tab 몇칸 띄우는지
    });

    
    
    // 모드 선택
    $('#modeSelect').on('change', function () {
        code_mode = $('#modeSelect').val();

        editor.setOption('mode', code_mode);
        editor.save();
    });

    // 테마 선택
    $('#themeSelect').on('change', function () {
        code_theme = $('#themeSelect').val();

        editor.setOption('theme', code_theme);
        editor.save();
    });
    editor.setSize(600, 500);
    
    code_data = $('#code_editor').val();
	
};