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
<link href="/css/personalConnection.css" rel="stylesheet">
<link href="/css/timeline/writemodal.css" rel="stylesheet">

<script>


$(document).ready(function() {
<<<<<<< HEAD
=======
	
	// 검색창
>>>>>>> branch 'master' of https://gitlab.com/500dditError/interview.git
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
	// 프로필 보기
	$("#profile").on("click", function(){
<<<<<<< HEAD
		
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
		
=======
		$("#dropdownProfile").empty();
		$("#dropdownProfile").append('<table id="profilemenu"><thead><tr><td style="padding-bottom: 0px;"><div class="col-md-3"style="padding-right: 0px; padding-left: 30px;"><span style="font-size: 50px;"><i class="fas fa-user-circle"></i></span></div><div class="col-md-6"style="padding-left: 30px;"><div class="col-md-6"style="width: 180px; padding-top: 12px; padding-left: 0px;">사용자이름</div><div class="col-md-6"style="width: 180px; padding-left: 0px;">간단프로필</div></div></td></tr><tr class="profiletr"><td style="color: #0073B1; text-align: center; padding-top: 5px; padding-bottom: 5px;">프로필보기</td></tr><tr class="profiletr"style="border-top: 1px solid #CFD1D3; border-bottom: 1px solid #CFD1D3;"><td style="color: #666666; text-align: center;">프리미엄1개월무료이용</td></tr></thead><tbody><tr class="profiletr"><td style="color: #666666;">개인정보설정</td></tr><tr class="profiletr"><td style="color: #666666;">글&amp;활동</td></tr><tr class="profiletr"><td style="color: #666666;">채용공고</td></tr><tr class="profiletr"style="border-top: 1px solid #CFD1D3;"><tr class="profiletr"><td style="color: #666666;">회사</td></tr><tr class="profiletr"style="border-top: 1px solid #CFD1D3;"><td style="color: #666666;">로그아웃</td></tr></tbody></table>');
>>>>>>> branch 'master' of https://gitlab.com/500dditError/interview.git
	});
	

	$(document).on("click", function(e){
		if(!$(e.target).closest(".test123").hasClass("test123")){
			$("#dropdownProfile").empty();
		}
	});
	
	
	
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
	
	
	$(".menu").on("click", function(){
		$(".activeOn").attr('class','menu');
		$(this).removeClass();
        $(this).addClass("activeOn");
        $(this).addClass("test123");
	});
	
});

</script>
</head>
<body>

<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="content" />
	
</body>
</html>

