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

        #container {
            background-color: #fff;
        }
    </style>
   
   
</head>
<body>
	 <div role="tabpanel">
	
		<!-- 메뉴탭 페이지 네이션 -->
        <ul class="nav nav-tabs tab-menu" role="tablist">
            <li role="presentation" class="active"><a href="#textPage" aria-controls="textPage" role="tab" data-toggle="tab">TEXT</a></li>
            <li role="presentation"><a href="#drawingPage" aria-controls="drawingPage" role="tab" data-toggle="tab">그리기</a></li>
            <li role="presentation"><a href="#insertPage" aria-controls="insertPage" role="tab" data-toggle="tab">삽입</a></li>
            <li role="presentation"><a href="#savePage" aria-controls="savePage" role="tab" data-toggle="tab">저장</a></li>
        </ul>

		<!-- 메뉴탭 div -->
        <div class="tab-content">
        
        	<!-- 텍스트 메뉴탭 -->
            <div id="textPage" role="tabpanel" class="tab-pane active">
            
                <!-- 텍스트 추가 버튼-->
                <button id="addText" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="텍스트 추가">
               		<div class="btn_icon">
               			<i class="fas fa-font"></i>
               		</div>
               		<div class="btn_name">
               			<span>텍스트 추가</span>
               		</div>
               	</button>
               	
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
				

                    
                <!-- 텍스트 컬러픽커 드롭다운 -->
               	<div class="btn-group">
                  <!-- 글자 배경색 변경 --> 	
                  <button id="bgColor" class="btn btn-primary menu_btn" data-toggle="dropdown" title="텍스트 배경색" disabled>
					  	<i class="material-icons" style="font-size:50px">font_download</i>
					  	<div class="btn_name">
	               			<span>배경색 변경</span>
	               		</div>
				  </button>
				  
				  <!-- 글자색 번경 -->
				  <button id="fontColor" class="btn btn-primary menu_btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-placement="bottom" title="글씨 색" disabled>
	                    <i class="material-icons" style="font-size:50px">format_color_text</i>
	                    <div class="btn_name">
	               			<span>글자색 변경</span>
	               		</div>
                  </button>
				  
				  <!-- 드롭다운 메뉴 -->
				  <ul class="dropdown-menu" role="menu">
					    <div id="color-picker-container"></div>
				  </ul>
				</div>

                    
				<!-- Bold체 버튼-->
                <button id="fontBold" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="굵게" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-bold"></i>
                	</div>
                	<div class="btn_name">
                		<span>굵게</span>
                	</div>
                </button>
                
                <!-- Itaric체 버튼 -->
                <button id="fontItalic" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="기울게" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-italic"></i>
                	</div>
                	<div class="btn_name">
                		<span>기울게</span>
                	</div>
                </button>
                
                <!-- 밑줄 버튼 -->
                <button id="fontUnderLine" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="밑줄" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-underline"></i>
                	</div>
                	<div class="btn_name">
                		<span>밑줄</span>
                	</div>
                </button>
                
                <!-- 취소선 버튼 -->
                <button id="fontDeleteLine" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="취소선" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-strikethrough"></i>
                	</div>
					<div class="btn_name">
						<span>취소선</span>
					</div>
				</button>
                
                <!-- 왼쪽 정렬 -->
				<button id="alignLeft" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="왼쪽 정렬" disabled>
					<div class="btn_icon">
						<i class="fas fa-align-left"></i>
					</div>
					<div class="btn_name">
						<span>왼쪽 정렬</span>
					</div>
				</button>
				
				<!-- 가운데 정렬 -->
                <button id="alignCenter" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="가운데 정렬" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-align-center"></i>
                	</div>
                	<div class="btn_name">
                		<span>가운데 정렬</span>
                	</div>
                </button>
                
               	<!-- 오른쪽 정렬 -->
                <button id="alignRight" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="오른쪽 정렬" disabled>
                	<div class="btn_icon">
                		<i class="fas fa-align-right"></i>
                	</div>
                	<div class="btn_name">
                		<span>오른쪽 정렬</span>
                	</div>
                </button>

            </div>
            <!-- textpage -->


            <!-- drawingPage -->
            <div id="drawingPage" role="tabpanel" class="tab-pane">
                
                <!-- 사각형 그리기 -->
                <button id="addSquare" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="사각형">
                	<div class="btn_icon">
                		<i class="far fa-square"></i>
                	</div>
                	<div class="btn_name">
                		<span>사각형 그리기</span>
                	</div>
                </button>

				<!-- 삼각형 그리기 -->
                <button id="addTriangle" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="삼각형">
                	<span style="font-size: 40px; font-weight: bold">△</span>
                	<div class="btn_name">
                		<span>삼각형 그리기</span>
                	</div>
                </button>

				<!-- 원 그리기 -->
                <button id="addCircle" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="원">
                	<div class="btn_icon">
                		<i class="far fa-circle"></i>
                	</div>
                	<div class="btn_name">
                		<span>원 그리기</span>
                	</div>
                </button>

				<!-- 선 그리기 -->
                <button id="addLine" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="선">
                	<span style="font-size: 40px; font-weight: bold">/</span>
                	<div class="btn_name">
                		<span>선 그리기</span>
                	</div>
                </button>
				
				<!-- 한쪽 화살표 -->
                <button id="addArrow" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="한쪽 화살표" style="font-size:15px">
                	<span style="font-size: 40px; font-weight: bold">↗</span>
	               	<div class="btn_name">
	               		<span>한쪽 화살표</span>
	               	</div>
                </button>

				<!-- 양쪽 화살표 -->
                <button id="addDArrow" class="btn btn-primary menu_btn" data-toggle="tooltip" data-placement="bottom" title="양쪽 화살표">
					<span style="font-size: 40px; font-weight: bold">⤢</span>
                	<div class="btn_name">
                		<span>양쪽 화살표</span>
                	</div>
                </button>
                
				<!-- 도형 색변경 -->
                <div class="btn-group">
                	<button id="strokeColor" class="btn btn-primary menu_btn" data-toggle="dropdown" title="텍스트 배경색" disabled>
						<div class="btn_icon">
							<i class="fas fa-fill-drip"></i>
						</div>
						<div class="btn_name">
							<span>도형색 변경</span>
						</div>
					</button>

                    <ul class="dropdown-menu" role="menu">
                        <div id="color-picker-stroke"></div>
                    </ul>
				</div>
				
				 <!-- 선굵기 변경 -->
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
			</div>
			<!-- Draw Page -->
			
			<!-- Insert Page -->
            <div id="insertPage" role="tabpanel" class="tab-pane">

                <button id="imageBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="이미지 삽입">
                   	<div class="btn_icon">
                    	<i class="far fa-images"></i>
                    </div>
                    <div class="btn_name">
                    	<span>이미지 첨부</span>
                    </div>
                </button>
                
				<button id="codeBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="코드 작성">
                    <div class="btn_icon">
                    	<i class="fas fa-code"></i>
                    </div>
                    <div class="btn_name">
                    	<span>코드 작성</span>
                    </div>
                </button>

                <button id="linkBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="링크 삽입">
                    <div class="btn_icon">
                    	<i class="fas fa-link"></i>
                    </div>
                    <div class="btn_name">
                    	<span>링크 삽입</span>
                    </div>
                </button>

                <button id="videoBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="동영상 링크 삽입">
                    <div class="btn_icon">
                    	<!-- <i class="fas fa-video"></i> -->
                    	<i class="fab fa-youtube"></i>
                    </div>
                    <div class="btn_name">
                    	<span>Youtube</span>
                    </div>
                </button>

                <button id="emoticonBtn" class="btn btn-primary menu_btn" type="button" data-toggle="collapse" data-target="#emoticonList" aria-expanded="false" aria-controls="emoticonList">
                    <div class="btn_icon">
                    	<i class="far fa-meh"></i>
                    </div>
                    <div class="btn_name">
                    	<span>이모티콘 추가</span>
                    </div>
                </button>
			</div>
            <!-- insert Page -->
            
            
            <!-- save Page -->
			<div id="savePage" role="tabpanel" class="tab-pane">
			
				<button id="imageSaveBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="이미지 저장" onclick="stage_save_img();">
                    <div class="btn_icon">
                    	<i class="fas fa-file-download"></i>
                    </div>
                    <div class="btn_name">
                    	이미지 저장
                    </div>
                </button>
                
                
                <button id="pageSaveBtn" class="btn btn-primary menu_btn" type="button" data-toggle="tooltip" data-placement="bottom" title="페이지 저장" onclick="input_page_title('${ pVo.page_title }');">
                    <div class="btn_icon">
                    	<i class="far fa-save"></i>
                    </div>
                    <div class="btn_name">
                    	페이지 저장
                    </div>
                </button>
                
                <button id="stageColorBtn" class="btn btn-primary menu_btn" type="button" data-toggle="popover" data-container="body"
				data-toggle="popover" data-placement="bottom" data-content=" " data-trigger="focus" data-placement="bottom" onclick="updateStageColor();">
                    <div class="btn_icon">
                    	<i class="fas fa-fill-drip"></i>
                    </div>
                    <div class="btn_name">
                    	배경색 변경
                    </div>
                </button>
            </div>



        </div>
        <!--tab-content-->

    </div>
    <!--tab-pannel-->
	
	<!-- 이미지 첨부 숨김 태그 -->
	<form id="imageForm" hidden>
    	<input id="imageStorage" name="imageStorage" class="btn btn-primary" type="file" onchange="imageUpload(this);" hide>
    </form>

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


    <div id="view_div">
        <!-- canvas stage -->
        <div id="scroll-container">
            <div id="large-container">
                <div id="container">



                </div>
            </div>
        </div>
        
        
	</div>

	<%@ include file="/WEB-INF/views/onenote/onenote_modal.jsp"%>
	
	<!-- 페이지 저장 form -->
	<form id="saveForm" action="/page/savePage" method="post">
		<input type="hidden" id="page_code" name="page_code"/> 
		<input type="hidden" id="section_code" name="section_code" value="${ section_code }"/>
		<input type="hidden" id="page_title" name="page_title"/>
		<input type="hidden" id="page_contents" name="page_contents"/>
		<input type="hidden" id="page_thumbnail" name="page_thumbnail"/>
		<input type="hidden" id="bg_color" name="bg_color"/>
		<input type="hidden" id="user_id" name="user_id"/>
	</form>
	
	<!-- 썸네일 이미지 data form -->
	<form id="thumnailForm">
		<input type="hidden" id="thumnail_data" name="thumnail_data"/>
	</form>
    

