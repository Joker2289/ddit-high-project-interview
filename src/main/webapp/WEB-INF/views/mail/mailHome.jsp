<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<a class="chatRoomBox">
					<div class="profileImageBox">
						<div style="background-image: url('/images/profile/basicProfile.png');"></div>
					</div>
					<div class="chatRoomContentsBox">
						<div style="display: flex; color:rgba(0,0,0,.6);">
							<label class="chatRoomMemberBox">김현기 김현기김현기김현기김현기</label>
							<label style="font-size: 14px;">오후 12:50</label>
						</div>
						<div class="chatContentsBox">
							내용ㅁㄴㅇㄻㄴㅇㄻ 내용ㅁㄴㅇㄻㄴㅇㄻ내용ㅁㄴㅇㄻㄴㅇㄻ내용ㅁㄴㅇㄻㄴㅇㄻ내용ㅁㄴㅇㄻㄴㅇㄻ
						</div>
					</div>
				</a>
			</div>
			
			<div class="rightMenuBox">
				<div class="chatAjax">
					<div class="chatRoomTitleBox">
						<div>
							<label >김현기, 박경훈, 박정권 및 장구현</label>
							<label style="color:rgba(0,0,0,.6);">메일 상대 5명</label>
						</div>
						<button class="btn btn-link">
							<i class="fas fa-ellipsis-h"></i>
						</button>
					</div>
					<div class="chatContentBox">
					
					</div>
				
				<div class="chatContentWriteBox">
					<textarea class="form-control" name="" rows="5" placeholder="메일 쓰기 또는 파일 첨부"></textarea>
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

<script type="text/javascript">
	$(document).ready(function() {
		$(".produceRoomBtn").on("click",function(){
			if($("#produceRoomBtn").hasClass('produceRoomBtn')){
				$.ajax({
					type : "POST",
			    		url : "/produceRoomView",
			    		dataType : "HTML",
			    		data : {},
					success : function(result) {
						$(".chatAjax").empty();
						$(".chatAjax").html(result);
						$(".chatAjax").show();
						$(".produceRoomBtn").attr('class','btn btn-link produceRoomBtnOn');
						$(".submitBtn").prop("disabled", true);
					}
				}); 
			}
		});
		
	});
</script>
