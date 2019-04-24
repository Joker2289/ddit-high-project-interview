<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




<select id='modeSelect' onchange="modeSelect();">
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
	<option value="javascript" selected>javascript</option>
	<option value="jinja2">jinja2</option>
	<option value="jsx">jsx</option>
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


<select id='themeSelect' onchange="themeSelect();">
	<option value="" selected>테마 선택</option>
	<option value="default" selected>default</option>
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

<button id="code_view_btn" onclick="code_view_rendering();">미리보기</button>

<!-- 소스코드 area -->
<textarea id='code_editor'>
               		
//테마 선택
$('#themeSelect').on('change', function () {
    code_theme = $('#themeSelect').val();

    editor.setOption('theme', code_theme);
    editor.save();
});
editor.setSize(600, 800);                    



</textarea>







