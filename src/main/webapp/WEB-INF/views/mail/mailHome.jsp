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
					<input type="text" class="form-control chatroomSeach" aria-label="..." placeholder="메일 검색">
					<button class="btn btn-link chatroomSeachBtn" style="margin-left: 29px;">
						<span style="font-size: 17px; padding-top: 12px; width: 20px;">
							<i class="fas fa-search"></i>
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
					<a class="chatRooms chatRoomBox" role="${userChatroom.CHAT_CODE }">
						<div class="profileImageBox">
							<div style="background-image: url(${not empty profile_path ? profile_path : profile_addrpath});"></div>
						</div>
						<div class="chatRoomContentsBox">
							<div style="display: flex; color: rgba(0, 0, 0, .6);">
								<label class="chatRoomMemberBox">${userChatroom.CHAT_NAME}</label>
								<label style="font-size: 14px;">${write_date }</label>
							</div>
							<div class="chatContentsBox">${userChatroom.MEM_ID eq SESSION_MEMBERVO.mem_id ? "나": userChatroom.MEM_ID }
								: ${not empty fn:split(userChatroom.CHAT_CONTENT,'▣')[1] ? '이미지를 보냈습니다.' : userChatroom.CHAT_CONTENT}</div>
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
					<button class="btn btn-link exit">
						<i class="fas fa-door-open"></i>
					</button>
				</div>
				<div class="chatContentBox">
					<div style="width: 474px; margin-bottom: 10px; text-align: center;">${oldDate}</div> 
					<c:forEach items="${chatContentsVoList }" var="chatContentsVo">
						<fmt:formatDate value="${chatContentsVo.write_date}" pattern="MM월 dd일 a KK:mm" var="write_date"/>
						<c:set var="profile_addrpath" value="/profile?mem_id=${chatContentsVo.mem_id }"/>
						<c:if test="${fn:contains(chatContentsVo.profile_path, 'http')}">
							<c:set var="profile_path" value="${chatContentsVo.profile_path }"/> 
						</c:if>
						<c:choose>
							<c:when test="${fn:split(chatContentsVo.chat_content,'▣')[1] eq 'exit'}">
								<div style="width: 474px; margin-bottom: 10px; text-align: center;">${fn:split(chatContentsVo.chat_content,'▣')[0] } 님이 나가셨습니다.</div>
							</c:when>
							<c:otherwise>
								<div style="width: 474px; min-height: 66px; display: flex; margin-bottom: 10px;">
									<a href="/profileHome<c:if test="${chatContentsVo.mem_id != SESSION_MEMBERVO.mem_id}">?user_id=${chatContentsVo.mem_id }</c:if>" ><div style="margin-right: 20px; background-image: url(${not empty profile_path ? profile_path : profile_addrpath}); width: 40px; height: 40px; border-radius: 40px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div></a>
									<div>
										<div>
											<label style="font-size: 15px; font-weight: bold;">${chatContentsVo.name}</label>
											<label style="color: rgba(0,0,0,.6); font-size: 13px;">${write_date}</label>
										</div>
										
										<c:choose>
											<c:when test="${not empty fn:split(chatContentsVo.chat_content,'▣')[1]}">
												<c:choose>
													<c:when test="${fn:split(chatContentsVo.chat_content,'▣')[1] eq 'image' }">
														<a href="/chatContentsFileDownload?content_code=${chatContentsVo.content_code }">									
															<div style="width: 250px; height: 300px; background-image:url('/chat_contentsImage?uuid=${fn:split(chatContentsVo.chat_content,'▣')[0]}'); background-repeat: no-repeat; background-size: contain; background-position: center;">
															</div>
														</a>
													</c:when>
													<c:otherwise>
														<a href="/chatContentsFileDownload?content_code=${chatContentsVo.content_code }">									
															<div style="width: 400px;">
																${fn:split(chatContentsVo.chat_content,'▣')[2]}
															</div>
														</a>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;width: 400px;">
													${chatContentsVo.chat_content}
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
					</div>
				<div class="chatContentWriteBox">
					<div class="form-control" id="sendMeseage" rows="5" contenteditable="true"></div>
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
			</div>
		</div>
	</div>
			
		<!-- newList -->
		<div id="div_newList" class="whiteBox" style="width: 296px; margin-left: 10px; height: 370px; margin-bottom: 20px;
				text-align: center; padding-top: 10px; font-size: 22px;">
			<div style="text-align: left; padding-left: 15px; padding-bottom: 7px;">
				신규 채용공고
			</div>
			<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;" >
		   		<c:if test="${newList.size() >= 1 }">
		   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
		   					margin-left: -290px;">
					<c:forEach items="${newList }" varStatus="i" var="rRVo">
						<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
								margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
							<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
									border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
									data-code="${rRVo.recruit_code }">
								<div class="table_div" style="margin-left: 24px;">
									<img src="${newImgList.get(i.index) }" width="200"> 
								</div> <br>
								<strong>
									<c:choose>
										<c:when test="${rRVo.recruit_title.length() > 18 }">
											${rRVo.recruit_title.substring(0, 18) }...
										</c:when>
										<c:otherwise>
											${rRVo.recruit_title }
										</c:otherwise>
									</c:choose>
								</strong> <br>
								${newNmList.get(i.index) } <br>
								${rRVo.job_local } <br>
								${rRVo.job_type }
							</div>
							<div style="padding-top: 10px;">
								${newTimeList.get(i.index) } 전
							</div>
						</div></li>
					</c:forEach>
					</ul>
				</c:if>
			</div>
			<div style="text-align: center; font-size: 13px; padding-top: 15px;">
				<i onmouseover="" class="fas fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i>				
			</div>
		</div>
		<!-- newList -->
		<form id="images" method="post" enctype="multipart/form-data" action="">
			<input type="file" name="imageFile" id="imageFile" style="display: none;">
		</form>
		<form id="files" method="post" enctype="multipart/form-data" action="">
			<input type="file" name="imageFile" id="userfile" style="display: none;">
		</form>
	</div>
