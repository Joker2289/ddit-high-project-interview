<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
    <script src="https://unpkg.com/konva@3.2.0/konva.min.js"></script>
    <script src="https://unpkg.com/konva@3.2.3/konva.min.js"></script>

    <!-- jquery-ui-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- FileSaver-->
<!--    <script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
   
<!--    <script src="/html2/html2canvas.js"></script>-->
    
    <!-- html2canvas : tag를 캡쳐하여 image로 변환-->
<!--    <script src="http://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>-->
<!--    <script src="/html2/html2canvas.min.js"></script>-->




    <!--    jquery-ui - 1.12.4버전과 충돌-->
    <!--    <script src="/z_Test/jquery-3.3.1.min.js"></script>-->


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
    <script type="text/javascript" src="/onenote/mode/julia/julia.js"></script>
    <script type="text/javascript" src="/onenote/mode/livescript/livescript.js"></script>
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
    <script type="text/javascript" src="/onenote/mode/q/q.js"></script>
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
            width: 3000px;
            height: 3000px;
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

        #container {
            background-color: lightpink;
            width: 3000px;
            height: 3000px;

        }
        
        
/*        
        //monospace font 설정
        @font-face {
            font-family: monospace;
            src: url(https://www.fontsquirrel.com/fonts/download/MonospaceTypewriter);
        }
*/
        
    </style>
   
   
