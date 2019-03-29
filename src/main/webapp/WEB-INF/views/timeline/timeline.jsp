<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="container">
   <div class="row">
      <div style="margin-top: 101px;">
	      <div class="col-md-3">

	        <div class="panel panel-default">
	          <div class="panel-body">
	            <h4>프로필 정보란</h4>
	            <div class="col-user-bgimg">
	            	<label>배경 사진란</label>
	            	<c:choose>
	            	  <c:when test="${memberVO.mem_division == '1' }"><!-- 일반회원일 경우 -->
	            	    <c:if test="${sessionScope.detailVO.bg_path == null }">
	            	    	<span><a href="#"><img src=""></a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.detailVO.bg_path != null }">
	            	    	<span><a href="#"><img src="sessionScope.detailVO.bg_path"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:when test="${memberVO.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
	            	  	<c:if test="${sessionScope.detailVO.bg_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.detailVO.bg_path != null }"><!-- 관리자일 경우 -->
	            	    	<span><a href="#"><img src="sessionScope.detailVO.bg_path"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:otherwise>
	            	  	<span>관리자 화면용 image(background)</span>
	            	  </c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="col-user-profileimg">
	            	<label>프로필 사진란</label>
	            	<c:choose>
	            	  <c:when test="${memberVO.mem_division == '1' }"><!-- 일반회원일 경우 -->
	            	    <c:if test="${sessionScope.detailVO.profile_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.detailVO.profile_path != null }">
	            	    	<span><a href="#"><img src="sessionScope.detailVO.profile_path"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:when test="${memberVO.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
	            	  	<c:if test="${sessionScope.detailVO.logo_path == null }">
	            	    	<span><a href="#">사진 올리기</a></span>
	            	    </c:if>
	            	    <c:if test="${sessionScope.detailVO.logo_path != null }"><!-- 관리자일 경우 -->
	            	    	<span><a href="#"><img src="sessionScope.detailVO.logo_path"></a></span>
	            	    </c:if>
	            	  </c:when>
	            	  <c:otherwise>
	            	  	<span>관리자 화면용 image(profile)</span>
	            	  </c:otherwise>
	            	</c:choose>
	            </div>
	          </div>
	        </div>
	        <!-- ./profile brief -->
	
	        <!-- friend requests -->
	        <div class="panel panel-default">
	          <div class="panel-body">
	            <h4>팔로우 정보</h4>
	            <ul>
	              <li>
	                <a href="#">팔로우 리스트</a> 
	              </li>
	            </ul>
	          </div>
	        </div>
	        <!-- ./friend requests -->
	      </div>
	      <div class="col-md-6">
	          <div class="input-group">
	          	<button id="btn-write_modal" class="btn-write_modal"  style="height: 73.6px; margin-top: -9px;"><span class="span-text"><a><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></span></button>
	          	<button class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-images"></i></a></span></button>
	          	<button class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-play-circle"></i></a></span></button>
	          	<button class="btn-upload"><span style="font-size: 25px;"><a><i class="far fa-file-alt"></i></a></span></button>
	          </div>
			  <hr>

	        <!-- feed -->
	        <div>
	        
	          <!-- post -->
	          <c:forEach items="${timelinePost }" var="post">
		          
		        <div id="col-post" class="scrolling" data-post="${post.post_code }">
	              <div class="col-post">
		          
	                <div class="col-post-body">
	                  <div class="writer_info">
	                    <h4><a href="#">${post.writer_name }</a></h4>
	                    <span>${post.post_date }</span>
	                  </div>
	                  <div class="post_info">
	                  	<span>${post.post_contents }</span>
	                  </div>
	                </div>

	                <div class="col-post-footer">
					  <span>게시물 하단(동영상 혹은 공유게시물 출력란)</span>
	                </div>

	              </div>
		        </div>

	          </c:forEach>
	          <!-- ./post -->
	        </div>
	        <!-- ./feed -->
	      </div>
	      <div class="col-md-3">
	      <!-- add friend -->
	        <div class="panel panel-default">
	          <div class="panel-body">
	            <h4>광고란</h4>
	            <ul>
	              <li>
	                <a href="#">앙 광고띠</a> 
	              </li>
	            </ul>
	          </div>
	        </div>
	        <!-- ./add friend -->
	      </div>
	  <!-- ./main -->
		<%@ include file="/WEB-INF/views/timeline/writeModal.jsp" %><!-- 모달창 -->
      </div>
   </div>
</div>


<script type="text/javascript">

	$(function () {
		$("#btn-write_modal").on("click", function () {
			$("div.modal").modal();
		});
	});
	
	var lastTop = 0;
	var easeEffect = 'easeInQuint';
	
	//스크롤 이벤트 발생 시
	$(window).scroll(function () {
		
		console.log($(window).scrollTop());
// 		console.log($(document).height());
// 		console.log($(window).height());
		console.log($(document).height() - $(window).height() - 200);
		
		var currentTop = $(window).scrollTop();
		
		if(currentTop >= $(document).height() - $(window).height() - 200){
			
// 			var postData = $(".scrolling:last").attr("data-post");
			var lastPost = $(".scrolling:last").attr("data-post")
			
			$.ajax({
				type : 'POST',
				url : 'timeline',
				headers : {"Content-Type" : "application/json"},
				dataType : 'json',
				data : JSON.stringify({data : lastPost}),
				success : function(data) {
					
					console.log(data);
					if(data != ""){
						for(var i=0; i<5; i++){
							$(".col-md-6").append('<div><div id="col-post"class="scrolling"data-post="${post.post_code }"><div class="col-post"><div class="col-post-body"><div class="writer_info"><h4><a href="#">${post.writer_name}</a></h4><span>${post.post_date}</span></div><div class="post_info"><span>${post.post_contents}</span></div></div><div class="col-post-footer"><span>게시물하단(동영상혹은공유게시물출력란)</span></div></div></div></div>');
						}
					}
				}
			}); //jsp 미사용
			
// 			$.ajax({
// 				type : 'GET',
// 				url : 'appendpost',
// 				headers : {"Content-Type" : "application/json"},
// 				dataType : 'text',
// // 				data : JSON.stringify({data : lastPost}),
// 				success : function(data) {
					
// 					console.log(data);
// 					if(data != ""){
// 						for(var i=0; i<5; i++){
// 							$(".col-md-6").append(data);
// 						}
// 					}
// 				}
// 			}); //jsp 호출
			
		}
		
	
	});

	
</script>




