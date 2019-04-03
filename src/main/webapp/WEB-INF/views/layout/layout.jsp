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
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" />

<script>


$(document).ready(function() {
	
	// 검색창
	$("#search").on("click", function(){
		
		var str = "search";
		
		$.ajax({
    		type : "POST",
	    		url : "/menu",
	    		dataType : "HTML",
	    		data : {"str":str},
    		success : function(result) {
    			$("#dropdownSearch").empty();
    			$("#dropdownSearch").append(result);
    		}

    	});
		
		
	});
	
	$("#search").on("mouseleave", function(){
		$(document).on("mouseup", function(){
			$("#dropdownSearch").empty();
		});
	});
	/* // 프로필 보기
	$("#profile").on("click", function(){
		var str = "profile";
		
		$.ajax({
    		type : "POST",
	    		url : "/menu",
	    		dataType : "HTML",
	    		data : {"str":str},
    		success : function(result) {
    			$("#dropdownProfile").empty();
    			$("#dropdownProfile").append(result);
    		}

    	}); 
		
	}); */
	
/* 
	$(document).on("click", function(e){
		if(!$(e.target).closest(".profile").hasClass("profile")){
			$("#dropdownProfile").empty();
		}
	});
	 */
	
	
	// append이후에 #search.on 메서드 실행이 안되므로 
	// document.on 메서드로 실행
	$(document).on('mouseover', '#searchmenu tbody tr', function(e) {
		$( this ).css( "background-color", "#F3F6F8" ); 
	    $( this).children("td").css( "cursor", "pointer" ); 
	});
	$(document).on('mouseleave', '#searchmenu tbody  tr', function(e) {
		$( this ).css( "background-color", "white" ); 
	});
	
	$(document).on('mouseleave', '.profiletr', function(e) {
		$( this ).css( "background-color", "white" ); 
	});
	
	$(document).on('mouseover', '.profiletr', function(e) {
		$( this ).css( "background-color", "#E5E5E5" ); 
	    $( this).children("td").css( "cursor", "pointer" ); 
	});
	
	
	$(document).on("click", function(e){
		if($(e.target).closest(".profile").hasClass("profile")){
			
       		$(".activeOn").attr('class', 'menu');
       		$(e.target).closest(".menu").attr('class', 'activeOn profileOn');
       		
        	var str = "profile";
        	
        	$(".profile").attr('class','activeOn profileOn');
    		
    		$.ajax({
        		type : "POST",
    	    		url : "/menu",
    	    		dataType : "HTML",
    	    		data : {"str":str},
        		success : function(result) {
        			$("#dropdownProfile").append(result);
        		}
        	}); 
		}else if (!$(e.target).closest(".profile").hasClass("profile")){
        	
        	if($(e.target).closest(".profileOn").hasClass("profileOn")) {
        		
	        		$(".profileOn").attr('class','activeOn profile');
        		
        	}else if ($(e.target).closest(".menu").hasClass("menu")){
        		
        		$(".profileOn").attr('class', 'menu profile');
        		$(".profile").attr('class', 'menu profile');
        		$(".activeOn").attr('class', 'menu');
        		$(e.target).closest(".menu").attr('class', 'activeOn');
        	}else {
        		
	        	$(".profileOn").attr('class', 'menu profile');
        	}
        	$("#dropdownProfile").empty();
        }
	}); 
	
});

</script>
</head>
<body>

<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="content" />
	
</body>
</html>