</body>

<script>

	/* 저장 배열 */
	//소스코드 데이터 저장 배열 
	var code_id_array = new Array;				//소스코드 ID
	var code_mode_array = new Array();			//소스코드 언어
	var code_theme_array = new Array();			//소스코드 테마
	
	//비디오 데이터 저장 배열 
	var video_id_array = new Array;				//비디오 ID
	var video_link_array = new Array();			//비디오 링크

	//link 데이터 저장 배열
	var link_id_array = new Array;				//링크 ID
	var link_address_array = new Array();		//링크 주소



	$('#stageColorBtn').popover('enable');
	
	// 버튼 툴팁
    $('[data-toggle="tooltip"]').on('mouseover', function() {
        $('[data-toggle="tooltip"]').tooltip();
    });

    var options = {};
    
    /* 컬러 픽커 */
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
	
	/* 페이지 수정 시 data에 이전 페이지 stage 정보 setting */
	if(${ pVo != null}){
		data = '${ pVo.page_contents }';
		
		/* 페이지 수정시 saveForm 의 요청경로를 수정요청 경로로 변경 */
		$('#saveForm').attr('action', '/page/update_page');
		
		//섹션코드 setting
		$('#section_code').val('${ pVo.section_code }');
		//페이지코드 setting
		$('#page_code').val('${ pVo.page_code }');
		
		
		/* 배경색 setting */
		if(${ pVo.bg_color != null}){
			$('#container').css('background-color', '${ pVo.bg_color }');
		}
		
		//DB에 저장한 Code Data 그려주기
	    if(${ page_sourceList != null }){
	    	drawCodeTemplate();	//div, textarea  생성
	    	drawCodeMirror();	//textarea CodeMirror 로 변환
	    }
		
	  	//DB에 저장한 Video 그려주기
	    if(${ page_videoList != null }){
	    	drawVideoTemplate();	//div, handle 생성
	    	drawVideo();			//iframe 그려주기
	    }
	  	
	  	//DB에 저장한 link 그려주기
	    if(${ page_linkList != null }){
	    	drawLinkTemplate();	//div 생성
	    	drawLink();			//link 그려주기
	    }
		
	}

    var node_num = 0;
    var state = '';
    var width = window.innerWidth;
    //var width = 3000;
    var height = window.innerHeight;
    //var height = 3000;
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

	var target;

    //text node그룹 변수
    var group, textNode, placeHolder, tf, rect; //그룹, 텍스트노드, 입력, 트랜스폼, 테두리
    textNode = new Konva.Text();
    placeHolder = new Konva.Text();
    rect = new Konva.Rect();
    tf = new Konva.Transformer();


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
           /*  $("#alignLeft").css('background-color', 'gray');
            $("#alignCenter").css('background-color', 'white');
            $("#alignRight").css('background-color', 'white'); */
        }

        layer.draw();

    });

    $("#alignCenter").on('click', function() {

        var fontAlign = selectNode.align();

        if (fontAlign != 'center') {
            selectNode.align('center');
            /* $("#alignLeft").css('background-color', 'white');
            $("#alignCenter").css('background-color', 'gray');
            $("#alignRight").css('background-color', 'white'); */
        }

        layer.draw();

    });

    $("#alignRight").on('click', function() {

        var fontAlign = selectNode.align();

        if (fontAlign != 'right') {
            selectNode.align('right');
           /*  $("#alignLeft").css('background-color', 'white');
            $("#alignCenter").css('background-color', 'white');
            $("#alignRight").css('background-color', 'gray'); */
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
    
    //이미지 첨부
    $('#imageBtn').on('click', function() {
        $('#imageStorage').click();
    });
	
	//비디오 삽입
    $('#videoBtn').on('click', function() {
    	input_youtube_link();
    });
	
	//링크 삽입
    $('#linkBtn').on('click', function() {
    	input_link_address();
    });

    //이모티콘 버튼 
    $('#emoticonBtn').on('click', function() {
        addEmoticon();
    });

    //코드버튼
    $('#codeBtn').on('click', function() {
    	
    	$.ajax({
			url : "${cp}/page/code_modal_body",
			success : function(data) {
				$('#modal_head').text("코드작성");
				$('#modal-body').html(data);
				$('.jk-modalsasun').css('display', 'block');			
			}
		});
    	addCode();
    });
    
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

            if (selectNode.hasName('text') || selectNode.hasName('square')
            	|| selectNode.hasName('emoticon') || selectNode.hasName('image') ) {
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
/*         $('#fontColor').attr('background-color', 'white');
        $('#bgColor').attr('background-color', 'white');
        $("#fontBold").css('background-color', 'white');
        $("#fontItalic").css('background-color', 'white');
        $("#fontUnderLine").css('background-color', 'white');
        $("#fontDeleteLine").css('background-color', 'white'); */

        //fontAlign
        //버튼 비활성화
        $("#alignLeft").attr('disabled', true);
        $("#alignCenter").attr('disabled', true);
        $("#alignRight").attr('disabled', true);

        //버튼 색
/*         $("#alignLeft").css('background-color', 'white');
        $("#alignCenter").css('background-color', 'white');
        $("#alignRight").css('background-color', 'white'); */

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

            /* if (fontStyle.search('bold') > -1) {
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
            } */

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
        	
        	code_id_array.push(code_num2);
        	code_theme_array.push(code_theme);
        	code_mode_array.push(code_mode);
        	
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
    
 	//비디오 div, handle 생성
    function drawVideoTemplate(){
    	
    	var video_num = 1000;
    	
    	<c:forEach items='${ page_videoList }' var="video">
    	
    	video_num++;
    	
    	//video div 생성
    	var video_div = document.createElement('div');
    	video_div.id = 'video_div' + video_num;
    	$(video_div).addClass('video_div');
    	video_div.style = 'background-image: url(/page/onenoteImageView?src=video_img.png);';
        
        //view_div에 생성한 div 넣기
        $('#view_div').append(video_div);
        
        //drag 핸들
        var handle = document.createElement('div');
        handle.id = 'handle' + video_num;
    	$(handle).addClass('handle');
        
        $('#video_div' + video_num).append(handle);
    	
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
    		
    		video_id_array.push(video_num2);
    		video_link_array.push(video_link);
        	
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
    	    
    	    //css 위치 값으로 컨트롤 draggable효과 추가
    	    $("#video_div" + video_num2).draggable({
    	    	handle: '#handle'+video_num2,
    	        containment: "#container",
    	        scroll: true,
    	        iframeFix: true, //필수
    		});
    	    
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
    		
    		link_id_array.push(link_num2);
    		link_address_array.push(link_address);
    		
    		var a = document.createElement('a');
    	    a.id = "link" + link_num2;
    	    a.href = link_address;
    	    a.style = "font-size: 30px; color: #489BF0;";
    	    a.text = link_address;
    	    
    	    $('#link_div'+link_num2).append(a);
    	    
    	    //css 위치 값으로 컨트롤 draggable효과 추가
    	    $("#link_div" + link_num2).draggable({
    	        containment: "#container",
    	    });
    	    
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
<script src="/onenote/js/main_text_js.js"></script>
<script src="/onenote/js/main_drawing_js.js"></script>
<script src="/onenote/js/main_insert_js.js"></script>
<script src="/onenote/js/main_save_js.js"></script>
<script src="/onenote/js/main_util_js.js"></script>

</html>