<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="chatcontentsAjax">
<div class="chatRoomTitleBox" style="padding: 12px 0 0 220px;">
	<label>새 메일</label>
</div>
	<div>
		<input class="form-control"type="text" name="chat_name" style="border: 1px solid #cdcfd2;"placeholder="메일 이름 정하기">
	</div>
	<div class="usersNameBox" style="padding: 5px 5px 5px 5px; display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;width: 490px;">
		<input class="form-control" type="text" id="searchMember" style="width: 100px;border: 0px;" placeholder="이름 입력...">
	</div>
	
	<ul class="dropdown-menu searchConnectionDropDown">
		<c:forEach items="${memberList }" var="member"> 
		<c:set var="profile_addrpath" value="/profile?mem_id=${member.MEM_ID }"/>
		<c:if test="${fn:contains(member.PATH, 'http')}">
			<c:set var="profile_path" value="${member.PATH }"/>
		</c:if>
		<li class="liUsersClick" style="padding: 4px 0 4px 0;">
			<a style="width: 483px; height: 60px; display: flex; padding: 10px 20px 10px 20px;">
				<div style="width:40px; height: 40px; background-image: url(${fn:contains(member.PATH, 'http') ? profile_path : profile_addrpath}); background-repeat: no-repeat;background-size: contain;background-position: center;border-radius: 40px">
				</div>
				<div style="width: 433px; height: 40px;">
					<label>${member.NAME }</label><br>
					<label>${member.INTRODUCE }</label>
				</div>
			</a>
			<input type="hidden" value="${member.MEM_ID }" role="${member.NAME }">
		</li>
		</c:forEach>
	</ul>
	<div class="chatContentBox" style="height: 520px;">
		
	</div>
	</div>
	<div class="chatContentWriteBox">
		<div class="form-control" id="sendMeseage" name="chat_content" rows="5" contenteditable="true"></div>
	</div>
<div class="chatContentBtnBox">
	<button class="btn btn-link smallChatBtn imageBtn">
		<span style="font-size:24px;">
			<i class="far fa-image"></i>
		</span>
	</button>
	<button class="btn btn-link smallChatBtn fileBtn">
		<span style="font-size:24px;">
			<i class="fas fa-paperclip"></i>
		</span>
	</button>
	<button class="btn btn-primary submitBtn">보내기</button>
</div>
<script type="text/javascript">
	var chatContentHeight = 517;
	$(".smallChatBtn").prop("disabled", true);
	$("#searchMember").keyup(function() {
		$('.searchConnectionDropDown').css("display","block");
		var k = $(this).val();
        $(".searchConnectionDropDown > li").hide();
        var temp = $(".searchConnectionDropDown > li:contains('" + k + "')");
        $(temp).show();
	});
	
	$(document).on("click", function(e){
		if (!$(e.target).closest(".searchConnectionDropDown").hasClass("searchConnectionDropDown")){
	       	$(".searchConnectionDropDown").hide();
		}
	});
	
	$(document).on('click','.delUsers',function(){
        $(this).closest('div').remove();
    });
	
	$(".liUsersClick").on("click",function(){
		var userName = $(this).children(":last").attr('role');
		var userId = $(this).children(":last").val();
		var userIdCheck = "f";
		if ($("input[name='chat_member']").eq(0).val() != null){
			var size = $("input[name='chat_member']").length;
			for(i=0;i<size;i++){
				if($("input[name='chat_member']").eq(i).val() == userId){
					return;
				}
			}
			
			if(userIdCheck == "f") {
				$(".usersNameBox").prepend('<div style="display: flex; margin:0 10px 10px 0;background-color: #e2e2e2; border-radius: 5px;"><label style="font-size: 15px; padding: 7px 5px 0 5px;">'+userName+'</label><span class="delUsers"style="cursor: pointer; padding: 9px 0 0 0;"><i class="fas fa-times"></i></span><input type="hidden" name="chat_member" value="'+userId+'" role="'+userName+'"></div>');
				if($(".usersNameBox").height()/39 > 1){
					$(".chatContentBox").css('height',chatContentHeight - ((($(".usersNameBox").height() / 39) - 1) * 39));	
				}
				$("#searchMember").val('');
				$(".searchConnectionDropDown").hide();
			}
			
		}else{
			$(".usersNameBox").prepend('<div style="display: flex; margin:0 10px 10px 0;background-color: #e2e2e2; border-radius: 5px;"><label style="font-size: 15px; padding: 7px 5px 0 5px;">'+userName+'</label><span class="delUsers"style="cursor: pointer; padding: 9px 0 0 0;"><i class="fas fa-times"></i></span><input type="hidden" name="chat_member" value="'+userId+'" role="'+userName+'"></div>');
			$("#searchMember").val('');
			$(".searchConnectionDropDown").hide();
		}
		
	});
	
	
	
	$("#sendMeseage").keyup(function() {
		if($("#sendMeseage").html().trim() != "" && $("input[name='chat_member']").eq(0).val() != null){
			$(".submitBtn").prop("disabled", false);
		}else if($("#sendMeseage").val().trim() == ""){
			$(".submitBtn").prop("disabled", true);
		}
		
	});
	
	
	
</script>