</head>
<body>
	 <div role="tabpanel">

        <ul class="nav nav-tabs tab-menu" role="tablist">
            <li role="presentation" class="active"><a href="#textPage" aria-controls="textPage" role="tab" data-toggle="tab">TEXT</a></li>
            <li role="presentation"><a href="#drawingPage" aria-controls="drawingPage" role="tab" data-toggle="tab">그리기</a></li>
            <li role="presentation"><a href="#insertPage" aria-controls="insertPage" role="tab" data-toggle="tab">삽입</a></li>
            <li role="presentation"><a href="#viewPage" aria-controls="viewPage" role="tab" data-toggle="tab">보기</a></li>
        </ul>


        <div class="tab-content">
            <div id="textPage" role="tabpanel" class="tab-pane active">
                <!-- 텍스트 추가-->
                <button id="addText" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="텍스트 추가"><i class="fas fa-font"></i></button>
                <!-- 폰트크기 변경-->
                <select id="fontSize" disabled>
                    <option value="" hidden>폰트크기변경</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="18">18</option>
                    <option value="20">20</option>
                    <option value="22">22</option>
                    <option value="24">24</option>
                    <option value="26">26</option>
                    <option value="28">28</option>
                    <option value="30">30</option>
                    <option value="36">36</option>
                    <option value="48">48</option>
                    <option value="72">72</option>
                </select>

                <!-- 폰트체 변경-->
                <select id="font" disabled>
                    <option value="" hidden>폰트체변경</option>
                    <option value="Jua">
                        <p style="font: Jua">Jua</p>
                    </option>
                    <option value="Nanum Gothic" style="font-family: 'Nanum Gothic', sans-serif;">나눔고딕</option>
                    <option value="Nanum Pen Script">나눔 펜 스크립트</option>
                    <option value="Do Hyeon">두 현</option>
                </select>

                <div class="dropdown">

                    <button id="bgColor" class="btn btn-default" data-toggle="dropdown" title="텍스트 배경색" disabled><i class="material-icons" style="font-size:19px">font_download</i></button>


                    <button id="fontColor" class="btn btn-default" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-placement="bottom" title="글씨 색" disabled>
                        <i class="material-icons" style="font-size:15px">format_color_text</i>
                    </button>

                    <ul class="dropdown-menu" role="menu" aria-labelledby="fontColor">
                        <div id="color-picker-container"></div>
                        <button id="pickerComplete"> 선택 완료 </button>
                    </ul>

                    <button id="fontBold" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="굵게" disabled><i class="fas fa-bold"></i></button>
                    <button id="fontItalic" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="기울게" disabled><i class="fas fa-italic"></i></button>
                    <button id="fontUnderLine" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="밑줄" disabled><i class="fas fa-underline"></i></button>
                    <button id="fontDeleteLine" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="취소선" disabled><i class="fas fa-strikethrough"></i></button>

                </div>


                <button id="alignLeft" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="왼쪽 정렬" disabled><i class="fas fa-align-left"></i></button>
                <button id="alignCenter" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="가운데 정렬" disabled><i class="fas fa-align-center"></i></button>
                <button id="alignRight" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="오른쪽 정렬" disabled><i class="fas fa-align-right"></i></button>

            </div>
            <!--textpage-->


            <!-- drawingPage -->
            <div id="drawingPage" role="tabpanel" class="tab-pane">
                <button id="addSquare" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="사각형"><i class="far fa-square"></i></button>

                <button id="addTriangle" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="삼각형" style="font-size:20px">△</button>

                <button id="addCircle" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="원"><i class="far fa-circle"></i></button>

                <button id="addLine" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="선" style="font-size:15px">/</button>

                <button id="addArrow" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="한쪽 화살표" style="font-size:15px">↗</button>

                <button id="addDArrow" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="양쪽 화살표">⤢</button>

                <div class="dropdown">
                    <select id="strokeWidth" disabled>
                        <option value="" hidden>선굵기 변경</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>

                    <button id="strokeColor" class="btn btn-default" data-toggle="dropdown" title="텍스트 배경색" disabled><i class="fas fa-palette"></i></button>

                    <ul class="dropdown-menu" role="menu" aria-labelledby="strokeColor">
                        <div id="color-picker-stroke"></div>
                        <button id="pickerComplete"> 선택 완료 </button>
                    </ul>


                </div>

            </div>

            <div id="insertPage" role="tabpanel" class="tab-pane">

                <button id="imageBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="bottom" title="이미지 삽입">
                    <i class="far fa-images"></i>
                </button>
                <input id="imageStorage" class="btn btn-primary" type="file" onchange="addImg(this);">
                <input type="hidden" id='tmpTag'>


                <button id="codeBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="bottom" title="코드 작성">
                    <i class="fas fa-code"></i>
                </button>

                <button id="linkBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="bottom" title="링크 삽입">
                    <i class="fas fa-link"></i>
                </button>

                <button id="videoBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="bottom" title="동영상 링크 삽입">
                    <i class="fas fa-video"></i>
                </button>

                <button id="emoticonBtn" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#emoticonList" aria-expanded="false" aria-controls="emoticonList">
                    <i class="fab fa-etsy"></i>
                </button>




            </div>



            <div id="viewPage" role="tabpanel" class="tab-pane">
                <button id="imageSaveBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="bottom" title="이미지 저장">
                    <i class="fas fa-link"></i>
                </button>
            </div>



        </div>
        <!--tab-content-->

    </div>
    <!--tab-pannel-->


    <!-- emoticon 숨김 패널-->
    <!-- .collapse / 숨김 -->
    <!-- .collapsing / 전환중 적용-->
    <!-- .collapse.in / 보이는 콘텐츠-->
    <div class="collapse" id="emoticonList">
        <img src="/onenote/emoticon/rose.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/cony.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/brown.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/james.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/sally.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/holly.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/joker.png" class="emoticon" draggable="true" />
        <img src="/onenote/emoticon/moon.png" class="emoticon" draggable="true" />
    </div>


    <div id="test">
        <!-- canvas stage-->
        <div id="scroll-container">
            <div id="large-container">
                <div id="container">



                </div>
            </div>
        </div>



    </div>



    <!-- code 작성 modal-->
    <div class="jk-modalsasun">
        <div class="jk-modal">
            <div class="jk-row">
                <div id="modal-head" class="jk-modal-head">
                    <h1>코드 작성</h1>
                </div>
            </div>


            <div class="jk-row">
                <div id="modal-body" class="jk-modal-body">


                    <select id='modeSelect'>
                        <option value="" selected>언어 선택</option>
                        <option value="apl">apl</option>
                        <option value="asciiarmor">asciiarmor</option>
                        <option value="asn.1">asn.1</option>
                        <option value="asterisk">asterisk</option>
                        <option value="brainfuck">brainfuck</option>
                        <option value="clike">clike</option>
                        <option value="clojure">clojure</option>
                        <option value="cmake">cmake</option>
                        <option value="cobol">cobol</option>
                        <option value="coffeescript">coffeescript</option>
                        <option value="commonlisp">commonlisp</option>
                        <option value="crystal">crystal</option>
                        <option value="css">css</option>
                        <option value="cypher">cypher</option>
                        <option value="d">d</option>
                        <option value="dart">dart</option>
                        <option value="diff">diff</option>
                        <option value="django">django</option>
                        <option value="dockerfile">dockerfile</option>
                        <option value="dtd">dtd</option>
                        <option value="dylan">dylan</option>
                        <option value="ebnf">ebnf</option>
                        <option value="ecl">ecl</option>
                        <option value="eiffel">eiffel</option>
                        <option value="elm">elm</option>
                        <option value="erlang">erlang</option>
                        <option value="factor">factor</option>
                        <option value="fcl">fcl</option>
                        <option value="forth">forth</option>
                        <option value="fortran">fortran</option>
                        <option value="gas">gas</option>
                        <option value="gfm">gfm</option>
                        <option value="gherkin">gherkin</option>
                        <option value="go">go</option>
                        <option value="groovy">groovy</option>
                        <option value="haml">haml</option>
                        <option value="handlebars">handlebars</option>
                        <option value="haskell">haskell</option>
                        <option value="haskell-literate">haskell-literate</option>
                        <option value="haxe">haxe</option>
                        <option value="htmlembedded">htmlembedded</option>
                        <option value="htmlmixed">htmlmixed</option>
                        <option value="http">http</option>
                        <option value="idl">idl</option>
                        <option value="javascript">javascript</option>
                        <option value="jinja2">jinja2</option>
                        <option value="jsx">jsx</option>
                        <option value="julia">julia</option>
                        <option value="livescript">livescript</option>
                        <option value="lua">lua</option>
                        <option value="markdown">markdown</option>
                        <option value="mathematica">mathematica</option>
                        <option value="mbox">mbox</option>
                        <option value="mirc">mirc</option>
                        <option value="mllike">mllike</option>
                        <option value="modelica">modelica</option>
                        <option value="mscgen">mscgen</option>
                        <option value="mumps">mumps</option>
                        <option value="nginx">nginx</option>
                        <option value="nsis">nsis</option>
                        <option value="ntriples">ntriples</option>
                        <option value="octave">octave</option>
                        <option value="oz">oz</option>
                        <option value="pascal">pascal</option>
                        <option value="pegjs">pegjs</option>
                        <option value="perl">perl</option>
                        <option value="php">php</option>
                        <option value="pig">pig</option>
                        <option value="powershell">powershell</option>
                        <option value="properties">properties</option>
                        <option value="protobuf">protobuf</option>
                        <option value="pug">pug</option>
                        <option value="pupuppetg">puppet</option>
                        <option value="python">python</option>
                        <option value="q">q</option>
                        <option value="r">r</option>
                        <option value="rpm">rpm</option>
                        <option value="rst">rst</option>
                        <option value="ruby">ruby</option>
                        <option value="rust">rust</option>
                        <option value="sas">sas</option>
                        <option value="sass">sass</option>
                        <option value="scheme">scheme</option>
                        <option value="shell">shell</option>
                        <option value="sieve">sieve</option>
                        <option value="slim">slim</option>
                        <option value="smalltalk">smalltalk</option>
                        <option value="smarty">smarty</option>
                        <option value="solr">solr</option>
                        <option value="soy">soy</option>
                        <option value="sparql">sparql</option>
                        <option value="spreadsheet">spreadsheet</option>
                        <option value="sql">sql</option>
                        <option value="stex">stex</option>
                        <option value="stylus">stylus</option>
                        <option value="swift">swift</option>
                        <option value="tcl">tcl</option>
                        <option value="textile">textile</option>
                        <option value="tiddlywiki">tiddlywiki</option>
                        <option value="tiki">tiki</option>
                        <option value="toml">toml</option>
                        <option value="tornado">tornado</option>
                        <option value="troff">troff</option>
                        <option value="ttcn">ttcn</option>
                        <option value="ttcn-cfg">ttcn-cfg</option>
                        <option value="turtle">turtle</option>
                        <option value="twig">twig</option>
                        <option value="vb">vb</option>
                        <option value="vbscript">vbscript</option>
                        <option value="velocity">velocity</option>
                        <option value="verilog">verilog</option>
                        <option value="vhdl">vhdl</option>
                        <option value="vue">vue</option>
                        <option value="webidl">webidl</option>
                        <option value="xml">xml</option>
                        <option value="xquery">xquery</option>
                        <option value="yacas">yacas</option>
                        <option value="yaml-frontmatter">yaml-frontmatter</option>
                        <option value="z80">z80</option>
                    </select>


                    <select id='themeSelect'>
                        <option value="" selected>테마 선택</option>
                        <option value="3024-day">3024-day</option>
                        <option value="3024-night">3024-night</option>
                        <option value="abcdef">abcdef</option>
                        <option value="ambiance">ambiance</option>
                        <option value="base16-dark">base16-dark</option>
                        <option value="base16-light">base16-light</option>
                        <option value="bespin">bespin</option>
                        <option value="blackboard">blackboard</option>
                        <option value="cobalt">cobalt</option>
                        <option value="colorforth">colorforth</option>
                        <option value="darcula">darcula</option>
                        <option value="duotone-dark">duotone-dark</option>
                        <option value="duotone-light">duotone-light</option>
                        <option value="eclipse">eclipse</option>
                        <option value="elegant">elegant</option>
                        <option value="erlang-dark">erlang-dark</option>
                        <option value="gruvbox-dark">gruvbox-dark</option>
                        <option value="hopscotch">hopscotch</option>
                        <option value="icecoder">icecoder</option>
                        <option value="idea">idea</option>
                        <option value="isotope">isotope</option>
                        <option value="lesser-dark">lesser-dark</option>
                        <option value="liquibyte">liquibyte</option>
                        <option value="lucario">lucario</option>
                        <option value="material">material</option>
                        <option value="mbo">mbo</option>
                        <option value="mdn-like">mdn-like</option>
                        <option value="midnight">midnight</option>
                        <option value="monokai">monokai</option>
                        <option value="neat">neat</option>
                        <option value="neo">neo</option>
                        <option value="night">night</option>
                        <option value="nord">nord</option>
                        <option value="oceanic-next">oceanic-next</option>
                        <option value="panda-syntax">panda-syntax</option>
                        <option value="paraiso-dark">paraiso-dark</option>
                        <option value="paraiso-light">paraiso-light</option>
                        <option value="pastel-on-dark">pastel-on-dark</option>
                        <option value="railscasts">railscasts</option>
                        <option value="rubyblue">rubyblue</option>
                        <option value="seti">seti</option>
                        <option value="shadowfox">shadowfox</option>
                        <option value="solarized">solarized</option>
                        <option value="ssms">ssms</option>
                        <option value="the-matrix">the-matrix</option>
                        <option value="tomorrow-night-bright">tomorrow-night-bright</option>
                        <option value="tomorrow-night-eighties">tomorrow-night-eighties</option>
                        <option value="ttcn">ttcn</option>
                        <option value="twilight">twilight</option>
                        <option value="vibrant-ink">vibrant-ink</option>
                        <option value="xq-dark">xq-dark</option>
                        <option value="xq-light">xq-light</option>
                        <option value="yeti">yeti</option>
                        <option value="yonce">yonce</option>
                        <option value="zenburn">zenburn</option>
                    </select>

                    <!--                    style="color:red; font-size:20px;-->
                    <!-- code를 image로 변환할 영억-->
                    <!--                    <div id="code_capture">-->
                    <!-- code 입력-->
                    <textarea id='code_editor'>
