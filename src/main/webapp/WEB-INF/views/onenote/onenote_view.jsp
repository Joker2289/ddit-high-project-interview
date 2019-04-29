<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
    <script src="https://unpkg.com/konva@3.2.0/konva.min.js"></script>
    <script src="https://unpkg.com/konva@3.2.3/konva.min.js"></script>
    
    <!-- jquery-ui - 1.12.4버전과 충돌-->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- jquery-ui-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- FileSaver-->
	<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
   

    
    <!-- html2canvas : tag를 캡쳐하여 image로 변환-->
<!--    <script src="http://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>-->
<!--    <script src="/html2/html2canvas.min.js"></script>-->




    


    <!-- color picker js-->
    <script src="https://cdn.jsdelivr.net/npm/@jaames/iro/dist/iro.min.js"></script>

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- codeMirror-->
    <script type="text/javascript" src="/onenote/lib/codemirror.js"></script>
    <link rel="stylesheet" type="text/css" href="/onenote/lib/codemirror.css" />

    <meta charset="utf-8" />

    <title>One Note</title>

    <link href="https://fonts.googleapis.com/css?family=Jua&amp;subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Gothic:400,700,800|Nanum+Pen+Script&amp;subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic:400,700,800|Nanum+Pen+Script&amp;subset=korean" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- font Awesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <!-- google icon-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- menu, modal css-->
    <link rel="stylesheet" href="/onenote/css/menu.css">

    <!-- Mode -->
    <script type="text/javascript" src="/onenote/mode/apl/apl.js"></script>
    <script type="text/javascript" src="/onenote/mode/asciiarmor/asciiarmor.js"></script>
    <script type="text/javascript" src="/onenote/mode/asn.1/asn.1.js"></script>
    <script type="text/javascript" src="/onenote/mode/asterisk/asterisk.js"></script>
    <script type="text/javascript" src="/onenote/mode/brainfuck/brainfuck.js"></script>
    <script type="text/javascript" src="/onenote/mode/clike/clike.js"></script>
    <script type="text/javascript" src="/onenote/mode/clojure/clojure.js"></script>
    <script type="text/javascript" src="/onenote/mode/cmake/cmake.js"></script>
    <script type="text/javascript" src="/onenote/mode/cobol/cobol.js"></script>
    <script type="text/javascript" src="/onenote/mode/coffeescript/coffeescript.js"></script>
    <script type="text/javascript" src="/onenote/mode/commonlisp/commonlisp.js"></script>
    <script type="text/javascript" src="/onenote/mode/crystal/crystal.js"></script>
    <script type="text/javascript" src="/onenote/mode/css/css.js"></script>
    <script type="text/javascript" src="/onenote/mode/cypher/cypher.js"></script>
    <script type="text/javascript" src="/onenote/mode/d/d.js"></script>
    <script type="text/javascript" src="/onenote/mode/dart/dart.js"></script>
    <script type="text/javascript" src="/onenote/mode/diff/diff.js"></script>
    <script type="text/javascript" src="/onenote/mode/django/django.js"></script>
    <script type="text/javascript" src="/onenote/mode/dockerfile/dockerfile.js"></script>
    <script type="text/javascript" src="/onenote/mode/dtd/dtd.js"></script>
    <script type="text/javascript" src="/onenote/mode/dylan/dylan.js"></script>
    <script type="text/javascript" src="/onenote/mode/ebnf/ebnf.js"></script>
    <script type="text/javascript" src="/onenote/mode/ecl/ecl.js"></script>
    <script type="text/javascript" src="/onenote/mode/eiffel/eiffel.js"></script>
    <script type="text/javascript" src="/onenote/mode/elm/elm.js"></script>
    <script type="text/javascript" src="/onenote/mode/erlang/erlang.js"></script>
    <script type="text/javascript" src="/onenote/mode/factor/factor.js"></script>
    <script type="text/javascript" src="/onenote/mode/fcl/fcl.js"></script>
    <script type="text/javascript" src="/onenote/mode/forth/forth.js"></script>
    <script type="text/javascript" src="/onenote/mode/fortran/fortran.js"></script>
    <script type="text/javascript" src="/onenote/mode/gas/gas.js"></script>
    <script type="text/javascript" src="/onenote/mode/gfm/gfm.js"></script>
    <script type="text/javascript" src="/onenote/mode/gherkin/gherkin.js"></script>
    <script type="text/javascript" src="/onenote/mode/go/go.js"></script>
    <script type="text/javascript" src="/onenote/mode/groovy/groovy.js"></script>
    <script type="text/javascript" src="/onenote/mode/haml/haml.js"></script>
    <script type="text/javascript" src="/onenote/mode/handlebars/handlebars.js"></script>
    <script type="text/javascript" src="/onenote/mode/haskell/haskell.js"></script>
    <script type="text/javascript" src="/onenote/mode/haskell-literate/haskell-literate.js"></script>
    <script type="text/javascript" src="/onenote/mode/haxe/haxe.js"></script>
    <script type="text/javascript" src="/onenote/mode/htmlembedded/htmlembedded.js"></script>
    <script type="text/javascript" src="/onenote/mode/htmlmixed/htmlmixed.js"></script>
    <script type="text/javascript" src="/onenote/mode/http/http.js"></script>
    <script type="text/javascript" src="/onenote/mode/idl/idl.js"></script>
    <script type="text/javascript" src="/onenote/mode/javascript/javascript.js"></script>
    <script type="text/javascript" src="/onenote/mode/jinja2/jinja2.js"></script>
    <script type="text/javascript" src="/onenote/mode/jsx/jsx.js"></script>
    <script type="text/javascript" src="/onenote/mode/lua/lua.js"></script>
    <script type="text/javascript" src="/onenote/mode/markdown/markdown.js"></script>
    <script type="text/javascript" src="/onenote/mode/mathematica/mathematica.js"></script>
    <script type="text/javascript" src="/onenote/mode/mbox/mbox.js"></script>
    <script type="text/javascript" src="/onenote/mode/mirc/mirc.js"></script>
    <script type="text/javascript" src="/onenote/mode/mllike/mllike.js"></script>
    <script type="text/javascript" src="/onenote/mode/modelica/modelica.js"></script>
    <script type="text/javascript" src="/onenote/mode/mscgen/mscgen.js"></script>
    <script type="text/javascript" src="/onenote/mode/mumps/mumps.js"></script>
    <script type="text/javascript" src="/onenote/mode/nginx/nginx.js"></script>
    <script type="text/javascript" src="/onenote/mode/nsis/nsis.js"></script>
    <script type="text/javascript" src="/onenote/mode/ntriples/ntriples.js"></script>
    <script type="text/javascript" src="/onenote/mode/octave/octave.js"></script>
    <script type="text/javascript" src="/onenote/mode/oz/oz.js"></script>
    <script type="text/javascript" src="/onenote/mode/pascal/pascal.js"></script>
    <script type="text/javascript" src="/onenote/mode/pegjs/pegjs.js"></script>
    <script type="text/javascript" src="/onenote/mode/perl/perl.js"></script>
    <script type="text/javascript" src="/onenote/mode/php/php.js"></script>
    <script type="text/javascript" src="/onenote/mode/pig/pig.js"></script>
    <script type="text/javascript" src="/onenote/mode/powershell/powershell.js"></script>
    <script type="text/javascript" src="/onenote/mode/properties/properties.js"></script>
    <script type="text/javascript" src="/onenote/mode/protobuf/protobuf.js"></script>
    <script type="text/javascript" src="/onenote/mode/pug/pug.js"></script>
    <script type="text/javascript" src="/onenote/mode/puppet/puppet.js"></script>
    <script type="text/javascript" src="/onenote/mode/python/python.js"></script>
    <script type="text/javascript" src="/onenote/mode/r/r.js"></script>
    <script type="text/javascript" src="/onenote/mode/rpm/rpm.js"></script>
    <script type="text/javascript" src="/onenote/mode/rst/rst.js"></script>
    <script type="text/javascript" src="/onenote/mode/ruby/ruby.js"></script>
    <script type="text/javascript" src="/onenote/mode/rust/rust.js"></script>
    <script type="text/javascript" src="/onenote/mode/sas/sas.js"></script>
    <script type="text/javascript" src="/onenote/mode/sass/sass.js"></script>
    <script type="text/javascript" src="/onenote/mode/scheme/scheme.js"></script>
    <script type="text/javascript" src="/onenote/mode/shell/shell.js"></script>
    <script type="text/javascript" src="/onenote/mode/sieve/sieve.js"></script>
    <script type="text/javascript" src="/onenote/mode/slim/slim.js"></script>
    <script type="text/javascript" src="/onenote/mode/smalltalk/smalltalk.js"></script>
    <script type="text/javascript" src="/onenote/mode/smarty/smarty.js"></script>
    <script type="text/javascript" src="/onenote/mode/solr/solr.js"></script>
    <script type="text/javascript" src="/onenote/mode/soy/soy.js"></script>
    <script type="text/javascript" src="/onenote/mode/sparql/sparql.js"></script>
    <script type="text/javascript" src="/onenote/mode/spreadsheet/spreadsheet.js"></script>
    <script type="text/javascript" src="/onenote/mode/sql/sql.js"></script>
    <script type="text/javascript" src="/onenote/mode/stex/stex.js"></script>
    <script type="text/javascript" src="/onenote/mode/stylus/stylus.js"></script>
    <script type="text/javascript" src="/onenote/mode/swift/swift.js"></script>
    <script type="text/javascript" src="/onenote/mode/tcl/tcl.js"></script>
    <script type="text/javascript" src="/onenote/mode/textile/textile.js"></script>
    <script type="text/javascript" src="/onenote/mode/tiddlywiki/tiddlywiki.js"></script>
    <script type="text/javascript" src="/onenote/mode/tiki/tiki.js"></script>
    <script type="text/javascript" src="/onenote/mode/toml/toml.js"></script>
    <script type="text/javascript" src="/onenote/mode/tornado/tornado.js"></script>
    <script type="text/javascript" src="/onenote/mode/troff/troff.js"></script>
    <script type="text/javascript" src="/onenote/mode/ttcn/ttcn.js"></script>
    <script type="text/javascript" src="/onenote/mode/ttcn-cfg/ttcn-cfg.js"></script>
    <script type="text/javascript" src="/onenote/mode/turtle/turtle.js"></script>
    <script type="text/javascript" src="/onenote/mode/twig/twig.js"></script>
    <script type="text/javascript" src="/onenote/mode/vb/vb.js"></script>
    <script type="text/javascript" src="/onenote/mode/vbscript/vbscript.js"></script>
    <script type="text/javascript" src="/onenote/mode/velocity/velocity.js"></script>
    <script type="text/javascript" src="/onenote/mode/verilog/verilog.js"></script>
    <script type="text/javascript" src="/onenote/mode/vhdl/vhdl.js"></script>
    <script type="text/javascript" src="/onenote/mode/vue/vue.js"></script>
    <script type="text/javascript" src="/onenote/mode/webidl/webidl.js"></script>
    <script type="text/javascript" src="/onenote/mode/xml/xml.js"></script>
    <script type="text/javascript" src="/onenote/mode/xquery/xquery.js"></script>
    <script type="text/javascript" src="/onenote/mode/yacas/yacas.js"></script>
    <script type="text/javascript" src="/onenote/mode/yaml-frontmatter/yaml-frontmatter.js"></script>
    <script type="text/javascript" src="/onenote/mode/z80/z80.js"></script>

    <!-- Theme-->
    <link rel="stylesheet" type="text/css" href="/onenote/theme/3024-day.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/3024-night.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/abcdef.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/ambiance.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/base16-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/base16-light.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/bespin.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/blackboard.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/cobalt.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/colorforth.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/darcula.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/duotone-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/duotone-light.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/eclipse.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/elegant.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/erlang-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/gruvbox-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/hopscotch.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/icecoder.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/idea.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/isotope.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/lesser-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/liquibyte.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/lucario.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/material.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/mbo.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/mdn-like.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/midnight.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/monokai.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/neat.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/neo.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/night.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/nord.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/oceanic-next.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/panda-syntax.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/paraiso-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/paraiso-light.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/pastel-on-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/railscasts.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/rubyblue.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/seti.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/shadowfox.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/solarized.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/ssms.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/the-matrix.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/tomorrow-night-bright.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/tomorrow-night-eighties.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/ttcn.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/twilight.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/vibrant-ink.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/xq-dark.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/xq-light.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/yeti.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/yonce.css" />
    <link rel="stylesheet" type="text/css" href="/onenote/theme/zenburn.css" />

    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #F0F0F0;
            height: 100%;
            overflow: auto;
        }
        
        #large-container {
            /* width: 3000px; */
            /* height: 3000px;  */
            overflow: hidden;
        }
        
        #scroll-container {
            width: calc(100% - 22px);
            height: calc(100vh - 22px);
            overflow: auto;
            margin: 10px;
            border: 1px solid grey;
        }
        
        .emoticon {
            width: 100px;
            height: 100px;
        }

        /* #container {
            background-color: #fff;
        } */
    </style>
   
   
