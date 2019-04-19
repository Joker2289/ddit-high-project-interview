<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
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
              <pre style="background: #fff; border-color: #fff;"><a href="/savepost"><span>저장한 글<span class="txt_save_count" style="float: right;">${savepostCnt }</span></span></a></pre>
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
                 <a href="/hashtagpost?hashtag_name=${fn:split(hashtags.ref_keyword,'#')[0] }">${hashtags.ref_keyword }</a>
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