//테마 선택
$('#themeSelect').on('change', function () {
    code_theme = $('#themeSelect').val();

    editor.setOption('theme', code_theme);
    editor.save();
});
editor.setSize(600, 800);
                    </textarea>




                </div>
            </div>

            <div class="jk-row">
                <div id="modal-footer" class="jk-modal-footer">
                    <button id="completeBtn" class="jk-join-btn" type="button">작성</button>
                    <button id="closeBtn" class="jk-close-btn" type="button">닫기</button>
                </div>
            </div>

        </div>
    </div>
    
<%-- 	
	<%@ include file="/WEB-INF/views/module/header_D.jsp" %>
	
	<%@ include file="/WEB-INF/views/module/side_D.jsp" %> --%>
	
	
</body>

<script>
    //$('#code_capture').hide();

    //이미지 첨부 - 미완
    $('#imageStorage').hide();

    $('#imageBtn').on('click', function() {
        $('#imageStorage').click();
    });

    //tooltip
    $('[data-toggle="tooltip"]').on('mouseover', function() {
        $('[data-toggle="tooltip"]').tooltip();
    });

    var options = {};
    $("#effect").hide();

    var colorPicker = new iro.ColorPicker("#color-picker-container", {
        width: 250,
        color: "#f00", //기본색
        borderWidth: 3, //컨트롤 테두리 너비입니다
        borderColor: "#000000", //테두리 색
        padding: 1,
        handleRadius: 10, //포인트 반지름
    });

    var strokeColorPicker = new iro.ColorPicker("#color-picker-stroke", {
        width: 250,
        color: "#f00", //기본색
        borderWidth: 3, //컨트롤 테두리 너비입니다
        borderColor: "#000000", //테두리 색
        padding: 1,
        handleRadius: 10, //포인트 반지름
    });






    //해결해야함

    // 1. 한줄 띄우고 작성된 text가 있을시 data load error
    // 2. load 된 tf 안보임
    // 3. 스테이지 클릭시 모든 rect hide for문이용
    // 4. 클릭했을때 zIndex 


    var data = '';

    var node_num = 0;
    var state = '';
    //var width = window.innerWidth;
    var width = 3000;
    //var height = window.innerWidth;
    var height = 3000;
    var selectNode;
    var today = new Date();

    var layer = new Konva.Layer();

    var stage = new Konva.Stage({
        container: 'container',
        width: width,
        height: height,
    });

    stage.addName('stage');
    layer.addName('layer ' + today.getDate());

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

    //    var scrollContainer = document.getElementById('scroll-container');
    //
    //    console.log(scrollContainer);
    //
    //    scrollContainer.addEventListener('scroll', function() {
    //        var dx = scrollContainer.scrollLeft;
    //        var dy = scrollContainer.scrollTop;
    //        stage.container().style.transform = 'translate(' + dx + 'px, ' + dy + 'px)';
    //        stage.x(-dx);
    //        stage.y(-dy);
    //        stage.batchDraw();
    //    })

    var target;

    //text node그룹 변수
    var group, textNode, placeHolder, tf, rect; //그룹, 텍스트노드, 입력, 트랜스폼, 테두리
    textNode = new Konva.Text();
    placeHolder = new Konva.Text();
    rect = new Konva.Rect();
    tf = new Konva.Transformer();


    $('#videoBtn').on('click', function() {
        addVideo();
    });


    //textPage js
    //font 효과

    //fontSize 변경
    $("#fontSize").on('change', function() {
        var size = $('#fontSize').val();
        selectNode.fontSize(size);
        rectResize();
        layer.draw();
    });

    var color_flag;

    //fontBgColor 변경
    $('#bgColor').on('click', function() {

        color_flag = 'bgColor';

        colorPicker.on('color:change', ColorChange);

        function ColorChange(color, changes) {

            if (selectNode.hasName('text')) {
                if (color_flag == 'bgColor') {
                    group = selectNode.findAncestor('Group');
                    rect = group.findOne('.rect');
                    rect.fill(color.hexString);

                    layer.draw();
                }
            }
        }
    });

    //fontColor 변경
    $('#fontColor').on('click', function() {

        color_flag = 'fontColor';

        colorPicker.on('color:change', onColorChange);

        function onColorChange(color, changes) {


            if (selectNode.hasName('text')) {
                if (color_flag == 'fontColor') {
                    selectNode.fill(color.hexString);
                    layer.draw();
                }
            }
        }
    });


    $('#pickerComplete').on('click', function() {
        $('#fontColor').click();
    });


    //font체 변경
    $("#font").on('change', function() {
        var font = $('#font').val();

        //폰트 렌더링
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        ctx.font = 'normal 20px Kavivanar';

        var isFontLoaded = false;
        var TEXT_TEXT = 'Some test text;';
        var initialMeasure = ctx.measureText(TEXT_TEXT);
        var initialWidth = initialMeasure.width;


        function whenFontIsLoaded(callback, attemptCount) {
            if (attemptCount === undefined) {
                attemptCount = 0;
            }
            if (attemptCount >= 20) {
                callback();
                return;
            }
            if (isFontLoaded) {
                callback();
                return;
            }
            const metrics = ctx.measureText(TEXT_TEXT);
            const width = metrics.width;
            if (width !== initialWidth) {
                isFontLoaded = true;
                callback();
            } else {
                setTimeout(function() {
                    whenFontIsLoaded(callback, attemptCount + 1);
                }, 1);
            }
        }
        whenFontIsLoaded(function() {
            // set font style when font is loaded
            // so Konva will recalculate text wrapping if it has limited width
            selectNode.fontFamily(font);
            rectResize();
            layer.draw();
        })

    });

    //fontStyle 변경

    //폰트 Bold체 변경
    $("#fontBold").on('click', function() {

        var fontStyle = selectNode.fontStyle();

        if (fontStyle.search('normal') > -1) {
            fontStyle = fontStyle.replace('normal', '');
            selectNode.fontStyle(fontStyle);
        }

        if (fontStyle.search('bold') == -1) {
            selectNode.fontStyle(fontStyle + ' bold');
            $("#fontBold").css('background-color', 'gray');
        } else {
            fontStyle = fontStyle.replace('bold', '');
            selectNode.fontStyle(fontStyle);
            $("#fontBold").css('background-color', 'white');
        }

        layer.draw();

    });

    //폰트 Italic체 변경
    $("#fontItalic").on('click', function() {

        var fontStyle = selectNode.fontStyle();

        if (fontStyle.search('normal') > -1) {
            fontStyle = fontStyle.replace('normal', '');
            selectNode.fontStyle(fontStyle);
        }

        if (fontStyle.search('italic') == -1) {
            selectNode.fontStyle(fontStyle + ' italic');
            $("#fontItalic").css('background-color', 'gray');
        } else {
            fontStyle = fontStyle.replace('italic', '');
            selectNode.fontStyle(fontStyle);
            $("#fontItalic").css('background-color', 'white');
        }


        layer.draw();

    });

    //폰트 UnderLine 변경
    $("#fontUnderLine").on('click', function() {

        var fontDecoration = selectNode.textDecoration();

        if (fontDecoration.search('underline') == -1) {
            selectNode.textDecoration(fontDecoration + ' underline');
            $("#fontUnderLine").css('background-color', 'gray');
        } else {
            fontDecoration = fontDecoration.replace('underline', '');
            selectNode.textDecoration(fontDecoration);
            $("#fontUnderLine").css('background-color', 'white');
        }

        layer.draw();
    });



    //폰트 DeleteLine 변경
    $("#fontDeleteLine").on('click', function() {

        var fontDecoration = selectNode.textDecoration();

        if (fontDecoration.search('line-through') == -1) {
            selectNode.textDecoration(fontDecoration + ' line-through');
            $("#fontDeleteLine").css('background-color', 'gray');
        } else {
            fontDecoration = fontDecoration.replace('line-through', '');
            selectNode.textDecoration(fontDecoration);
            $("#fontDeleteLine").css('background-color', 'white');
        }

        layer.draw();
    });

    //폰트 Align 변경
    $("#alignLeft").on('click', function() {

        var fontAlign = selectNode.align();

        if (fontAlign != 'left') {
            selectNode.align('left');
            $("#alignLeft").css('background-color', 'gray');
            $("#alignCenter").css('background-color', 'white');
            $("#alignRight").css('background-color', 'white');
        }

        layer.draw();

    });

    $("#alignCenter").on('click', function() {

        var fontAlign = selectNode.align();

        if (fontAlign != 'center') {
            selectNode.align('center');
            $("#alignLeft").css('background-color', 'white');
            $("#alignCenter").css('background-color', 'gray');
            $("#alignRight").css('background-color', 'white');
        }

        layer.draw();

    });

    $("#alignRight").on('click', function() {

        var fontAlign = selectNode.align();

        if (fontAlign != 'right') {
            selectNode.align('right');
            $("#alignLeft").css('background-color', 'white');
            $("#alignCenter").css('background-color', 'white');
            $("#alignRight").css('background-color', 'gray');
        }

        layer.draw();

    });

    //TEXT 생셩 - 버튼 클릭시 : 마우스 커서 변경, state 변경
    $("#addText").on('click', function() {
        stage.container().style.cursor = 'Text';
        state = 'addText';
        node_num++;
    });



    //drawingPage

    //도형 그리기
    $("#addSquare").on('click', function() {
        state = 'addSquare';
        node_num++;
    });

    $("#addTriangle").on('click', function() {
        state = 'addTriangle';
        node_num++;
    });

    $("#addCircle").on('click', function() {
        state = 'addCircle';
        node_num++;
    });

    $("#addLine").on('click', function() {
        state = 'addLine';
        node_num++;
    });

    $("#addArrow").on('click', function() {
        state = 'addArrow';
        node_num++;
    });

    $("#addDArrow").on('click', function() {
        state = 'addDArrow';
        node_num++;
    });

    //도형 선굵기 번경
    $('#strokeWidth').on('change', function() {
        var strokeWidth = $('#strokeWidth').val();

        if (selectNode.nodeType === 'Group') {
            var tmp_node = selectNode.findOne('.shape');
            tmp_node.strokeWidth(strokeWidth);
        } else {
            selectNode.strokeWidth(strokeWidth);
        }


        layer.draw();
    });

    //도형 선색상 번경
    $('#strokeColor').on('click', function() {

        strokeColorPicker.on('color:change', strokeColorChange);

        function strokeColorChange(color, changes) {
            var tmp_node;

            if (selectNode.hasName('shape')) {
                selectNode.stroke(color.hexString);
            } else if (selectNode.hasName('group')) {
                tmp_node = selectNode.findOne('.shape');
                tmp_node.stroke(color.hexString);
            }

            //arrow 나 d_arrow 는 fill Color 까지 바꾸기 
            if (selectNode.hasName('arrow') || selectNode.hasName('d_arrow')) {

                if (selectNode.nodeType === 'Group') {
                    tmp_node.fill(color.hexString);
                } else {
                    selectNode.fill(color.hexString);
                }

            }

            layer.draw();
        }
    });


    //insertPage

    //이모티콘 버튼 
    $('#emoticonBtn').on('click', function() {
        addEmoticon();
    });

    //코드버튼
    $('#codeBtn').on('click', function() {
        $('.jk-modalsasun').css('display', 'block');
        addCode();
    });


    //viewPage
    $('#imageSaveBtn').on('click', function() {
        html2canvas($('#test'), {

            onrendered: function(canvas) {

                canvas.toBlob(function(blob) {

                    saveAs(blob, 'test.png');

                });

            }

        });
    });




    //    stage.on('mousemove', (e) => {
    //        var dd = stage.getPointerPosition();
    //        console.log(dd);
    //    });

    //stage 클릭
    stage.on('click', (e) => {

        target = e.target;

        var json = stage.toJSON();
        console.log(json);

        //클릭 좌표값 가져오기
        var position = stage.getPointerPosition();
        //console.log(position);
        selectNode = e.target;

        //selectNode.moveToTop();   //indexUp




        //텍스트 생성
        if (state == 'addText') {
            addText(position, node_num);
        }

        //사각형 생성
        if (state == 'addSquare') {
            addSquare(node_num);
        }

        //삼각형 생성
        if (state == 'addTriangle') {
            addTriangle(node_num);
        }

        //원 생성
        if (state == 'addCircle') {
            addCircle(node_num);
        }

        //선 생성
        if (state == 'addLine') {
            addLine(node_num);
        }

        //한쪽화살선 생성
        if (state == 'addArrow') {
            addArrow(node_num);
        }

        //양쪽화살선 생성
        if (state == 'addDArrow') {
            addDArrow(node_num);
        }



        textStyle(); //textStyle 메뉴 초기화
        drawStyle(); //drawStyle 메뉴 초기화


        //stage가 아니라면 node의 layer를 담아줌
        if (target.nodeType === 'Stage') {

            if (target.nodeType !== 'Text' && state == null) {
                dragRange();
            }





            //상태 초기화 마우스 커서 초기화
            state = null;
            stage.container().style.cursor = 'default';
            console.log('state : ' + state);
            layer.draw();
            return;
        }




        layer = target.findAncestor("Layer");
        layer.draw();









        // nodeType : 객체의 타입
        // findAncestor : 부모 찾기 / findAncestors : 부모들을 배열로
        // findOne : 자식하나 찾기 / find : 자식을 배열로 ('Type명') : Type Scope

        //        console.log("타입 : " + e.target.nodeType);
        //        console.log(e.target);
        //
        //        if (selectNode.findAncestor("Group") != null) {
        //            console.log(selectNode.findAncestor("Group").name());
        //        }
        //
        //
        //        if (e.target.nodeType === 'Stage') {
        //            console.log("스테이지 클릭");
        //            if (e.target.findOne('Group') != null) {
        //                console.log(e.target.find('Group'));
        //            }
        //        }


    });

    //키눌렀을때 이벤트
    document.addEventListener('keydown', (e) => {

        console.log(e.keyCode);

        //노드 삭제 
        if ((e.keyCode === 8 && e.altKey) && selectNode.nodeType != 'Stage' &&
            selectNode.nodeType != 'Layer') {

            var destroy_node = null;

            if (selectNode.hasName('text') || selectNode.hasName('square')) {
                destroy_node = selectNode.findAncestor('Group');
            } else {
                destroy_node = selectNode;
            }



            destroy_node.destroy();
            selectNode = null;

            console.log("Destroy : " + destroy_node.name());
            layer.draw();
        }
    });


    //text관련 함수
    function textStyle() {
        //selectBox 
        $('#fontSize').attr('disabled', true);
        $('#fontSize').val('');
        $('#font').attr('disabled', true);
        $('#font').val('');

        //fontStyle
        //버튼 비활성화
        $('#fontColor').attr('disabled', true);
        $('#bgColor').attr('disabled', true);
        $("#fontBold").attr('disabled', true);
        $("#fontItalic").attr('disabled', true);
        $("#fontUnderLine").attr('disabled', true);
        $("#fontDeleteLine").attr('disabled', true);

        //버튼 색
        $("#fontBold").css('background-color', 'white');
        $("#fontItalic").css('background-color', 'white');
        $("#fontUnderLine").css('background-color', 'white');
        $("#fontDeleteLine").css('background-color', 'white');

        //fontAlign
        //버튼 비활성화
        $("#alignLeft").attr('disabled', true);
        $("#alignCenter").attr('disabled', true);
        $("#alignRight").attr('disabled', true);

        //버튼 색
        $("#alignLeft").css('background-color', 'white');
        $("#alignCenter").css('background-color', 'white');
        $("#alignRight").css('background-color', 'white');

        if (selectNode.hasName('text')) {
            //console.log(selectNode);
            //if(group.findOne('.text') != null){
            $('#fontSize').attr('disabled', false);
            $('#fontSize').val(selectNode.fontSize());

            $('#fontColor').attr('disabled', false);
            $('#bgColor').attr('disabled', false);

            $('#font').attr('disabled', false);
            $('#font').val(selectNode.fontFamily());

            //fontStyle
            $("#fontBold").attr('disabled', false);
            $("#fontItalic").attr('disabled', false);
            $("#fontUnderLine").attr('disabled', false);
            $("#fontDeleteLine").attr('disabled', false);

            //fontAlign
            $("#alignLeft").attr('disabled', false);
            $("#alignCenter").attr('disabled', false);
            $("#alignRight").attr('disabled', false);

            var fontStyle = selectNode.fontStyle();
            var fontDecoration = selectNode.textDecoration();
            var fontAlign = selectNode.align();

            if (fontStyle.search('bold') > -1) {
                $("#fontBold").css('background-color', 'gray');
            } else if (fontStyle.search('bold') == -1) {
                $("#fontBold").css('background-color', 'white');
            }

            if (fontStyle.search('italic') > -1) {
                $("#fontItalic").css('background-color', 'gray');
            } else if (fontStyle.search('italic') == -1) {
                $("#fontItalic").css('background-color', 'white');
            }

            if (fontDecoration.search('underline') > -1) {
                $("#fontUnderLine").css('background-color', 'gray');
            } else if (fontDecoration.search('underline') == -1) {
                $("#fontUnderLine").css('background-color', 'white');
            }

            if (fontDecoration.search('line-through') > -1) {
                $("#fontDeleteLine").css('background-color', 'gray');
            } else if (fontDecoration.search('line-through') == -1) {
                $("#fontDeleteLine").css('background-color', 'white');
            }

            if (fontAlign == 'left') {
                $("#alignLeft").css('background-color', 'gray');
            } else if (fontAlign == 'center') {
                $("#alignCenter").css('background-color', 'gray');
            } else if (fontAlign == 'right') {
                $("#alignRight").css('background-color', 'gray');
            }

        }
    }

    function drawStyle() {
        //selectBox 
        $('#strokeWidth').attr('disabled', true);
        $('#strokeWidth').val('');

        //button
        $('#strokeColor').attr('disabled', true);

        if (selectNode.hasName('square') || selectNode.hasName('triangle') ||
            selectNode.hasName('line') || selectNode.hasName('arrow') || selectNode.hasName('d_arrow')) {

            $('#strokeWidth').attr('disabled', false);
            $('#strokeColor').attr('disabled', false);

        }
    }
</script>
<script src="/onenote/js/main_text_js.js"></script>
<script src="/onenote/js/main_drawing_js.js"></script>
<script src="/onenote/js/main_insert_js.js"></script>
<script src="/onenote/js/main_util_js.js"></script>

</html>