</div>
</div>
</div>
<script src="/js/sockjs.js"></script>
<script src="/js/js.cookie.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		// 기존에 접속한 방이 있는지 확인
		var chat_code = Cookies.get('chat_code');
		// 접속
 		sock = new SockJS("http://192.168.206.19:80/mailHome");
 		
		// 접속할 방 클릭시 방 접속 및 내용 출력
		$(document).on("click",".chatRooms",function(){
			Cookies.set('chat_code', $(this).attr('role'));
			$('.chatRooms').attr('class', 'chatRooms chatRoomBox');
			$(this).attr('class', 'chatRooms chatRoomBoxOn');
			chat_code = $(this).attr('role');
			
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
		});
		
		// 기존에 접속한 방이 없고 현재 개설된 방이 하나라도 있을 시에 최근 메세지가 있는 방으로 선택
		if(chat_code == undefined && ${fn:length(userChatroomsMap)} > 0){
			$(".chatRooms").get(0).click();
		}else{
			$('.chatRooms').attr('class', 'chatRooms chatRoomBox');
			$(".chatRooms").each(function(index, item){
				 if($(item).attr('role') == chat_code){
					 $(item).attr('class', 'chatRooms chatRoomBoxOn');
				 }
				 
			 });
		}
		
		// 방나가기 버튼 클릭시 방에서 나가기
		$(document).on("click",".exit",function(){
			if(Cookies.get('chat_code') == undefined){
				return;
			}
			Cookies.remove('chat_code');
			sock.send(chat_code+"▣"+"나감"+"▣exit");
			location.href="/deleteChatMember?chat_code="+chat_code+"&mem_id=${SESSION_MEMBERVO.mem_id}";
			
		});
		
		// 검색클릭시 검색된 방만 보여주기
		$(".chatroomSeachBtn").on("click",function() {
			$.ajax({
				type : "POST",
		    		url : "/chatContentSearch",
		    		dataType : "JSON",
		    		data : {"mem_id" : "${SESSION_MEMBERVO.mem_id}", "chat_content" : $(".chatroomSeach").val()},
				success : function(result) {
					$(".chatRooms").hide();
					
					for(var i in result) {
						$(".chatRooms").each(function(index, item){
							 if($(item).attr('role') == result[i]){
								 $(item).show();
							 }
							 
						 });
					}
					$(".chatRooms").get(0).click();
				}
			}); 
	    });
		
		// 이미지 버튼 클릭시 
		$(document).on("click",".imageBtn",function(){
			$("#imageFile").click();
		});
		
		$(document).on("click",".fileBtn",function(){
			$("#userfile").click();
		});
		
		$("#imageFile").on('change',function(){
            
			var form = $('#images')[0];
            var formData = new FormData(form);
            formData.append("chat_code", chat_code);
            formData.append("mem_id", "${SESSION_MEMBERVO.mem_id}");
            formData.append("type", "image");
            
            $.ajax({
                url: '/insertChatcontents',
                enctype : 'multipart/form-data',
    			method : "POST",
    			data : formData,
    			processData : false,
    			contentType : false,
                success: function(result){
                	sock.send(chat_code+"▣"+result+"▣image");
                }
            });
		});
		
		$("#userfile").on('change',function(){
            
			var form = $('#files')[0];
            var formData = new FormData(form);
            formData.append("chat_code", chat_code);
            formData.append("mem_id", "${SESSION_MEMBERVO.mem_id}");
            formData.append("type", "file");
            
            $.ajax({
                url: '/insertChatcontents',
                enctype : 'multipart/form-data',
    			method : "POST",
    			data : formData,
    			processData : false,
    			contentType : false,
                success: function(result){
                	sock.send(chat_code+"▣"+result+"▣file");
                }
            });
		});
		
		// 방 html 불러오기
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
		
		// 보내기 버튼 클릭시 방만들기 및 서버에 메세지 보내기
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
					
					 $.ajax({
			   				type : "POST",
			   		    		url : "/insertChatRoom", 
			   		    		dataType : "JSON",
			   		    		data : {"chat_code" : chat_code, "chat_member" : $("input[name='chat_member']").val(), "chat_name" : $("input[name='chat_name']").val(), "chat_content" : $("div[name='chat_content']").html()},
			   				success : function(result) {
			   					var str = result;
			   					var contents = str.split("=")[1];
			   					chat_code = str.split("=")[0];
			   					sock.send(chat_code+"▣"+contents+"▣room");
			   					Cookies.remove('chat_code');
			   					$('#sendMeseage').html('');
			   				}
		   				}); 
					$("#produceRoomBtn").attr('class','btn btn-link produceRoomBtn');
				}else{
					 sendMessage();
		             $('#sendMeseage').html('');
				}
		}); 
		$(".chatContentBox").scrollTop(99999999);
	 
		// 웹소켓을 지정한 url로 연결한다.
        sock.onmessage = onMessage;
        sock.onclose = onClose;

        // 메시지 전송
        function sendMessage() {
            sock.send(chat_code+"▣"+$("#sendMeseage").html()+"▣chat");
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
           
        	   $.ajax({
	   				type : "POST",
	   		    		url : "/reflashChatRooms",
	   		    		dataType : "HTML",
	   		    		data : {"chat_code" : chat_code},
	   				success : function(result) {
	   					$(".chatrooms").empty();
	   					$(".chatrooms").html(result);
						if(data == "room"){
							location.href="/mailHome";
						}
	   				}
   				}); 
           
        }

        // 서버와 연결을 끊었을 때
        function onClose(evt) {
           $(".chatContentBox").append("연결 끊김");
        }
        
        
	});
		
        
		//////////////////////////// newList
		// newList 슬라이드
		newList_slide = setInterval("fn_newSlide()", 4000);
		
		// newList 마우스오버 - 슬라이드 멈춤.
		$("#div_newList").on("mouseover", function(){
			newSlide_flag = false;
		});
		$("#div_newList").on("mouseout", function(){
			newSlide_flag = true;
		});		
		
		// newList 슬라이드 버튼 클릭.
		$(".fa-circle").on("click", function(){
// 			alert($(this).index());
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "far fa-circle");
			$(this).attr("class", "fas fa-circle");	
			
			// 이동할 칸 수. (move_page)
			var move_page = ($(this).index()) - (newList_num-1);
			
			// newList_num 변경.
			newList_num = ($(this).index())+1;
			
			// 슬라이드 이동.
			$("#content_newList").stop(true, true);
			var moveX = parseInt($("#content_newList").css("margin-left"));
			
			if( moveX > -3000 ){
				$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
			}
		});
		
		// 채용공고 클릭.
		$(".recr").on("click", function(){
			window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=mail';
		});		
		
		//////////////////////////// newList        
	
       	////////////////////////////newList
       	
       	// div_newList 마우스오버 시 false - 슬라이드 멈춤.
       	var newSlide_flag = true;	
       	
       	// 자동 슬라이드
       	var newSlide_width = 290;
       	var newList_num = 1;
       	
       	function fn_newSlide(){
       		if(newSlide_flag == false){
       			return;
       		}
       		
       		if(newList_num > 6){
//        			clearInterval(slide_switch);
       			$("#content_newList").css("margin-left", "0px");
       			newList_num = 0;
       		}
       		
       		newList_num++;
       		
       		$("#content_newList").stop(true, true);
       		var moveX = parseInt($("#content_newList").css("margin-left"));
       		
       		if( moveX > -2000 ){
       			// 버튼 class 바꾸기.
       			if(newList_num == 1){
       				$(".fa-circle:eq(6)").attr("class", "far fa-circle");
       				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
       			}else{
       				$(".fa-circle:eq("+ (newList_num-2) +")").attr("class", "far fa-circle");
       				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
       			}
       			
       			$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
       		}
       	}	
       	
       	//////////////////////////// newList	
</script>
