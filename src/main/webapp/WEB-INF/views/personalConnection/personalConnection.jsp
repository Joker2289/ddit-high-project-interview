<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	var divWidth  = "511"; 
	$("#btnslidelt").on("click",function(){
		$("#content").stop(true,true);
		
		   var moveX   = parseInt($("#content").css("margin-left"));
	
		   if( moveX < 0 )
		   {
		    $("#content").animate({"margin-left":"+=" + divWidth + "px"},500);
		   }
	});

	$("#btnSlidegt").on("click",function(){
		 $("#content").stop(true,true);
	
		   var moveX   = parseInt($("#content").css("margin-left"));
	
		   if( -1022 < moveX )
		   {
		    $("#content").animate({"margin-left":"-=" + divWidth + "px"},500);
		   }
	});
	
	$(document).scroll(function() {
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();

	    if (maxHeight <= currentScroll + 100) {
	    	$.ajax({
	    		type : "POST",
 	    		url : "/personalConnection",
//  	    		dataType : "JSON",    //옵션이므로 JSON으로 받을게 아니면 안써도 됨
 	    		data : { },
	    		success : function(result) {
	    		//통신이 성공적으로 이루어졌을 때 처리하고 싶은 함수
	    			$("#content2").append('<li><div class="whiteBox">1sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">2sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">3sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">4sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">5sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">6sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">7sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">8sdfgsdfgsdfgsdfg<br>sadf</div></li><li><div class="whiteBox">9sdfgsdfgsdfgsdfg<br>sadf</div></li>');
	    		}
	    	});
	    }
	});
});

</script>
<div class="container">
<div class="row">
<div style="margin-top: 101px;">
<div class="row">
			  <div id="pc_leftmenu" class="col-md-3">
			        <div id="pc_leftmenuBox" class="whiteBox">
			         	<a href="/connections">
			         		<span style="padding-right: 5px;"><i class="fas fa-user-friends"></i></span>1촌 ${connections_count }명
			         	</a>
			           <a id="pc_leftmenuBorder" href="/coporation">
			           	<span><i class="fas fa-building" ></i></span>회사 ()개
			           </a>
			        </div>
			  </div>
				<div class="col-md-6" style="margin-right: -25px; ">
					<div class="row">
						<div class="col-md-12" >
							<div id="pc_resiceConnection" class="whiteBox">
								<label style="padding-right: 295px;">받은 일촌 신청 </label><a>모두 보기</a><br>
							</div>
						</div>
						<div class="col-md-12" style="padding: 20px 0 20px 15px; ">
							<div id="pc_find" class="whiteBox">
								<label>아는 동문 찾기</label><a style="font-size: 17px;">모두보기</a>
								<button id="btnslidelt" class="btn btn-default" style="border: 0px;">&lt;</button>
								<button id="btnSlidegt" class="btn btn-default" style="border: 0px;">&gt;</button><br/>
								<ul  id="content" style="list-style:none;width:3000px; padding-left: 5px;">
									<li><div class="whiteBox">1sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">2sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">3sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">4sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">5sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">6sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">7sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">8sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">9sdfgsdfgsdfgsdfg<br>sadf</div></li>
								</ul>
							</div>
						</div>
						<div class="col-md-12">
							<div id="pc_find" class="whiteBox" style="width:512px;height:auto; box-sizing: content-box; ">
								<label style="font-size: 17px;">회원님을 위한 맞춤 추천</label>
								<ul  id="content2" style="list-style:none;width:553px; padding-left: 0px; padding-top: 10px">
									<li><div class="whiteBox">1sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">2sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">3sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">4sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">5sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">6sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">7sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">8sdfgsdfgsdfgsdfg<br>sadf</div></li>
									<li><div class="whiteBox">9sdfgsdfgsdfgsdfg<br>sadf</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2" >
					<div class="whiteBox" style="width:314px; height: 256px;">Level 2: .col-xs-4 .col-sm-6</div>
					footer
				</div>
</div>
</div>
</div>
</div>
