<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link href="/css/timeline/writemodal.css" rel="stylesheet">
<div class="container">
   <div class="row">
      <div>
         <div id="col-info" class="col-md-3">
           <div class="panel panel-default" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
             <div class="panel-body">
               <div class="col-user-bgimg">
                  <c:choose>
                    <c:when test="${memberInfo.mem_division == '1' }"><!-- 일반회원일 경우 -->
                      <c:if test="${sessionScope.SESSION_DETAILVO.bg_path == null }">
                        <span><a href="/profileHome"><img class="bg_img" src="/images/profile/basicBackground.png"></a></span>
                      </c:if>
                      <c:if test="${sessionScope.SESSION_DETAILVO.bg_path != null }">
                        <span><a href="/profileHome"><img src="${sessionScope.SESSION_DETAILVO.bg_path }"></a></span>
                      </c:if>
                    </c:when>
                    <c:when test="${memberInfo.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
                       <c:if test="${sessionScope.SESSION_DETAILVO.bg_path == null }">
                         <span><a href="/profileHome"><img class="bg_img" src="/images/profile/basicBackground.png"></a></span>
                      </c:if>
                      <c:if test="${sessionScope.SESSION_DETAILVO.bg_path != null }">
                         <span><a href="/profileHome"><img class="bg_img" src="${sessionScope.SESSION_DETAILVO.bg_path }"></a></span>
                      </c:if>
                    </c:when>
                    <c:otherwise>
                       <span>관리자 화면용 image(background)</span>
                    </c:otherwise>
                  </c:choose>
               </div>
               <div class="col-user-profileimg">
                  <c:choose>
                    <c:when test="${memberInfo.mem_division == '1' }"><!-- 일반회원일 경우 -->
                      <c:if test="${sessionScope.SESSION_DETAILVO.profile_path == null }">
                         <span><a href="/profileHome"><img class="profile_img"  src="/images/profile/profile_noimage.jpg" ></a></span>
                      </c:if>
                      <c:if test="${sessionScope.SESSION_DETAILVO.profile_path != null }">
                        <span><a href="/profileHome"><img src="${sessionScope.SESSION_DETAILVO.profile_path }"></a></span>
                      </c:if>
                    </c:when>
                    <c:when test="${memberInfo.mem_division == '2' }"><!-- 회사일 경우ㅡ -->
                       <c:if test="${sessionScope.SESSION_DETAILVO.logo_path == null }">
                        <span><a href="/profileHome"><img class="profile_img" src="/images/profile/profile_noimage.jpg" ></a></span>
                      </c:if>
                      <c:if test="${sessionScope.SESSION_DETAILVO.logo_path != null }">
                        <span><a href="/profileHome"><img class="profile_img" src="${sessionScope.SESSION_DETAILVO.logo_path }"></a></span>
                      </c:if>
                    </c:when>
                    <c:otherwise>
                       <span>관리자 화면용 image(profile)</span>
                    </c:otherwise>
                  </c:choose>
               </div>
               <div style="text-align: center;">
                 <c:choose>
                   <c:when test="${memberInfo.mem_division == '1' }">
                     <h4>${SESSION_DETAILVO.user_name }님! 어서오세요!</h4>
                   </c:when>
                   <c:when test="${memberInfo.mem_division == '2' }">
                     <h4>${SESSION_DETAILVO.corp_name }님!</h4>
                     <h4>어서오세요!</h4>
                   </c:when>
                   <c:otherwise>
                     <h4>금일 업데이트된 신고 목록을</h4>
                     <h4>확인해주세요</h4>
                   </c:otherwise>
                 </c:choose>
               </div>
               <div class="col-etcinfo">
                 <c:choose>
                   <c:when test="${memberInfo.mem_division == '1' }">
                     <!-- 일촌 수 조회 -->
                    <pre style="background: #fff; border-color: #fff;"><a href="/personalConnection"><span>일촌 수<span style="float: right;">${connectionCnt }</span></span></a></pre>
                    <!-- 저장한 글 수 조회 -->
                       <pre style="background: #fff; border-color: #fff;"><a href="#"><span>저장한 글<span class="txt_save_count" style="float: right;">${savepostCnt }</span></span></a></pre>
                   </c:when>
                   <c:when test="${memberInfo.mem_division == '2' }">
                       <pre style="background: #fff; border-color: #fff;"><a href="#"><span>저장한 글<span class="txt_save_count" style="float: right;">${savepostCnt }</span></span></a></pre>
                   </c:when>
                 </c:choose>
               </div>
             </div>
           </div>
           <!-- ./profile brief -->
   
           <!-- friend requests -->
           <div class="panel panel-default" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
             <div class="panel-body">
               <a href="#"><h4>팔로우한 해시태그</h4></a>
               <ul>
                 <c:choose>
                   <c:when test="${followHashtag eq 'notfollow'}">
                        <li>팔로우한 태그가 없다요.</li>
                        <li>해시태그를 팔로우 해보세요!</li>
                    </c:when>
                    <c:otherwise>
                     <c:forEach items="${followHashtag }" var="hashtags">
                        <li>
                          <a href="#">${hashtags.ref_keyword }</a>
                        </li>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>     
               </ul>
             </div>
             <div>
                 <button type="button" class="btn_moretag">더보기</button>
              </div>
           </div>
           <!-- ./friend requests -->
         </div>
         
         <div class="col-md-6">
           <div class="input-group" style="padding-left: 15px; box-shadow: 0 0px 0 rgba(0,0,0,0);">
             <h3>저장한 글</h3>
           </div><hr>
           
           <!-- feed -->
           <div class="post-group">
             <!-- post -->
             <c:forEach items="${savePost }" var="post">
                
              <div id="col-post${post.post_code }" class="scrolling" data-post="${post.post_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
              <div class="col-post" id="post${post.post_code }">
               <div class="col-post-body">
                 <a href="#" >
                  <div class="writer_info" style="float: left;">
                    <a style="font-size: 20px;" href="#">${post.writer_name }</a>
                    <c:choose>
                      <c:when test="${post.resultMinute <= 1 }">
                        <span>방금 전</span>
                      </c:when>
                      <c:when test="${post.resultMinute < 60 }">
                          <span>${post.resultMinute }분 전</span>
                        </c:when>
                        <c:when test="${post.resultMinute < 1440 }">
                          <span>${fn:split((post.resultMinute/60), '.')[0] }시간 전</span>
                        </c:when>
                        <c:when test="${post.resultMinute < 43200 }">
                          <span>${fn:split((post.resultMinute/1440),'.')[0] }일 전</span>
                        </c:when>
                        <c:when test="${post.resultMinute < 518400 }">
                          <span>${fn:split((post.resultMinute/43200),'.')[0] }달 전</span>
                        </c:when>
                    </c:choose>
                  </div>
                 </a>
                 <!-- 게시물 관리버튼(dropdown) -->
                  <div class="dropdown" style="float: right;">
                   <button class="btn_postControll" data-code="${post.post_code }" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;">
                      <i class="fas fa-ellipsis-h"></i>
                   </button>
                   <c:choose>
                     <c:when test="${post.mem_id eq memberInfo.mem_id }">
                     <ul class="dropdown-menu manage_mypost" role="menu" aria-labelledby="dLabel">
                            <button id="btn_modifyPost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_modifyPost">
                              <i class="fas fa-edit"></i>&nbsp;<span>글 수정</span>
                           </button>
                            <button id="btn_deletePost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_deletePost">
                              <i class="far fa-trash-alt"></i>&nbsp;<span>글 삭제</span>
                          </button>
                            <button id="btn_blockComment${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_blockComment">
                              <i class="fas fa-comment-slash"></i>&nbsp;<span>댓글 차단</span>
                           </button>
                       </ul>
                     </c:when>
                     <c:otherwise>
                       <ul class="dropdown-menu manege_post" role="menu" aria-labelledby="dLabel">
                            <button id="btn_hidePost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_hidePost" style="padding-right: 65.69px;">
                              <i class="far fa-eye-slash">&nbsp;</i><span>글 숨기기</span>
                           </button>
                            <button id="btn_unfollowWriter${post.post_code }" data-writer="${post.mem_id }" data-name="${post.writer_name }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_unfollow" style="padding-right: 24.33px;">
                              <i class="fas fa-ban"></i>&nbsp;<span>${post.writer_name }&nbsp;언 팔로우</span>
                          </button>
                            <button id="btn_reportPost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list btn_reportPost" style="padding-right: 84.22px;">
                              <i class="far fa-flag"></i>&nbsp;<span>글 신고</span>
                           </button>
                       </ul>
                     </c:otherwise>  
                   </c:choose>
                  </div>
                 
               </div>
               <div class="post_info">
                 <pre class="post_contents" style="background: #ffffff; border-color: #ffffff; margin-left: 9px;">${post.post_contents }</pre>
               </div>
            
               <div class="col-post-footer">
                 <span></span>
               </div>
               
               <!-- 댓글수, 좋아요 수 출력 -->
               <div class="post_socialCount">
                 <ul style="padding-left: 10px;">
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_goodcount" title="goodCount ${post.post_code }" style="font-size: 12px;">추천 
                         <span id="txt_good_count${post.post_code }">${post.goodcount }</span>
                       </button>
                    </li>
                    <li style="list-style: none; float: left;">
                       <button class="btn_count btn_commentcount" id="btn_commentcount${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 
                         <span id="txt_comment_count${post.post_code }">${post.commentcount }</span>
                       </button>
                    </li>
                 </ul>
               </div>
               <div class="col-post-social">
                 <!-- 좋아요 버튼 -->
                 <button class="btn-social btn_good" style="margin-left: 10px; margin-top: 2px;" title="${post.post_code }">
                   <span style="font-size: 18px;">
                     <i id="icon_good${post.post_code }"
                         <c:if test="${not empty goodList}"> 
                           <c:forEach items="${goodList }" var="goodpost">
                             <c:choose>
                               <c:when test="${goodpost.ref_code == post.post_code }">class="fas fa-thumbs-up"</c:when>
                               <c:otherwise>class="far fa-thumbs-up"</c:otherwise>
                             </c:choose>
                           </c:forEach>
                         </c:if>
                         <c:if test="${empty goodList}">class="far fa-thumbs-up"</c:if>>
                     </i>
                   </span>
                 </button>
                 <!-- 댓글 출력 버튼 -->
                 <button class="btn-social btn_comment" id="btn_comment${post.post_code }" data-code="${post.post_code }" title="${post.post_code }"><span style="font-size: 18px;"><i class="far fa-comments"></i></span></button>
                 <!-- 글 저장 버튼 -->
                 <button class="btn-social btn_save" title="${post.post_code }">
                   <span style="font-size: 18px;">
                     <i id="icon_save${post.post_code }"
                       <c:if test="${not empty saveList}">
                         <c:forEach items="${saveList }" var="savepost">
                           <c:choose>
                             <c:when test="${savepost.save_post_code eq post.post_code }">class="fas fa-bookmark"</c:when>
                             <c:when test="${!savepost.save_post_code eq post.post_code }">class="far fa-bookmark"</c:when>
                           </c:choose>
                         </c:forEach>
                       </c:if>
                       <c:if test="${empty saveList}">class="far fa-bookmark"</c:if>>
                     </i>
                   </span>
                 </button>
               </div>
               
               <!-- comment -->
               <div class="col-comment-area ${post.post_code }" id="post_comment ${post.post_code }"></div>
               <!-- /comment -->
            
              </div>
            </div>

             </c:forEach>
             <!-- ./post -->
           </div>
           <!-- ./feed -->
         </div>
         <div id="col-add" class="col-md-3">
         <!-- add friend -->
           <div class="panel panel-default">
             <div class="panel-body">
               <a id="scroll-top" href="#"><h4>광고란</h4></a>
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
      <%@ include file="/WEB-INF/views/timeline/writeModal.jsp" %><!-- 글 작성 모달창 -->
      <%@ include file="/WEB-INF/views/timeline/updateModal.jsp" %><!-- 글 수정 모달창 -->
      <%@ include file="/WEB-INF/views/timeline/reportModal.jsp" %><!-- 글 수정 모달창 -->
      </div>
   </div>
