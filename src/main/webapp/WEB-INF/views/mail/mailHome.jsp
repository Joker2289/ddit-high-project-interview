<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/mail/mailHome.css" rel="stylesheet"> 
<div class="container">
<div class="row">
<div>
	<div style="width: 1188px; height: 836px; display: flex;">
		<div class="whiteBox mailBox">
			<div class="leftMenuBox">
				<div class="produceRoomBox">
					<label>메일</label>
					<button class="btn btn-link produceRoomBtn" id="produceRoomBtn" style="padding: 0 0 0 0;">
						<span style="font-size: 17px; color: #0073b1;">
							<i class="fas fa-edit"></i>
						</span>
					</button>
				</div>	
				<div class="searchRoomBox">
					<span>
						<i class="fas fa-search"></i>
					</span>
					<input type="text" class="form-control" aria-label="..." placeholder="메일 검색">
					<button class="btn btn-link">
						<span style="font-size: 17px; padding-top: 12px; width: 20px;">
							<i class="fas fa-sort-amount-down"></i>
						</span>
					</button>
				</div>
				<div class="recruitMailBox">
					<a >채용공고 메일함 ></a>
				</div>
				<div class="chatrooms">
				<c:forEach items="${userChatroomsMap }" var="userChatroom">
					<c:set var="profile_addrpath" value="/profile?mem_id=${userChatroom.mem_id }"/>
						<c:if test="${fn:contains(userChatroom.profile_path, 'http')}">
							<c:set var="profile_path" value="${userChatroom.profile_path }"/> 
						</c:if>
					<fmt:formatDate value="${userChatroom.write_date}" pattern="MM월 dd일" var="write_date"/>
					<a class="chatRoomBox" href="/chatRoomMove?chat_code=${userChatroom.CHAT_CODE}">
						<div class="profileImageBox">
							<div style="background-image: url(${not empty profile_path ? profile_path : profile_addrpath});"></div>
						</div>
						<div class="chatRoomContentsBox">
							<div style="display: flex; color: rgba(0, 0, 0, .6);">
								<label class="chatRoomMemberBox">${userChatroom.CHAT_NAME}</label>
								<label style="font-size: 14px;">${write_date }</label>
							</div>
							<div class="chatContentsBox">${userChatroom.MEM_ID eq SESSION_MEMBERVO.mem_id ? "나": userChatroom.MEM_ID }
								: ${userChatroom.CHAT_CONTENT }</div>
						</div>
					</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="rightMenuBox">
				<div class="chatAjax">
					<div id="chatcontentsAjax">
					<div class="chatRoomTitleBox">
						<div>
							<label>${chatContentsVoList[0].chat_name }</label>
							<label style="color:rgba(0,0,0,.6);"><c:if test="${not empty chatContentsVoList[0].memCount}">메일 상대 ${chatContentsVoList[0].memCount }명 </c:if></label>
						</div>
					<button class="btn btn-link">
						<i class="fas fa-ellipsis-h"></i>
					</button>
				</div>
				<div class="chatContentBox">
					<c:forEach items="${chatContentsVoList }" var="chatContentsVo">
					<fmt:formatDate value="${chatContentsVo.write_date}" pattern="a KK:mm" var="write_date"/>
						<c:set var="profile_addrpath" value="/profile?mem_id=${chatContentsVo.mem_id }"/>
						<c:if test="${fn:contains(chatContentsVo.profile_path, 'http')}">
							<c:set var="profile_path" value="${chatContentsVo.profile_path }"/> 
						</c:if>
						<a href="/profileHome<c:if test="${chatContentsVo.mem_id != SESSION_MEMBERVO.mem_id}">?user_id=${chatContentsVo.mem_id }</c:if>" style="width: 474px; min-height: 66px; display: flex; margin-bottom: 10px;">
							<div style="margin-right: 20px; background-image: url(${not empty profile_path ? profile_path : profile_addrpath}); width: 40px; height: 40px; border-radius: 40px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
							<div>
								<div>
									<label style="font-size: 15px; font-weight: bold;">${chatContentsVo.name}</label>
									<label style="color: rgba(0,0,0,.6); font-size: 13px;">${write_date}</label>
								</div>
								<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;width: 400px;">
									${chatContentsVo.chat_content}
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
					</div>
				<div class="chatContentWriteBox">
					<textarea class="form-control" id="sendMeseage" rows="5" placeholder="메일 쓰기 또는 파일 첨부"></textarea>
				</div>
				<div class="chatContentBtnBox">
					<button class="btn btn-link smallChatBtn">
						<span style="font-size:24px;">
							<i class="far fa-image"></i>
						</span>
					</button>
					<button class="btn btn-link smallChatBtn">
						<span style="font-size:24px;">
							<i class="fas fa-paperclip"></i>
						</span>
					</button>
					<button class="btn btn-link smallChatBtn">
						<span style="font-size:24px;">
							<i class="fab fa-qq"></i> 
						</span>
					</button>
					<button class="btn btn-link smallChatBtn">
						<span style="font-size:24px;">
							<i class="far fa-smile"></i>
						</span>
					</button>
					<button class="btn btn-primary submitBtn">보내기</button>
				</div>
			</div>
		</div>
	</div>
			
		<div class="whiteBox" style="width: 312px; height: 262px; display: flex;">
			
			
		</div>
	
	</div>