</head>
<body>
	 
	<div id="view_div">
        <!-- canvas stage -->
        <div id="scroll-container">
            <div id="large-container">
                <div id="container">



                </div>
            </div>
        </div>
        
        <!-- 갖가지 첨부 내용출력 -->
        
    </div>

</body>

<script>


		
	
	var data = '${ pageVo.page_contents }';

	console.log(data);
	
    var width = window.innerWidth;
    var height = window.innerHeight;
    
    
    
    var layer = new Konva.Layer();
	var stage = new Konva.Stage({
        container: 'container',
        width: width,
        height: height,
    });

    stage.addName('stage');
    layer.addName('layer');

    if (data != '') {
        stage = Konva.Node.create(data, 'container');

        //이미지파일 직렬화
        stage.find('Image').forEach((imageNode) => {
            const src = imageNode.getAttr('src');
            const image = new Image();
            image.onload = () => {
                imageNode.image(image);
                imageNode.getLayer().batchDraw();
            }
            image.src = src;
        });
    }
    stage.add(layer);
	
    if(${ pageVo.bg_color != null }) {
    	$('#container').css('background-color', '${ pageVo.bg_color }');
    }
    
    
  	//DB에 저장한 Code Data 그려주기
    if(${ page_sourceList != null }){
    	
    	drawCodeTemplate();	//div, textarea  생성
    	drawCodeMirror();	//textarea CodeMirror 로 변환
    	
    }
  	
  	//DB에 저장한 Video 그려주기
 	if(${ page_videoList != null }){
    	drawVideoTemplate();	//div, handle 생성
    	drawVideo();			//Youtube iframe 그리기
    }
  	
 	//DB에 저장한 Link 그려주기
 	if(${ page_linkList != null }){
    	drawLinkTemplate();	//div 생성
    	drawLink();			//link 그리기
    }
    
    
    //코드작성 textarea, div 생성
    function drawCodeTemplate(){
    	
    	var code_num = 1000;
    	
    	<c:forEach items='${ page_sourceList }' var="source">
    	
    		var code_contents = '${ source.source_contents }';
    	
    		code_num++;
    		
    		//textarea 생성 id 부여
	    	var textarea = document.createElement('textarea');
	    	textarea.id = 'textarea' + code_num;
	    	$(textarea).addClass('textarea');
	    	
	    	//줄바꿈 <br>태그로 치환된 데이터값 다시 줄바꿈으로 치환
	    	var render_contents = code_contents.split('<br/>').join("\r\n");
	    	$(textarea).val(render_contents);
	    	
	    	//div 생성
	    	var code_div = document.createElement('div');
	        code_div.id = 'code_div' + code_num;
	        $(code_div).addClass('code_div');
	        
	        
	        //view_div에 생성한 div 넣기
	        $('#view_div').append(code_div);
	    	
	        //div에 textarea 추가
	        $('#code_div'+code_num).append(textarea);
	        
	  	</c:forEach>
    }
    
    //drawCodeTemplate CodeMirror 변환
    function drawCodeMirror(){
    	
    	var code_num2 = 1000;
    	
		<c:forEach items='${ page_sourceList }' var="source">
    		
			code_num2++;
	    	
	    	var code_mode = '${ source.source_mode }';
	    	var code_theme = '${ source.source_theme }';
	    	
	    	var css_top = '${ source.css_top }';
	    	var css_left = '${ source.css_left }';
	    	
	    	var code_editor = null;
	    	
	    	//CodeMirror 생성
	        code_editor = CodeMirror.fromTextArea(document.getElementById('textarea' + code_num2), {
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
	        $("#code_div" + code_num2).draggable({
	            containment: "#container",
	            scroll: true
	        });
	
	        // div가 생성될 위치값 
	        $("#code_div" + code_num2).css('left', css_left);
	        $("#code_div" + code_num2).css('top', css_top);
	        
	        //매우중요 block 
	        //block = width값 사이즈에 맞게 고정
	        //absolute = 영역에 속해 있지 않은 단독 고정 위치
	        $("#code_div" + code_num2).css('display', 'block');
	        $("#code_div" + code_num2).css('position', 'absolute');
	        
	        
	        
	
	     </c:forEach>
    }
    
  	//비디오 div 생성 - handle 생성 x
    function drawVideoTemplate(){
    	
    	var video_num = 1000;
    	
    	<c:forEach items='${ page_videoList }' var="video">
    	
    	video_num++;
    	
    	//video div 생성
    	var video_div = document.createElement('div');
    	video_div.id = 'video_div' + video_num;
    	
    	$(video_div).addClass('video_div');
        
        //view_div에 생성한 div 넣기
        $('#view_div').append(video_div);
        
        </c:forEach>
    }
 	
  	//Youdute iframe 생성
    function drawVideo(){
    	
    	var video_num2 = 1000;
    	
    	<c:forEach items='${ page_videoList }' var="video">
    		
    		video_num2++;
    		
    		var video_link = '${ video.video_link }';
    		var video_css_top = '${ video.video_css_top }';
    		var video_css_left = '${ video.video_css_left }';
        	
    		var iframe = document.createElement('iframe');
    	    iframe.id = "iframe" + video_num2;
    	    iframe.width = 560;
    	    iframe.height = 315;
    	    iframe.src = video_link;
    	    iframe.frameborder = 0;
    	    iframe.allow = 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture';
    	    iframe.allowfullscreen = true;
    	    iframe.draggable = true;

    	    $('#video_div'+video_num2).append(iframe);
    	    
    	   
    	    
    	    //위치조정 handle - show, hide 이벤트 속성 추가
    	    $("#video_div" + video_num2).attr('onmouseenter', "showHandle("+video_num2+");");
    	    $("#video_div" + video_num2).attr('onmouseleave', "hideHandle("+video_num2+");");
    	    
    	    // div가 생성될 위치값 
    	    $("#video_div" + video_num2).css('left', video_css_left);
    	    $("#video_div" + video_num2).css('top', video_css_top);
    	    
    	    //매우중요 block 
    	    //block = width값 사이즈에 맞게 고정
    	    //absolute = 영역에 속해 있지 않은 단독 고정 위치
    	    $("#video_div" + video_num2).css('display', 'block');
    	    $("#video_div" + video_num2).css('position', 'absolute');
            
           
		</c:forEach>
    }
  	
  //링크 div 생성
    function drawLinkTemplate(){
    	
    	var link_num = 1000;
    	
    	<c:forEach items='${ page_linkList }' var="link">
    	
    		link_num++;
    	
	    	//video div 생성
	    	var link_div = document.createElement('div');
	    	link_div.id = 'link_div' + link_num;
	    	$(link_div).addClass('link_div');
			
	    	
	        //view_div에 생성한 div 넣기
	        $('#view_div').append(link_div);
	        
	    
        </c:forEach>
    }
 	
  	//링크 생성
    function drawLink(){
    	
    	var link_num2 = 1000;
    	
    	<c:forEach items='${ page_linkList }' var="link">
    		
    		link_num2++;
    		
    		var link_address = '${ link.link_address }';
    		var link_css_top = '${ link.link_css_top }';
    		var link_css_left = '${ link.link_css_left }';
        	
    		var a = document.createElement('a');
    	    a.id = "link" + link_num2;
    	    a.href = link_address;
    	    a.style = "font-size: 30px; color: #489BF0;";
    	    a.text = link_address;
    	    
    	    $('#link_div'+link_num2).append(a);
    	    
    	    // div가 생성될 위치값 
    	    $("#link_div" + link_num2).css('left', link_css_left);
    	    $("#link_div" + link_num2).css('top', link_css_top);
    	    
    	    //매우중요 block 
    	    //block = width값 사이즈에 맞게 고정
    	    //absolute = 영역에 속해 있지 않은 단독 고정 위치
    	    $("#link_div" + link_num2).css('display', 'block');
    	    $("#link_div" + link_num2).css('position', 'absolute');
           
		</c:forEach>
    }
    
    
    
</script>


</html>