</div>

<script type="text/javascript">
   
   function pushUpdateModal() {
      $("div.updatemodal").modal();
   }
   
   $('#summernote').summernote({
      placeholder: '소식을 업데이트 해주세요!',
        tabsize: 2,
        height: 440,
        maxheight: 600,
        width: 555,
        maxwidth: 555
   });
   
   $("#update_contents").summernote({
        tabsize: 2,
        height: 440,
        maxheight: 600,
        width: 555,
        maxwidth: 555
   });
      
      
   //summernote 툴바 숨기기
   $(".note-toolbar").hide();
   $(".note-resizebar").hide();
   $(".note-status-output").hide();
   
   var ref_code;
   
   $(".btn_moretag").on("click", function() {
         
//       $.ajax({
//          type : 'POST',
//          url : '/',
//          data : {"" : },
//          success : function(data) {
            
//             if(data != ""){
               
//             }
//          }
//       });
      $(".btn_moretag").hide();
   });
      
//    게시글 댓글 버튼 클릭 시 댓글 영역 출력
   var commentFlag = false;
   
   var print_code = "";
   $(".btn_comment").on("click", function() {
      
      print_code = $(this).attr('data-code');
      ref_code = $(this).attr('title');
      
      if (commentFlag == false) {
         $.ajax({
            type : 'POST',
            url : '/commentArea',
            data : {"ref_code" : print_code},
            success : function(data) {
               
               if(data != ""){
                  $('#post' + print_code).append(data);
               }
            }
         });
         commentFlag = true;
      } 
      else {
         commentFlag = false;
         $(".col-comment").remove();
      }
   });
      
   var good_ref_code = "";
   
   $(".btn_good").on("click", function() {
      good_ref_code = $(this).attr('title');
      var good_count = parseInt($('#txt_good_count' + good_ref_code).text());
      
      if($('#icon_good' + good_ref_code).attr("class") == "far fa-thumbs-up"){
         $.ajax({
            type : 'POST',
            url : '/push_postgood',
            data : {"ref_code" : good_ref_code},
            success : function(data) {
               $('#icon_good' + good_ref_code).attr("class", "fas fa-thumbs-up");
               // 추천 수 + 1
               $('#txt_good_count' + good_ref_code).text(good_count + 1);
            }
         });
         
      } else {
         $.ajax({
            type : 'POST',
            url : '/push_postgoodcancel',
            data : {"ref_code" : good_ref_code},
            success : function(data) {
               $('#icon_good' + good_ref_code).attr("class", "far fa-thumbs-up");
               //추천 수 - 1
               $('#txt_good_count' + good_ref_code).text(good_count - 1);
            }
         });
      }
   });
   
   var modify_code = "";
   $('.btn_modifyPost').on("click", function() {
      modify_code = $(this).attr('data-code');
      
   });
   
   var delete_code = "";
   $('.btn_deletePost').on("click", function() {
      delete_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/deletepost',
         data : {"post_code" : delete_code},
         success : function(data) {
            $('#post'+delete_code).remove();
            
            $('#col-post'+delete_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 삭제했습니다.</h4></div>');
            
            
         }
      });
   })
   
   //글 신고
   function pushReportModal() {
      $("div.reportmodal").modal();
   }
   function closeReportModal() {
      $("div.reportmodal").modal('hide');
   }
   
   var report_code = "";
   $('.btn_reportPost').on("click", function() {
      
      pushReportModal();
      
      report_code = $(this).attr('data-code');
      
      $("#btn_report_post").on("click", function() {
         
         var report_contents = $("#report_contents").val();
         
         $.ajax({
            type : 'POST',
            url : '/postreport',
            data : {"post_code" : report_code, "report_contents" : report_contents},
            success : function(data) {
               
               closeReportModal();
               $('#post'+report_code).remove();
               $('#col-post'+report_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 신고했습니다.<br> 이 업데이트는 더 이상 표시되지 않습니다. </h4></div>');
               
            }
         });
      });
      
   });
   
   var writer_id = "";
   var writer_name = "";
   var target_code = "";
   $('.btn_unfollow').on("click", function() {
      writer_id    = $(this).attr('data-writer');
      writer_name = $(this).attr('data-name');
      target_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/unfollow',
         data : {"target_id" : writer_id},
         success : function(data) {
            
            $('#post'+target_code).remove();
            $('#col-post'+target_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>' + writer_name + '님을 언팔로우 했습니다.<br>앞으로 ' + writer_name + '님의 글은 표시되지 않습니다.</h4></div>');
            
         }
      });
   });
   
   var hide_code = "";
   $(".btn_hidePost").on("click", function() {
      hide_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/hidepost',
         data : {"post_code" : hide_code},
         success : function(data) {
            
            $('#post'+hide_code).remove();
            $('#col-post'+hide_code).append('<div style="padding: 15px; background: #fff; border : 1px solid #ddd; border-radius: 4px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);"><h4>글을 숨겼습니다. 이 글은 더 이상 표시되지 않습니다.</h4></div>');
         }
      });
   });
   
   var savepost_code = "";
   $(".btn_save").on("click", function() {
      savepost_code = $(this).attr('title');
      var save_count = parseInt($('.txt_save_count').text());
      
      if($('#icon_save' + savepost_code).attr("class") == "far fa-bookmark"){
         $.ajax({
            type : 'POST',
            url : '/push_postsave',
            data : {"post_code" : savepost_code},
            success : function(data) {
               $('#icon_save' + savepost_code).attr("class", "fas fa-bookmark");
               // 추천 수 + 1
               $('.txt_save_count').text(save_count + 1);
            }
         });
      } else {
         $.ajax({
            type : 'POST',
            url : '/push_postsavecancel',
            data : {"post_code" : savepost_code},
            success : function(data) {
               $('#icon_save' + savepost_code).attr("class", "far fa-bookmark");
               //추천 수 - 1
               $('.txt_save_count').text(save_count - 1);
            }
         });
      }
   });
   
   
   var contents = "";
   $("#btn-write_modal").on("click", function () {
      
      pushModal();
      $("#btn_write_upload").on("click", function() {
         
         $("#frm_writePost").submit();
         
      });
   });
   

   var update_code = "";
   $(".btn_modifyPost").on("click", function() {
      update_code = $(this).attr('data-code');
      
      $.ajax({
         type : 'POST',
         url : '/getpostinfo',
         data : {"post_code" : update_code},
         success : function(data) {
            
            pushUpdateModal();
            $('.note-editable').html(data);
         }
      });
      
      $("#btn_update_post").on("click", function() {
         $("#frm_updatePost").submit();
      });
   });
   
      
   $("#btn-upload-img").on("click", function () {
      pushModal();
      $(".note-insert").children()[1].click();
   });
   
   $("#btn-upload-video").on("click", function () {
      pushModal();
      $(".note-insert").children()[2].click();
   });
   
   $("#btn-upload-document").on("click", function () {
      pushModal();
   });
      
   
   
   //현재 스크롤 위치에서 화면 최상단으로 이동
   $("#scroll-top").on("click", function() {
      $(window).scrollTop() = $(window).height();
   });
   
   
   var pageNum = 2;
   var lastPost;
   
   //스크롤 이벤트 발생 시
   $(window).scroll(function () {
      
      var currentTop = $(window).scrollTop();
      
      if($(window).scrollTop() > 50){
         $("#col-add").stop().animate({top: (currentTop-20) + "px"}, 250);
         $("#col-info").stop().animate({top: (currentTop-20) + "px"}, 250);
      } else {
         $("#col-add").stop().animate({top: 0 + "px"}, 250);
         $("#col-info").stop().animate({top: 0 + "px"}, 250);
      }
      
      lastPost = $(".scrolling:last").attr("data-post");

      if($(window).scrollTop() >= $(document).height() - $(window).height() - 1){
         
         $.ajax({
            type : 'POST',
            url : '/nextsavepost',
            data : {"lastPost" : lastPost, "pageNum" : pageNum},
            success : function(data) {
               
               pageNum++;
               
               if(data != ""){
                  $(".col-md-6").append(data);
               }
            }
         });
      }
   });
   
</script>