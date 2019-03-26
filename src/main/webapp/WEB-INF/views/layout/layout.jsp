<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/header.css" rel="stylesheet">
<script>
$(document).ready(function() {
	
	// 검색창
	$("#search").on("click", function(){
		$("#dropdownSearch").empty();
		$("#dropdownSearch").append('<table id="searchmenu"><thead><tr><td>검색어 :</td></tr></thead><tbody><tr><td><span style="font-size: 20px;"><i class="fas fa-users"></i></span>사람</td></tr><tr><td><span style="font-size: 20px;"><i class="fas fa-briefcase"></i></span>채용</td></tr><tr><td><span style="font-size: 20px;"><i class="far fa-newspaper"></i></span>내용</td></tr></tbody></table>');
	});
	
	$("#search").on("mouseleave", function(){
		$(document).on("mouseup", function(){
			$("#dropdownSearch").empty();
		});
	});
	// 프로필 보기
	$("#profile").on("click", function(){
		$("#dropdownProfile").empty();
		$("#dropdownProfile").append('');
	});
	
	$("#profile").on("mouseleave", function(){
		$(document).on("mouseup", function(){
			$("#dropdownProfile").empty();
		});
	});
	
	
	// append이후에 #search.on 메서드 실행이 안되므로 
	// document.on 메서드로 실행
	$(document).on('mouseover', '#searchmenu tbody tr', function(e) {
		$( this ).css( "background-color", "#F3F6F8" ); 
	    $( this).children("td").css( "cursor", "pointer" ); 

	});
	
	$(document).on('mouseleave', '#searchmenu tbody tr', function(e) {
		$( this ).css( "background-color", "white" ); 
	});
	
	$(".menu").on("click", function(){
		$(".activeOn").attr('class','menu');
		$(this).removeClass();
        $(this).addClass("activeOn");
	});
	
});
</script>
</head>
<body>
<tiles:insertAttribute name="header" />
<div class="container-fluid">
	<div class="row">
		<div style="margin-top: 101px;">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</div>
</body>
</html>