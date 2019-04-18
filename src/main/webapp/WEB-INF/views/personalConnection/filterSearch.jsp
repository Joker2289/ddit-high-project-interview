<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/personalConnection/feedFollowing.css" rel="stylesheet">
<nav class="navbar navbar-inverse navbar-fixed-top feedTop" style="height: 55px;margin-top: -21px;">
	<div class="container" style="padding-top: 12px; display: flex;" >

		<button type="button" class="btn btn-primary" style="padding-left: 16px;padding-right: 16px;margin-top: -1px;margin-left: 20px;height: 34px;"><strong>1촌</strong></button>
		
		<div style="padding-left: 15px; z-index: 999; max-width: 64px; margin-right: 15px; ">
			<button type="button" class="btn btn-primary dropBoxBtn Off" style="height: 34px;"><strong>지역 <span class="caret"></span></strong></button>
	        <div class="whiteBox dropBox" style="list-style: none; padding: 15px; min-width: 352px; margin: 0 0 0 0;">
	          <div style="overflow:auto;width: 320px;height:145px;">
	          	  <c:forEach items="${localList }" var="usersVo" >
			          <div style="padding-bottom: 5px; font-size: 17px; display: table;">
			          	<input class="local" type="checkbox" style="display :table-cell; vertical-align:middle; margin: 0; width: 20px; height: 20px;">
			          	<label style="padding-left: 10px;">${usersVo.addr1 }</label>
			          </div>
	          	  </c:forEach>	
	          </div>
	          
	          <div style="text-align: right;margin-top: 5px;">
	          	<button type="button" class="btn btn-default localUnCheckBtn" style="border-style: hidden;width: 64px; height: 32px;"><strong>지우기 </strong></button>
	          	<button type="button" class="btn btn-primary CheckBtn" style="width: 64px; height: 32px;"><strong>적용 </strong></button>
	          </div>	
       	    </div>
		</div>
		
		<div style="padding-left: 15px; z-index: 999; max-width: 64px; margin-right: 15px; ">
			<button type="button" class="btn btn-primary dropBoxBtn Off" style="height: 34px;"><strong>현 직장 <span class="caret"></span></strong></button>
			<div class="whiteBox dropBox" style="list-style: none; padding: 15px; min-width: 352px; margin: 0 0 0 0;">
	          <div style="overflow:auto;width: 320px;height:145px;">
	          	  <c:forEach items="${presentCorpor}" var="presentCorpor" >
			          <div style="padding-bottom: 5px; font-size: 17px; display: table;">
			          	<input class="presentCorpor" type="checkbox" style="display :table-cell; vertical-align:middle; margin: 0; width: 20px; height: 20px;">
			          	<label style="padding-left: 10px;">${presentCorpor.corporate_name}</label>
			          </div>
	          	  </c:forEach>	
	          </div>
	          
	          <div style="text-align: right;margin-top: 5px;">
	          	<button type="button" class="btn btn-default presentCorporUnCheckBtn" style="border-style: hidden;width: 64px; height: 32px;"><strong>지우기 </strong></button>
	          	<button type="button" class="btn btn-primary CheckBtn" style="width: 64px; height: 32px;"><strong>적용 </strong></button>
	          </div>	
       	    </div>
		</div>
		
		<div style="padding-left: 30px; z-index: 999; max-width: 64px; margin-right: 15px; ">
			<button type="button" class="btn btn-primary dropBoxBtn Off" style="height: 34px;"><strong>전 직장 <span class="caret"></span></strong></button>
			<div class="whiteBox dropBox" style="list-style: none; padding: 15px; min-width: 352px; margin: 0 0 0 0;">
	          <div style="overflow:auto;width: 320px;height:145px;">
	          	  <c:forEach items="${pastCorpor}" var="pastCorpor" >
			          <div style="padding-bottom: 5px; font-size: 17px; display: table;">
			          	<input class="pastCorpor" type="checkbox" style="display :table-cell; vertical-align:middle; margin: 0; width: 20px; height: 20px;">
			          	<label style="padding-left: 10px;">${pastCorpor.corporate_name}</label>
			          </div>
	          	  </c:forEach>	
	          </div>
	          
	          <div style="text-align: right;margin-top: 5px;">
	          	<button type="button" class="btn btn-default pastCorporUnCheckBtn" style="border-style: hidden;width: 64px; height: 32px;"><strong>지우기 </strong></button>
	          	<button type="button" class="btn btn-primary CheckBtn" style="width: 64px; height: 32px;"><strong>적용 </strong></button>
	          </div>	
       	    </div>
		</div>
		
		<div style="padding-left: 45px; z-index: 999; max-width: 64px; margin-right: 15px; ">
			<button type="button" class="btn btn-primary dropBoxBtn Off" style="height: 34px;"><strong>직군 <span class="caret"></span></strong></button>
			<div class="whiteBox dropBox" style="list-style: none; padding: 15px; min-width: 352px; margin: 0 0 0 0;">
	          <div style="overflow:auto;width: 320px;height:145px;">
	          	  <c:forEach items="${jobPosition}" var="jobPosition" >
			          <div style="padding-bottom: 5px; font-size: 17px; display: table;">
			          	<input class="jobPosition" type="checkbox" style="display :table-cell; vertical-align:middle; margin: 0; width: 20px; height: 20px;">
			          	<label style="padding-left: 10px;">${jobPosition.job_position}</label>
			          </div>
	          	  </c:forEach>	
	          </div>
	          
	          <div style="text-align: right;margin-top: 5px;">
	          	<button type="button" class="btn btn-default jobPositionUnCheckBtn" style="border-style: hidden;width: 64px; height: 32px;"><strong>지우기 </strong></button>
	          	<button type="button" class="btn btn-primary CheckBtn" style="width: 64px; height: 32px;"><strong>적용 </strong></button>
	          </div>	
       	    </div>
		</div>
		
		<div style="padding-left: 45px; z-index: 999; max-width: 64px; margin-right: 15px; ">
			<button type="button" class="btn btn-primary dropBoxBtn Off" style="height: 34px;"><strong>학교<span class="caret"></span></strong></button>
			<div class="whiteBox dropBox" style="list-style: none; padding: 15px; min-width: 352px; margin: 0 0 0 0;">
	          <div style="overflow:auto;width: 320px;height:145px;">
	          	  <c:forEach items="${school}" var="school" >
			          <div style="padding-bottom: 5px; font-size: 17px; display: table;">
			          	<input class="school" type="checkbox" style="display :table-cell; vertical-align:middle; margin: 0; width: 20px; height: 20px;">
			          	<label style="padding-left: 10px;">${school.school_name}</label>
			          </div>
	          	  </c:forEach>	
	          </div>
	          
	          <div style="text-align: right;margin-top: 5px;">
	          	<button type="button" class="btn btn-default schoolUnCheckBtn" style="border-style: hidden;width: 64px; height: 32px;"><strong>지우기 </strong></button>
	          	<button type="button" class="btn btn-primary CheckBtn" style="width: 64px; height: 32px;"><strong>적용 </strong></button>
	          </div>	
       	    </div>
		</div>
	</div>
