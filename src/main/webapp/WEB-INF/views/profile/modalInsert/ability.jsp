<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">보유기술</h4>
</div>
<div class="modal-body">
<form action="/abilityInsert" method="post" id="abilityInsertFrm">
	<div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">보유기술 </label>
				<input class="form-control" type="text" name="ability_item" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
			</div>
			<ul class="dropdown-menu searchDropDown">	
				<c:forEach items="${ hashtagVoList}" var="hashtag_name">
					<li><a class="ability_itemClick">${hashtag_name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<input type="hidden" value="${SESSION_MEMBERVO.mem_id }" name="user_id">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="abilitySave">저장</button>
</div>
<script>
	 
	// 검색시 다른 곳 클릭할때 숨기기 기능
	$(document).on("click", function(e){
		if (!$(e.target).closest(".searchDropDown").hasClass("searchDropDown")){
	       	$(".searchDropDown").hide();
		}
	});

	// 보유스킬입력 클릭시 인풋 값 
	$(document).on("click",".ability_itemClick",function(){
		 $("input[name=ability_item]").val($(this).text());
		 $(".searchDropDown").hide();
	});
		
	 //	보유스킬입력창에서 키 입력시 검색(API 데이터에서) 
	 $("input[name=ability_item]").keyup(function() {
		 $('.searchDropDown').css("display","block");
            var k = $(this).val();
            $(".searchDropDown > li").hide();
            var temp = $(".searchDropDown > li:contains('" + k + "')");
            $(temp).show();
     });
	 
	
	// 입력 제어
	$("#abilitySave").on("click",function(){
		if($("input[name=ability_item]").val().trim()==""){
			alert("보유기술을 입력해주세요");
			$("input[name=ability_item]").focus();
			return false;
		}
		
		
 		$("#abilityInsertFrm").submit();
	});
	    
    
</script>