</div>
</div>
</div>
<script src="/js/sockjs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var chat_code = "${chat_code}";
		$(".chatContentBox").scrollTop(99999999);
		
		$(".produceRoomBtn").on("click",function(){
			if($("#produceRoomBtn").hasClass('produceRoomBtn')){
				$.ajax({
					type : "POST",
			    		url : "/produceRoomView",
			    		dataType : "HTML",
			    		data : {},
					success : function(result) {
						$("#produceRoomBtn").attr('class','btn btn-link produceRoomBtnOn');
						$(".chatAjax").empty();
						$(".chatAjax").html(result);
						$(".chatAjax").show();
						$(".submitBtn").prop("disabled", true);
					}
				}); 
			}
		});
		$(document).on("click",".submitBtn",function(){ 
				if($("#produceRoomBtn").hasClass('produceRoomBtnOn')){
					if($("input[name='chat_name']").val().trim()=="") {
						var size = $("input[name='chat_member']").length;
						var chat_nameValue = "";
						for(i=0;i<size;i++){
							chat_nameValue = chat_nameValue + $("input[name='chat_member']").eq(i).attr('role') + (i == size-1 ? "" : ",");
						}
						console.log(chat_nameValue);
						$("input[name='chat_name']").val(chat_nameValue);
					}
					$("#insertChatRoom").submit();
					$("#produceRoomBtn").attr('class','btn btn-link produceRoomBtn');
				}else{
					 sendMessage();
		             $('#sendMeseage').val('')
				}
		}); 
		 
	/* 	$(document).on("click",".chatRoomBox",function(){ 
			 chat_code = $(this).attr('role');
			 console.log(chat_code);
		 	$.ajax({
				type : "POST",
		    		url : "/chatRoomMove",
		    		dataType : "HTML",
		    		data : {"chat_code" : chat_code},
				success : function(result) {
					$(".submitBtn").prop("disabled", false);
					$("#produceRoomBtn").attr('class','btn btn-link produceRoomBtn');
					$("#chatcontentsAjax").empty();
					$("#chatcontentsAjax").html(result);
					$(".chatContentBox").scrollTop(99999999);
				}
			});
		 });
		  */

		
		// 웹소켓을 지정한 url로 연결한다.
        let sock = new SockJS("<c:url value="/mailHome"/>");
        sock.onmessage = onMessage;
        sock.onclose = onClose;

        // 메시지 전송
        function sendMessage() {
        	
        	if(chat_code != null) {
        		console.log($("#sendMeseage").val());
                sock.send($("#sendMeseage").val());
        	}
        }

        // 서버로부터 메시지를 받았을 때
        function onMessage(msg) {
           var data = msg.data;
           console.log(data);
           
           $.ajax({
				type : "POST",
		    		url : "/serverRecive",
		    		dataType : "HTML",
		    		data : {"chat_code" : chat_code},
				success : function(result) {
					$("#chatcontentsAjax").empty();
					$("#chatcontentsAjax").html(result);
					$(".chatContentBox").scrollTop(99999999);
				}
			});
           
           
        }

        // 서버와 연결을 끊었을 때
        function onClose(evt) {
           $(".chatContentBox").append("연결 끊김");
        }
		
	});
</script>