</nav>


<div class="container">
<div class="row">
<div>
<div class="row">

	<div id="pc_leftmenu" class="col-md-3" style="padding-left: 0px;margin-left: 30px;">
		<div class="row corporationList">
			<div class="whiteBox" style="width: 792px;height: 502px;margin-top: 24px;margin-left: -2px;"></div>
		</div>
	</div>
	<div class="col-md-2" style="margin-top: 24px;margin-left: 497px;">
		<div class="whiteBox" style="width:314px; height: 256px;">promotion</div>
		footer
	</div>

</div>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var localArr = new Array();	//지역
	var presentCorporArr = new Array();	//현직장 
	var pastCorporArr = new Array();  //전직장
	var jobPositionArr = new Array();  //직군 
	var schoolArr = new Array();  //학교 
	
 // 지역 드롭박스 숨김
 $(".dropBox").hide();
 
 // 지역 버튼 클릭시 드롭박스 보이기
 $(".dropBoxBtn").on("click",function(){
	 if($(this).hasClass("dropBoxBtn Off")){
		$(".dropBox").hide();
		$(this).next().show();
	 	$(this).attr('class','btn btn-primary dropBoxBtn On');
	 }else{
		 $(this).next().hide();
		 $(this).attr('class','btn btn-primary dropBoxBtn Off');
	 }
 });
 
	// 전체 선택해체    
	$(".localUnCheckBtn").click(function(){
		$(".local").prop("checked",false);
	});
	$(".presentCorporUnCheckBtn").click(function(){
		$(".presentCorpor").prop("checked",false);
	});
	$(".pastCorporUnCheckBtn").click(function(){
		$(".pastCorpor").prop("checked",false);
	});
	$(".jobPositionUnCheckBtn").click(function(){
		$(".jobPosition").prop("checked",false);
	});
	$(".schoolUnCheckBtn").click(function(){
		$(".school").prop("checked",false);
	});
	
	// 적용 클릭 시 배열에 저장
	$(".CheckBtn").click(function(){
		fn_total();
		
		$(".dropBox").hide();
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			type : "POST",
			url : "/peopleSearch",
			dataType : "HTML",
			data : {"localArr" : localArr, "presentCorporArr": presentCorporArr, "pastCorporArr" : pastCorporArr,"jobPositionArr": jobPositionArr, "schoolArr" : schoolArr},
			success : function(result) {
				
			}
		}); 
		
		
	});
	
	
	// 각 배열에 저장
	function fn_total(){
		var arr = new Array(); 

	    $(".local:checked").each(function() {
	    	arr.push($(this).next().text());     // 체크된 것만 값을 뽑아서 배열에 push
	    });
	    localArr=arr;
	   
	    arr = new Array();
	    
	    $(".presentCorpor:checked").each(function() {
	    	arr.push($(this).next().text());    
	    });
	    presentCorporArr=arr;
	    
	    arr = new Array();
	    
	    $(".pastCorpor:checked").each(function() {
	    	arr.push($(this).next().text());    
	    });
	    pastCorporArr=arr;
	    
	    arr = new Array();
	    
	    $(".jobPosition:checked").each(function() {
	    	arr.push($(this).next().text());    
	    });
	    jobPositionArr=arr;
	    
	    arr = new Array();
	    
	    $(".school:checked").each(function() {
	    	arr.push($(this).next().text());    
	    });
	    schoolArr=arr;
	    
	}
	

});
</script>