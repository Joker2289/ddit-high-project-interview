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
	          	<button id="btn-write_modal" class="btn-write_modal"><a><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></button>
	          	<button class="btn-upload"><a><i class="far fa-images"></i></a></button>
	          	<button class="btn-upload"><a><i class="far fa-play-circle"></i></a></button>
	          	<button class="btn-upload"><a><i class="far fa-file-alt"></i></a></button>
	          </div>
			  <hr>
	
	        <!-- feed -->
	        <div>
	        
	          <!-- post -->
	          <c:forEach items="${timelinePost }" var="post">
	            <div class="panel panel-default">
		          <div id="post_data" class="scrolling" data-post="${post }">
	                <div class="panel-body">
	                  <div class="writer_info">
	                    <h4><a href="#">${post.writer_name }</a></h4>
	                    <span>${post.post_date }</span>
	                  </div>
	                  <div class="post_info">
	                  	<span>${post.post_contents }</span>
	                  </div>
	                </div>
	              <div class="panel-footer">
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

<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
   
	$(function () {
		$("#btn-write_modal").on("click", function () {
			$("div.modal").modal();
		});
	});
	
	
	//무한스크롤
	var lastTop = 0;
	
	$(window).scroll(function () {
		var currentTop = $(window).scrollTop(); //현재 스크롤 위치
		
		if(currentTop - lastTop > 0){ // 스크롤을 내릴 때 
			lastTop = currentTop;
		} else {	// 스크롤을 올릴 때
			lastTop = currentTop;
		}
	});
	
	var postData = $(".scrolling:last").attr("data-post");
	
	$.ajax({
		type : 'post',
		url : 'timeline',
		headers : {"Content-Type" : "application/json"},
		dataType : 'json',
		data : JSON.stringify(data),
		success : function (data) {
			var str = "";
			
			if(data != ""){
				$(data).each(
					function () {
						str +=  "<div id='post_data' class='scrolling' data-post='${post }'><div class='panel panel-default'><div class='panel-body'><div class='writer_info'><h4><a href='#'>${post.writer_name}</a></h4><span>${post.post_date}</span></div><div class='post_info'><span>${post.post_contents}</span></div></div><div class='panel-footer'></div></div></div>"
				});
			
				$(".panel panel-default").empty();
				$(".scrollLocation").after(str);
			
			)} else {
				console.log("마지막 페이지입니다.")
			}
		}
	});
	
	
	
	
	//스크롤 이벤트 발생 시
	$(window).scroll(function () {
		
		//현재 스크롤 위치가 화면의 위치보다 클때
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			
		}
	})
	
	
	
	//SmartEditor 
	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	
	$(document).ready(
	  
		function() {
         	// Editor Setting
			nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors, // 전역변수 명과 동일해야 함.
			elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});
	
		// 전송버튼 클릭이벤트
		$("#btn_write").click(function() {
			if (confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
			// 이부분에 에디터 validation 검증
				if (validation()) {
					$("#frm").submit();
				}
			}
		})
	});
	
	// 필수값 Check
	function validation() {
	   var contents = $.trim(oEditors[0].getContents());
	   if (contents === '<p>&nbsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
	      alert("내용을 입력하세요.");
	      oEditors.getById['smarteditor'].exec('FOCUS');
	      return false;
	   }
	
	   return true;
	};
</script>
